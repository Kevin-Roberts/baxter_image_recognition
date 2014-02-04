__author__ = "Kevin Roberts"
__date__ = "02/04/2014"

import numpy as np
import cv2

im = cv2.imread('blocks.jpg')
# Convert to HSV, easier to isolate colors
hsv = cv2.cvtColor(im,cv2.COLOR_BGR2HSV)
# Range of color
lower_blue = np.array([105,50,50])
upper_blue = np.array([115,255,255])
# Extract new range of color
mask = cv2.inRange(hsv, lower_blue, upper_blue)
# AND with original image
res = cv2.bitwise_and(im,im, mask= mask)
# Find color boundaries
contours, hierarchy = cv2.findContours(mask,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)

# Only save large area shapes, ignore small specs of color matching
blocks = []
for contour in contours:
	area = cv2.contourArea(contour)
	if area > 1000:
		blocks.append(contour)
# Draw the contours
cv2.drawContours(mask, blocks, -1, (255,0,0), 3)
	
# Save the image
cv2.imwrite('output.jpg',mask)