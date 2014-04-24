#!/usr/bin/python

import sys
import rospy
import math
import numpy as np
from move_controller import MoveController
from image_receiver import ImageReceiver
from image_processor import ImageProcessor
from block import Block

from geometry_msgs.msg import (
    PoseStamped,
    Pose,
    Point,
    Quaternion,
    )

class MasterController(object):
    box_pose = {}
    box_pose['BLUE'] = Pose(position=Point(
                         x=0.35,
                         y=0.1445 ,
                         z=0),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )
    box_pose['ORANGE'] = Pose(position=Point(
                         x=0.35,
                         y=0.1445 - 16 * .0254,
                         z=0),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )
    box_pose['GREEN'] = Pose(position=Point(
                         x=0.35,
                         y=0.1445 - 28 * .0254,
                         z=0),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )

    def __init__(self, setconfig=False):
        # if setconfig is False:
        #     table_height, mtx, dist, newcameramtx, roi = self.getConfig()
        # else:
        #     table_height, mtx, dist, newcameramtx, roi = None, None, None, None, None

        rospy.init_node("senior_design")
        self.right_camera = ImageReceiver("right_hand_camera")
        self.left_camera = ImageReceiver("left_hand_camera")
        self.head_camera = ImageReceiver("head_camera")
        self.left_camera.disableCamera()
        self.head_camera.disableCamera()
        self.right_camera.enableCamera()
        distortion, camera_matrix = self.right_camera.getIntrinsics()
        print camera_matrix
        print "Distortion:"
        print distortion
        self.move = MoveController('right')
        self.image_processor = ImageProcessor(self.move.home_pose, camera_matrix, distortion)
        self.blueblocklist = None
        self.orangeblocklist = None
        self.greenblocklist = None
        self.queue = None

        # if setconfig:
        #     self.setConfig()


    def setConfig(self):
        self.move.update_table_height()
        table_height = self.move.table_height

        objpoints = []
        imgpoints = []
        found = 0
        while found < 10:
            self.move.move_to_home()
            image = self.right_camera.getImage()
            self.image_processor.setImage(image, undistort=False)
            res = self.image_processor.getCorners((7,6))
            if res:
                objpoints.append(res[0])
                imgpoints.append(res[1])
                found+=1
        mtx, dist, newcameramtx, roi = self.image_processor.calibrateCamera(objpoints, imgpoints)
        # Might have to put table_height into an array (i.e. table_height=[table_height]) or even nparray or write it without savez not certain
        np.savez("config.npz", table_height=table_height, mtx=mtx, dist=dist, newcameramtx=newcameramtx, roi=roi)


    def getConfig(self):
        try:
            npzfile = np.load("config.npz")
            ret = (npzfile['table_height'], npzfile['mtx'], npzfile['dist'], npzfile['newcameramtx'], npzfile['roi'])
        except IOError, e:
            print "Config file not found, run with --config parameter"
            print e
            ret = (None, None, None, None, None)

        return ret

    def get_home_image(self):
        self.move.move_to_home()
        rospy.sleep(0.1)
        image = self.right_camera.getImage()
        self.image_processor.setImage(image)

    def find_blocks(self):
        self.get_home_image()
        self.blueblocklist = self.image_processor.findBlock("BLUE")
        self.orangeblocklist = self.image_processor.findBlock("ORANGE")
        self.greenblocklist = self.image_processor.findBlock("GREEN")

    def position_above_pose(self, pose):
        z_offset = .02
        pose.position.z += z_offset
        self.move.move_to_pose(pose)
        pose.position.z -= z_offset

    def align_pose(self, pose, color):
        self.image_processor.setImage(self.right_camera.getImage())
        self.image_processor.setAlignedPose(pose, color)

    def get_block_coords(self):
        return 0

    def sort_blocklist(self):
        return 0
        #this can sort the blocks into the queue

    def move_block(self, block):
        return 0
        #self.rh.pick_at_pose(block.pose)
        #self.rh.drop_at_pose(box.(block.color).pose) #this will probably change

    def are_blocks_near(self, block):
        xthresh = 0
        ythresh = .074 #~3 inches
        xpose = block.pose.position.x
        ypose = block.pose.position.y
        isclose = False
        
        #print "Current block:________" #debug code
        #print block.pose.position      #debug code

        #check for close blue blocks
        for block2 in self.blueblocklist:
        #    print "Blue block at:"     #debug code
        #    print block2.pose.position #debug code
            if (xpose != block2.pose.position.x) and (ypose != block2.pose.position.y):
                if (math.fabs(xpose - block2.pose.position.x) < xthresh):
                    print "Block at "
                    print block.pose
                    print "is close to blue block in the y direction."
                    isclose = True
                if (math.fabs(ypose - block2.pose.position.y) < ythresh):
                    print "Block at "
                    print block.pose
                    print "is close to blue block in the y direction."
                    isclose = True

        #check for close orange blocks
        for block2 in self.orangeblocklist:
        #    print "Orange block at:"   #debug code
        #    print block2.pose.position #debug code
            if (xpose != block2.pose.position.x) and (ypose != block2.pose.position.y):
                if (math.fabs(xpose - block2.pose.position.x) < xthresh):
                    print "Block at "
                    print block.pose
                    print "is close to orange block in the y direction."
                    isclose = True
                if (math.fabs(ypose - block2.pose.position.y) < ythresh):
                    print "Block at "
                    print block.pose
                    print "is close to orange block in the y direction."
                    isclose = True


        #check for close blue blocks
        for i in self.greenblocklist:
        #    print "Green block at:"    #debug code
        #    print block2.pose.position #debug code
            if (xpose != block2.pose.position.x) and (ypose != block2.pose.position.y):
                if (math.fabs(xpose - block2.pose.position.x) < xthresh):
                    print "Block at "
                    print block.pose
                    print "is close to green block in the y direction."
                    isclose = True
                if (math.fabs(ypose - block2.pose.position.y) < ythresh):
                    print "Block at "
                    print block.pose
                    print "is close to green block in the y direction."
                    isclose = True

        return isclose

        
        

