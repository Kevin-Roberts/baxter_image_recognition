#!/usr/bin/python

import numpy as np
import cv2


# Perhaps we should stretch (and widen) the green and blue ranges up and down five
# Then no values from 100-110 would be missing
COLOR_RANGES = {"BLUE":[np.array([110,50,50]), np.array([130,255,255])],
                "RED":[np.array([0,50,50]), np.array([20,255,255])],
                "YELLOW":[],
                "GREEN":[np.array([80,50,50]), np.array([100,255,255])],
                "BLACK":[] }

SIZE = 1000
PIXELS_PER_INCH = 15.5
# this is for angle calculation
HEIGHT_OF_OUR_HOME = 25.875      # this is with 0.45 as the z
GRIPPER_LENGTH = 3.875


class ImageProcessor(object):

    def __init__(self, cv_image = None):
        self.cv_image = cv_image
        if cv_image is None:
            self.hsv_image = None
        else:
            self.hsv_image = cv2.cvtColor(cv_image,cv2.COLOR_BGR2HSV)

    def setImage(self, cv_image):
        self.cv_image = cv_image
        self.hsv_image = cv2.cvtColor(cv_image,cv2.COLOR_BGR2HSV)
    
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
        # Draw the contours on mask just so that we can see that it worked.
        #cv2.drawContours(mask, blocks, -1, (255,0,0), 3)
        cv2.imwrite('test.png',self.cv_image)

        # Find the corners of each found block
        boxList = []
        for i in range(0, len(blocks)):
            rect = cv2.minAreaRect(blocks[0])
            box = cv2.cv.BoxPoints(rect)
            box = np.int0(box)
            boxList.append(box)
            print "Block %d Corner Coordinates" % i
            print box
            cv2.drawContours(mask, [box], 0, (255,0,0), 2)
            
        cv2.imwrite('output' + color + '.png',mask)

        # Not sure if this is the exact thing I want returned but I will want something like this I'm sure....
        return boxList
