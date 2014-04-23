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
COLOR_RANGES = {"BLUE":[np.array([110,50,50]), np.array([130,255,255])],
                "ORANGE":[np.array([0,50,50]), np.array([20,255,255])],
                "GREEN":[np.array([80,50,50]), np.array([110,255,255])],
                "BLACK":[] }

SIZE = 150
DEFAULT_PIXELS_PER_METER = 15.5 / 2.54 * 100
DEFAULT_HOME_HEIGHT = 25.875 * 2.54 / 100
#GRIPPER_LENGTH = 3.875 * 2.54 / 100
GRIPPER_LENGTH = 4.5 * 2.54 / 100
PIXELS_PER_METER_CLOSE = 100 / 2.54 * 100

#PIXELS_PER_INCH = 15.5
# this is for angle calculation
#HEIGHT_OF_OUR_HOME = 25.875 # this is with 0.45 as the z
#GRIPPER_LENGTH = 3.875

class ImageProcessor(object):
    def __init__(self, home_pose, table_height, mtx, dist, newcameramtx, roi, cv_image = None):
        self.setImage(cv_image)

        self.home_pose = home_pose
        self.home_height = home_height
        if table_height is None:
            self.home_height = DEFAULT_HOME_HEIGHT
            self.table_height = home_pose.position.z - DEFAULT_HOME_HEIGHT
        else:
            self.table_height = table_height
            self.home_height = home_pose.position.z - table_height

        self.pixels_per_meter = DEFAULT_HOME_HEIGHT / home_height * DEFAULT_PIXELS_PER_METER
        self.mtx = mtx
        self.dist = dist
        self.newcameramtx = newcameramtx
        self.roi = roi


    def calibrateCamera(self):
        # Set the chessboard image as self.cv_image prior to calling this. 
        criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)
        # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
        objp = np.zeros((6*7,3), np.float32)
        objp[:,:2] = np.mgrid[0:7,0:6].T.reshape(-1,2)

        # Arrays to store object points and image points from all the images.
        objpoints = [] # 3d point in real world space
        imgpoints = [] # 2d points in image plane.

        gray = cv2.cvtColor(self.cv_image,cv2.COLOR_BGR2GRAY)

        # Find the chess board corners
        ret, corners = cv2.findChessboardCorners(gray, (7,6),None)

        # If found, add object points, image points (after refining them)
        if ret == True:
            objpoints.append(objp)

            corners2 = cv2.cornerSubPix(gray,corners,(11,11),(-1,-1),criteria)
            imgpoints.append(corners2)

            # Draw the corners, will eventually get rid of this
            cv2.drawChessboardCorners(self.cv_image, (7,6), corners2,ret)
            self.writeImage()
        else:
            print "Pattern Not found! Skipping Camera Calibration"
            return False

        ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, gray.shape[::-1],None,None)

        h,  w = self.cv_image.shape[:2]
        newcameramtx, roi=cv2.getOptimalNewCameraMatrix(mtx,dist,(w,h),1,(w,h))

        return (mtx, dist, newcameramtx, roi)


    def undistortImage(self, cv_image):
        # undistort
        dst = cv2.undistort(cv_image, mtx, dist, None, newcameramtx)

        # crop the image
        x,y,w,h = roi
        dst = dst[y:y+h, x:x+w]
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

        print image_x
        print image_y

        print self.im_height
        print self.im_width

        print "\n"

        print image_x - self.im_width/2
        print self.pixels_per_meter

        print "\n"

        print self.home_pose.position.x

        return Pose(
                position = Point(
                            x = self.home_pose.position.x - (image_y - self.im_height/2) / self.pixels_per_meter + .0254 * 1.0,
                            y = self.home_pose.position.y - (image_x - self.im_width/2) / self.pixels_per_meter + .0254 * 1.25,
                            z = self.home_pose.position.z - self.home_height + GRIPPER_LENGTH),
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

        mask = cv2.inRange(self.hsv_image, c_range[0], c_range[1])
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

    def findBlock(self, color, pic_pose = self.home_pose):
        c_range = COLOR_RANGES.get(color,None)

        if c_range is None:
            print "Invalid Color"
            return None

        # Extract new range of color
        mask = cv2.inRange(self.hsv_image, c_range[0], c_range[1])

        # Find color boundaries
        contours, hierarchy = cv2.findContours(mask,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)

        # Only save large area shapes, ignore small specs of color matching
        blocks = []

        for contour in contours:
            area = cv2.contourArea(contour)

            if area > SIZE:
                blocks.append(contour)

        # get list of blocks, box has the corner coordinates of each block in pixels
        blockList = []
        for i in range(0, len(blocks)):
            rect = cv2.minAreaRect(blocks[i])
            box = cv2.cv.BoxPoints(rect)
            box = np.int0(box)

            blockList.append(Block(color, self.boxCordsToPose(box)));
            
            cv2.drawContours(self.cv_image, [box], 0, (255,0,0), 2)

        cv2.imwrite('test.png', self.cv_image)
        cv2.imwrite('output' + color + '.png', mask)

        return blockList

    def getBlockPose(self, pic_pose, box):
        image_x = (box[0][0] + box[2][0]) / 2
        image_y = (box[0][1] + box[2][1]) / 2
        pixels_per_meter = DEFAULT_HOME_HEIGHT / (pic_pose.position.z - self.table_height) * DEFAULT_PIXELS_PER_METER

        newPose = Pose(
                position = Point(
                            x = pic_pose.position.x - (image_y - self.im_height/2) / pixels_per_meter + .0254 * 1.0,
                            y = pic_pose.position.y - (image_x - self.im_width/2) / pixels_per_meter + .0254 * 1.25,
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