def main():
    

    if len(sys.argv) > 1:
        mc = MasterController(setconfig = True)
        print "Config complete"
        return True
    else:
        mc = MasterController()
    mc.find_blocks()
#    z = mc.move.home_pose.position.z
#    tempz = mc.blueblocklist[0].pose.position.z
#    mc.blueblocklist[0].pose.position.z = z
#    mc.move.move_to_pose(mc.blueblocklist[0].pose)
#    mc.blueblocklist[0].pose.position.z = tempz
    block_list = mc.blueblocklist + mc.orangeblocklist + mc.greenblocklist
    for block in block_list:
        mc.move.pick_at_pose(block.pose)
        print block.pose
#        mc.move.raise_up()
        mc.move.drop_at_pose(mc.box_pose[block.color])
#    while True:
#        mc.find_blocks()
#        print "pose:"
#        print mc.orangeblocklist[0].pose
        #mc.rh.move_to_pose(mc.blueblocklist[0].pose)
 #	mc.position_above_pose(mc.orangeblocklist[0].pose)
 #	mc.align_pose(mc.orangeblocklist[0].pose, "ORANGE")
 #       mc.move.pick_at_pose(mc.orangeblocklist[0].pose)
 #       mc.move.drop_at_pose(mc.move.home_pose)
        #mc.rh.pick_at_pose(mc.rh.home_pose)
#        if mc.are_blocks_near(mc.orangeblocklist[0]):
#            print "block near"
   #     break

    #mc.rh.pick_at_pose(mc.rh.home_pose)

        
def ktest():
    master = MasterController()
    while True:
        master.find_blocks()
        tpose = getBlockPose()



if __name__ == '__main__':
    main()
