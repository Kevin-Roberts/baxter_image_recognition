#!/usr/bin/python

import rospy
import roslib
from cv2 import cv
from cv_bridge import CvBridge, CvBridgeError

from baxter_interface.camera import CameraController

from std_msgs.msg import String
# import inspect
from sensor_msgs.msg import Image

class ImageReceiver(object):

    # I should look into making a method to unsubscribe the image subscriber

    def __init__(self, camera_name):
        topic = "/cameras/" + camera_name + "/image"
        self.camera_name = camera_name
        self.camera_controller = CameraController(camera_name)
        self.image_sub = rospy.Subscriber(topic, Image, self._callback)
        self.bridge = CvBridge()
        cv.NamedWindow("Image window", 1)
        self.cv_image = None
        self.raw_image = None

    def _callback(self, data):
        self.raw_image = data
        try:
            self.cv_image = self.bridge.imgmsg_to_cv(data, "bgr8")
        except CvBridgeError, e:
            print e

        # Not totally sure what this is going for but I left it for now because I assume it matters for the show image deal.
        (cols, rows) = cv.GetSize(self.cv_image)

        cv.ShowImage("Image window", self.cv_image)
        cv.WaitKey(3)
        
    def enableCamera(self):
        # Do any custom settings first, haven't decided what they are yet
        self.camera_controller.resolution = (1280,800)
        self.camera_controller.open()


    def disableCamera(self):
        self.camera_controller.close()

def main():
    # Basically this is for testing
    ir = ImageReceiver("right_hand_camera")

    # need one of these per process
    rospy.init_node("ImageReceiver", anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print "Ctrl-C Received, Exiting..."
    cv.DestroyAllWindows()


if __name__ == '__main__':
    main()
