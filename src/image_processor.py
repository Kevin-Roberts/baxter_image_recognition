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

#PIXELS_PER_INCH = 15.5
# this is for angle calculation
#HEIGHT_OF_OUR_HOME = 25.875 # this is with 0.45 as the z
#GRIPPER_LENGTH = 3.875

class ImageProcessor(object):

    def __init__(self, home_pose, home_height = DEFAULT_HOME_HEIGHT, cv_image = None):
        self.setImage(cv_image)

        self.home_pose = home_pose
        self.home_height = home_height

        self.pixels_per_meter = DEFAULT_HOME_HEIGHT / home_height * DEFAULT_PIXELS_PER_METER

    def setImage(self, cv_image):
        if cv_image is None:
            self.hsv_image = None
            self.cv_image = None

            self.im_width = 0
            self.im_height = 0
        else:
            self.cv_image = cv_image
            self.hsv_image = cv2.cvtColor(cv_image,cv2.COLOR_BGR2HSV)

            self.im_width, self.im_height = cv2.cv.GetSize(cv2.cv.fromarray(cv_image))

    def boxCordsToPose(self, box):
        image_x = (box[0][0] + box[2][0]) / 2
        image_y = (box[0][1] + box[2][1]) / 2
        '''
        pose = copy.deepcopy(self.home_pose);
        pose.position.x = self.home_pose.position.x - (image_x - self.im_width/2) / self.pixels_per_meter
        pose.position.y = self.home_pose.position.y - (image_y - self.im_height/2) / self.pixels_per_meter
        pose.position.z = self.home_pose.position.z - self.home_height + GRIPPER_LENGTH

        print self.home_pose

        return pose
        '''
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

    def findBlock(self, color):
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


        cv2.imwrite('test.png', self.cv_image)

        # get a list of blocks
        # box has the corner coordinates of each block in pixels
        blockList = []
        for i in range(0, len(blocks)):
            rect = cv2.minAreaRect(blocks[i])
            box = cv2.cv.BoxPoints(rect)
            box = np.int0(box)

            blockList.append(Block(color, self.boxCordsToPose(box)));

            cv2.drawContours(mask, [box], 0, (255,0,0), 2)

        # Not sure if this is the exact thing I want returned but I will want something like this I'm sure....
        cv2.imwrite('output' + color + '.png', mask)

        return blockList
