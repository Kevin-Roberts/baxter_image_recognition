#!/usr/bin/python

import rospy
import math
from move_controller import MoveController
from image_receiver import ImageReceiver
from image_processor import ImageProcessor
from block import Block

class MasterController(object):
    
    def __init__(self):
        rospy.init_node("senior_design")
        self.right_camera = ImageReceiver("right_hand_camera")
        self.left_camera = ImageReceiver("left_hand_camera")
        self.head_camera = ImageReceiver("head_camera")
        self.move = MoveController('right')
        self.image_processor = ImageProcessor(self.move.home_pose)
        self.left_camera.disableCamera()
        self.head_camera.disableCamera()
        self.right_camera.enableCamera()
        self.blueblocklist = None
        self.orangeblocklist = None
        self.greenblocklist = None
        self.queue = None

    def get_home_image(self):
        self.move.move_to_home()
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
    mc = MasterController()

    #mc.get_image()
    while True:
        mc.find_blocks()
        print "pose:"
        print mc.orangeblocklist[0].pose
        #mc.rh.move_to_pose(mc.blueblocklist[0].pose)
 #	mc.position_above_pose(mc.orangeblocklist[0].pose)
 #	mc.align_pose(mc.orangeblocklist[0].pose, "ORANGE")
 #       mc.move.pick_at_pose(mc.orangeblocklist[0].pose)
 #       mc.move.drop_at_pose(mc.move.home_pose)
        #mc.rh.pick_at_pose(mc.rh.home_pose)
        if mc.are_blocks_near(mc.orangeblocklist[0]):
            print "block near"
        break

    #mc.rh.pick_at_pose(mc.rh.home_pose)

        
def ktest():
    master = MasterController()
    while True:
        master.find_blocks()
        tpose = getBlockPose()



if __name__ == '__main__':
    main()
