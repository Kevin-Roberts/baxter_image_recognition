#!/usr/bin/python

import numpy as np 
import cv2

COLOR_RANGES = {"BLUE":[np.array([105,50,50]), np.array([115,255,255])],
                "RED":[],
                "YELLOW":[],
                "GREEN":[],
                "BLACK":[] }

class ImageProcessor(object):

    def __init__(self, cv_image):
        self.cv_image = cv_image
        self.hsv_image = cv2.cvtColor(cv_image,cv2.COLOR_BGR2HSV)

    def __init__(self):
        self.cv_image = None
        self.hsv_image = None

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
            if area > 1000:
                blocks.append(contour)
        # Draw the contours on mask just so that we can see that it worked.
        cv2.drawContours(mask, blocks, -1, (255,0,0), 3)
        cv2.imwrite('test.jpg',self.cv_image)
        # Save the image for viewing.
        cv2.imwrite('output' + color + '.jpg',mask)

        # Not sure if this is the exact thing I want returned but I will want something like this I'm sure....
        return (contours,hierarchy)
