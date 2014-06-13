#!/usr/bin/python

import numpy as np
from image_processor import ImageProcessor
import rospy
import roslib
from cv2 import cv
from cv_bridge import CvBridge, CvBridgeError

from baxter_interface.camera import CameraController

from std_msgs.msg import String
# import inspect
from sensor_msgs.msg import Image, CameraInfo

class ImageReceiver(object):

    # I should look into making a method to unsubscribe the image subscriber

    def __init__(self, camera_name):
        self.camera_name = camera_name
        self.camera_controller = CameraController(camera_name)
        self.camera_controller.resolution = (960,600)
        self.image_topic = "/cameras/" + camera_name + "/image"
        self.image_sub = None
        self.bridge = CvBridge()
        self.intrinsics_topic = "/cameras/" + camera_name + "/camera_info"
        self.intrinsics_sub = None
        self.camera_controller.exposure = 99
        self.cv_image = None
        self.raw_image = None


    def _img_callback(self, data):
        self.raw_image = data
        try:
            self.cv_image = np.asarray(self.bridge.imgmsg_to_cv(data, "bgr8"))
        except CvBridgeError, e:
            print e

    def _intrinsics_callback(self, data):
        mat = []
        mat.append([data.K[0],data.K[1],data.K[2]])
        mat.append([data.K[3], data.K[4], data.K[5]])
        mat.append([data.K[6], data.K[7], data.K[8]])
        dist = np.array(data.D)
        mat = np.array(mat)
        print type(dist)
        print type(mat)
        self.distortion = dist
        self.matrix = mat

    def getIntrinsics(self):
        self.distortion = None
        self.matrix = None
        self.intrinsics_sub = rospy.Subscriber(self.intrinsics_topic, CameraInfo, self._intrinsics_callback)
        while self.distortion is None:
            continue
        self.intrinsics_sub.unregister()
        return (self.distortion, self.matrix)
        

    def getImage(self):
        self.cv_image = None
        self.raw_image = None
        self.image_sub = rospy.Subscriber(self.image_topic, Image, self._img_callback)
        while(self.cv_image is None):
            continue
        image = self.cv_image
        self.image_sub.unregister()
        return image
            
        
    def enableCamera(self):
        # Do any custom settings first, haven't decided what they are yet
        # self.camera_controller.resolution = (1280,800)
        self.camera_controller.open()


    def disableCamera(self):
        self.camera_controller.close()

def main():
    # Basically this is for testing
    ir = ImageReceiver("right_hand_camera")
    il = ImageReceiver("left_hand_camera")
    ih = ImageReceiver("head_camera")
    ip = ImageProcessor()
    # need one of these per process
    rospy.init_node("ImageReceiver", anonymous=True)
    il.disableCamera()
    ih.disableCamera()
    ir.enableCamera()
    image = ir.getImage()
    ip.setImage(image)
    ip.findBlock("PURPLE")
    # cv.DestroyAllWindows()


if __name__ == '__main__':
    main()
