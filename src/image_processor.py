#!/usr/bin/python

import numpy as np
import cv2

import math
import copy

from block import Block

from geometry_msgs.msg import (
    PoseStamped,
    Pose,
    Point,
    Quaternion
)


# Perhaps we should stretch (and widen) the green and blue ranges up and down five
# Then no values from 100-110 would be missing
COLOR_RANGES = {"PURPLE":[np.array([120,20,50]), np.array([165,255,255])],
                "ORANGE":[np.array([-10,40,50]), np.array([20,255,255])],
                "GREEN":[np.array([80,40,50]), np.array([110,255,255])],
                "BLACK":[] }

SIZE = 150
DEFAULT_PIXELS_PER_METER = 15 / 2.54 * 100
DEFAULT_HOME_HEIGHT = 25.875 * 2.54 / 100
#GRIPPER_LENGTH = 3.875 * 2.54 / 100
GRIPPER_LENGTH = 4.3 * 2.54 / 100
PIXELS_PER_METER_CLOSE = 100 / 2.54 * 100

#PIXELS_PER_INCH = 15.5
# this is for angle calculation
#HEIGHT_OF_OUR_HOME = 25.875 # this is with 0.45 as the z
#GRIPPER_LENGTH = 3.875

class ImageProcessor(object):
    def __init__(self, home_pose, camera_matrix, distortion, table_height = None, cv_image = None):
        self.setImage(cv_image)

        self.home_pose = home_pose
        if table_height is None:
            self.table_height = home_pose.position.z - DEFAULT_HOME_HEIGHT
        else:
            self.table_height = table_height
        self.pixels_per_meter = DEFAULT_HOME_HEIGHT / (home_pose.position.z - self.table_height) * DEFAULT_PIXELS_PER_METER
        self.camera_matrix = camera_matrix
        self.distortion = distortion
        
    def update_home_pose(self,pose):
        self.home_pose = pose
        self.pixels_per_meter = DEFAULT_HOME_HEIGHT / (pose.position.z - self.table_height) * DEFAULT_PIXELS_PER_METER

    def getCorners(self, dimensions):
        # Set the chessboard image as self.cv_image prior to calling this. 
        criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)
        # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
        objp = np.zeros((dimensions[0]*dimensions[1],3), np.float32)
        objp[:,:2] = np.mgrid[0:dimensions[0],0:dimensions[1]].T.reshape(-1,2)

        # Arrays to store object points and image points from all the images.
        objpoints = [] # 3d point in real world space
        imgpoints = [] # 2d points in image plane.

        gray = cv2.cvtColor(self.cv_image,cv2.COLOR_BGR2GRAY)
        self.writeImage(gray, "test2.png")
        # Find the chess board corners
        ret, corners = cv2.findChessboardCorners(gray, (dimensions[0],dimensions[1]), flags = cv2.CALIB_CB_ADAPTIVE_THRESH + cv2.CALIB_CB_NORMALIZE_IMAGE + cv2.CALIB_CB_FAST_CHECK)

        # If found, add object points, image points (after refining them)
        if ret == True:

            cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),criteria)


            # Draw the corners, will eventually get rid of this
            cv2.drawChessboardCorners(self.cv_image, (dimensions[0],dimensions[1]), corners,ret)
            self.writeImage()
        else:
            print "Pattern Not found! Skipping Camera Calibration"
            return False

        return (objp,corners, gray.shape[::-1])

    def calibrateCamera(self, objpoints, imgpoints, dim):
        ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, dim,None,None)

        h,  w = self.cv_image.shape[:2]
        newcameramtx, roi=cv2.getOptimalNewCameraMatrix(mtx,dist,(w,h),1,(w,h))

        return (mtx, dist, newcameramtx, roi)


    def undistortImage(self, cv_image):
        h,  w = cv_image.shape[:2]
        newcameramtx, roi=cv2.getOptimalNewCameraMatrix(self.camera_matrix,self.distortion,(w,h),1,(w,h))
        dst = cv2.undistort(cv_image, self.camera_matrix, self.distortion, None, newcameramtx)

        # crop the image, I could get roi from camera intrinsics or from cv2.getOptimalNewCameraMatrix. Think its not needed though?
        x,y,w,h = roi
        dst = np.array(dst[y:y+h, x:x+w])
        cv2.imwrite('calibresult.png',dst)  
        return dst

    def setImage(self, cv_image, undistort=True):
        if cv_image is None:
            self.hsv_image = None
            self.cv_image = None

            self.im_width = 0
            self.im_height = 0
        else:
            if undistort:
                self.cv_image = self.undistortImage(cv_image)
            else:
                self.cv_image = cv_image

            self.hsv_image = cv2.cvtColor(self.cv_image,cv2.COLOR_BGR2HSV)

            self.im_width, self.im_height = cv2.cv.GetSize(cv2.cv.fromarray(self.cv_image))  

    def boxCordsToPose(self, box):
        image_x = (box[0][0] + box[2][0]) / 2
        image_y = (box[0][1] + box[2][1]) / 2

        return Pose(
                position = Point(
                            x = self.home_pose.position.x - (image_y - self.im_height/2) / self.pixels_per_meter + .0254*.375, #- .0254 * .375,
                            y = self.home_pose.position.y - (image_x - self.im_width/2) / self.pixels_per_meter + .0254 * 1.625,
                            z = self.table_height + GRIPPER_LENGTH),
                orientation = Quaternion(
                            x = 0,
                            y = math.pi/4,
                            z = 0,
                            w = 0))

    def setAlignedPose(self, pose, color):
        c_range = COLOR_RANGES.get(color,None)

        if c_range is None:
            print "Invalied Color"
            return None

        mask = inRange(self.hsv_image, c_range[0], c_range[1])
        contours, heirarchy = cv2.findContours(mask,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)

        blocks = []
        for contour in contours:
            area = cv2.contourArea(contour)
            if area > 100:
                blocks.append(contour)

        min_offset_dist = 10000
        min_x_offset = 100
        min_y_offset = 100
        for i in range(0, len(blocks)):
            rect = cv2.minAreaRect(blocks[i])
            box = cv2.cv.BoxPoints(rect)
            box = np.int0(box)
            cv2.drawContours(self.cv_image, [box], 0, (255,0,0), 2)
            x_offset = ((box[0][0] + box[2][0]) / 2) - self.im_height / 2
            y_offset = ((box[0][1] + box[2][1]) / 2) - self.im_width / 2
            offset_dist = math.sqrt(x_offset**2 + y_offset**2)
            if offset_dist < min_offset_dist:
                min_offset_dist = offset_dist
                min_x_offset = x_offset
                min_y_offset = y_offset

        self.writeImage()

        pose.position.x -= min_x_offset / PIXELS_PER_METER_CLOSE - .0254 * 1.0
        pose.position.y -= min_y_offset / PIXELS_PER_METER_CLOSE - .0254 * 1.25

    def findBlock(self, color):
        #if pic_pose is None:
        pic_pose = self.home_pose

        c_range = COLOR_RANGES.get(color,None)

        if c_range is None:
            print "Invalid Color"
            return None
        # Extract new range of color
        mask = inRange(self.hsv_image, c_range[0], c_range[1])
        # Find color boundaries
        contours, hierarchy = cv2.findContours(mask,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
        # Only save large area shapes, ignore small specs of color matching
        blocks = []

        for contour in contours:
            area = cv2.contourArea(contour)
            if area > SIZE:
                blocks.append(contour)

        blockList = []
        for i in range(0, len(blocks)):
            rect = cv2.minAreaRect(blocks[i])
            box = cv2.cv.BoxPoints(rect)
            box = np.int0(box)
            blockList.append(Block(color, self.boxCordsToPose(box)));   
            cv2.drawContours(self.cv_image, [box], 0, (255,0,0), 2)

        cv2.imwrite('test' + color + '.png', self.cv_image)

        return blockList

    def getBlockPose(self, pic_pose, box):
        image_x = (box[0][0] + box[2][0]) / 2
        image_y = (box[0][1] + box[2][1]) / 2
        pixels_per_meter = DEFAULT_HOME_HEIGHT / (pic_pose.position.z - self.table_height) * DEFAULT_PIXELS_PER_METER

        newPose = Pose(
                position = Point(
                            x = pic_pose.position.x - (image_y - self.im_height/2) / pixels_per_meter + .0254 * 0.375,
                            y = pic_pose.position.y - (image_x - self.im_width/2) / pixels_per_meter + .0254 * 1.625,
                            z = self.table_height + GRIPPER_LENGTH),
                orientation = Quaternion(
                            x = 0,
                            y = math.pi/4,
                            z = 0,
                            w = 0))  
        return newPose      

    def writeImage(self, img=None, fname=None):
        if fname is None:
            fname = 'test.png'
        if img is None:
            img = self.cv_image
        cv2.imwrite(fname, img)


def inRange(img, low, high):
    if (low[0] < 0):
        low1 = np.array([180 + low[0], low[1], low[2]])
        high1 = np.array([179, high[1], high[2]])

        low[0] = 0

        res = cv2.inRange(img, low, high)
        res1 = cv2.inRange(img, low1, high1)

        return cv2.bitwise_or(res, res1)
    else:
        return cv2.inRange(img, low, high)


def ktest():
    # need to remove table_height / home_height calculation for this to work
    ip = ImageProcessor(None, None, None)
    ip.setImage(cv2.imread("calib_radial.jpg"), undistort=False)
    res = ip.getCorners(dimensions = (7,6))
    if res:
        print ip.calibrateCamera([res[0]], [res[1]], res[2])


if __name__ == "__main__":
    ktest()
