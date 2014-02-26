#!/usr/bin/python

import rospy
import roslib
from cv2 import cv
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
# import inspect
from sensor_msgs.msg import Image

class image_receiver(object):

    def __init__(self, topic):
        self.image_sub = rospy.Subscriber(topic, Image, self.callback)
        self.bridge = CvBridge()
        cv.NamedWindow("Image window", 1)
        self.cv_image = None
        self.raw_image = None

    def callback(self, data):
        print "got here omg"
        self.raw_image = data
        try:
            self.cv_image = self.bridge.imgmsg_to_cv(data, "bgr8")
        except CvBridgeError, e:
            print e

        (cols, rows) = cv.GetSize(self.cv_image)
        if cols > 60 and rows > 60:
            cv.Circle(cv_image, (50,50), 10, 255)

        cv.ShowImage("Image window", cv_image)
        cv.WaitKey(3)
        

def main():
    ir = image_receiver("/cameras/right_hand_camera/image")
    rospy.init_node("ImageReceiver", anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print "Ctrl-C Received, Exiting..."
    cv.DestroyAllWindows()


if __name__ == '__main__':
    main()
