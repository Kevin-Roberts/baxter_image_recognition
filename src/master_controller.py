#!/usr/bin/python

import sys
import rospy
import math
import cv2
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
    box_pose['PURPLE'] = Pose(position=Point(
                         x=0.31,
                         y=0.1445 ,
                         z=0.1),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )
    box_pose['ORANGE'] = Pose(position=Point(
                         x=0.31,
                         y=0.1445 - 36 * .0254,
                         z=0.1),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )
    box_pose['GREEN'] = Pose(position=Point(
                         x=0.31,
                         y=0.1445 - 27 * .0254,
                         z=0.1),             
                    orientation=Quaternion(
                         x=0,
                         y=math.pi/4,
                         z=0,
                         w=0,),
                 )

    def __init__(self, setconfig=False):
        rospy.init_node("senior_design")
        self.right_camera = ImageReceiver("right_hand_camera")
        self.left_camera = ImageReceiver("left_hand_camera")
        self.head_camera = ImageReceiver("head_camera")
        self.left_camera.disableCamera()
        self.head_camera.disableCamera()
        self.right_camera.enableCamera()
        distortion, camera_matrix = self.right_camera.getIntrinsics()
        self.move = MoveController('right')
        self.image_processor = ImageProcessor(self.move.home_pose, camera_matrix, distortion)
        self.block_list = {'PURPLE':[], 'ORANGE':[], 'GREEN':[]}
        if setconfig:
            self.move.update_table_height()
            f = open('config.txt','w')
            outStr = "TABLE_HEIGHT:" + str(self.move.table_height) + "\n"
            f.write(outStr)
            self.find_blocks()
            blackoutval = -100 
            for color in self.block_list:
                maxxvalue = -100
                for block in self.block_list[color]:
                    if block.pose.position.x > maxxvalue:
                        maxxvalue = block.pose.position.x
                        self.box_pose[color] = block.pose
                        if maxxvalue > blackoutval:
                            blackoutval = maxxvalue
                            blackoutblock = block

                if maxxvalue == -100:
                    print "ERROR ALL THREE COLORS NOT DETECTED MISSING " + color + " BLOCK"
                    sys.exit()
                else:
                    outStr = color + ":" + str(self.box_pose[color].position.x-0.8) + "," + str(self.box_pose[color].position.y) + "\n"
                    f.write(outStr)

            coord = blackoutblock.coord
            self.image_processor.blackout = min(coord[0][1], coord[2][1])
            outStr = "BLACKOUT:" + str(self.image_processor.blackout) + "\n"
            f.write(outStr)
            f.close()
        else:
            #Load config file
            f = open('config.txt','r')
            newLine = f.readline()
            while newLine != "":
                newLine = newLine.split(":")
                if len(newLine) == 2:
                    if newLine[0] == "TABLE_HEIGHT":
                        self.move.table_height = float(newLine[1])
                        self.image_processor.table_height = float(newLine[1])
                        self.update_home_pose(self.move.home_pose)
                    if newLine[0] == "BLACKOUT":
                        print int(newLine[1])
                        self.image_processor.blackout = int(newLine[1])
                    if self.box_pose.get(newLine[0],None) != None:
                        coords = newLine[1].split(",")
                        if len(coords) == 2:
                            self.box_pose[newLine[0]].position.x = float(coords[0])
                            self.box_pose[newLine[0]].position.y = float(coords[1])
                        else:
                            print "INVALID CONFIG FILE SHOULD BE COLOR:X,Y" + str(newLine)
                            sys.exit()    
                newLine = f.readline()          
            f.close()              

            

    def update_home_pose(self, pose):
        self.image_processor.update_home_pose(pose)
        self.move.home_pose = pose

    def get_home_image(self):
        self.move.move_to_home()
        rospy.sleep(0.1)
        image = self.right_camera.getImage()
        self.image_processor.setImage(image)

    def find_blocks(self):
        self.get_home_image()
        self.block_list['PURPLE'] = self.image_processor.findBlock("PURPLE")
        #print "Found " + str(len(self.block_list['PURPLE'])) + " purple blocks"
        self.block_list['ORANGE'] = self.image_processor.findBlock("ORANGE")
        #print "Found " + str(len(self.block_list['ORANGE'])) + " orange blocks"
        self.block_list['GREEN'] = self.image_processor.findBlock("GREEN")
        #print "Found " + str(len(self.block_list['GREEN'])) + " green blocks"

    def position_above_pose(self, pose):
        z_offset = .02
        pose.position.z += z_offset
        self.move.move_to_pose(pose)
        pose.position.z -= z_offset

    def align_pose(self, pose, color):
        self.image_processor.setImage(self.right_camera.getImage())
        self.image_processor.setAlignedPose(pose, color)

    def sort_blocklist(self):
        #Could choose the order they are grabbed in? Look through each block list
        return 0


    def are_blocks_near(self, block):
        xthresh = 0
        ythresh = .074 #~3 inches
        xpose = block.pose.position.x
        ypose = block.pose.position.y
        isclose = False

        #print "Current block:________" #debug code
        #print block.pose.position      #debug code

        #check for close blue blocks
        for color in self.block_list:
            for block2 in self.block_list[color]:
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

        return isclose

    def get_blocks(self, trials=2, miss_per_trial = 2):
        result = 0

        for i in range(trials):
            self.find_blocks()
            num_missed = 0
            for color in self.block_list:
                for block in self.block_list[color]:
                    result = self.move.pick_at_pose(block.pose)
                    # result == 0 means block pose was valid, if it wasn't go to the next block
                    if result == 0:
                        self.move.raise_up(block.pose)
                        if not self.move.gripper.gripping():
                            self.move.gripper.open(block=False)
                            num_missed +=1
                            if num_missed == miss_per_trial:
                                break
                        else:
                            self.move.drop_at_pose(self.box_pose[color])
                if num_missed == miss_per_trial:
                    # want to break two loops when the gripper doesn't grip
                    break
            if num_missed == 0:
                # Would mean that all blocks were found in the picture
                return num_missed
        return num_missed  


def main():
    if len(sys.argv) > 1:
        mc = MasterController(setconfig = True)
        print "Config complete"
        return True
    else:
        mc = MasterController()
      
    """
    p = 0
    f = 0

    for i in xrange(0, 5):
        mc.find_blocks()

        if (len(mc.block_list['PURPLE']) != 4 or
            len(mc.block_list['ORANGE']) != 4 or
            len(mc.block_list['GREEN']) != 4):

            failstring = ""

            if (len(mc.block_list['PURPLE']) != 4):
                failstring += "PURPLE FAILED\t"

            if (len(mc.block_list['ORANGE']) != 4):
                failstring += "ORANGE FAILED\t"

            if (len(mc.block_list['GREEN']) != 4):
                failstring += "GREEN FAILED\t"

            cv2.imwrite("testimages/fail_" + str(f) + ".png", mc.image_processor.cv_image)

            f += 1
        else:
            p += 1

            cv2.imwrite("testimages/pass_" + str(p) + ".png", mc.image_processor.cv_image)

        print "Pass: " + str(p) + "\tFail: " + str(f)

    """
    while True:
        new_home = mc.move.new_home_pose()
        mc.update_home_pose(new_home)
        mc.get_blocks()
 
        new_home = mc.move.new_home_pose()
        new_home.position.x +=0.13
        mc.update_home_pose(new_home)
        mc.get_blocks()

        new_home = mc.move.new_home_pose()
        new_home.position.y += 0.2 
        mc.update_home_pose(new_home)
        mc.get_blocks()

        new_home = mc.move.new_home_pose()
        new_home.position.y -= 0.2
        mc.update_home_pose(new_home)
        mc.get_blocks()

        new_home = mc.move.new_home_pose()
        new_home.position.y += 0.2 
        new_home.position.x +=0.13
        mc.update_home_pose(new_home)
        mc.get_blocks()

        new_home = mc.move.new_home_pose()
        new_home.position.y -= 0.2
        new_home.position.x +=0.13
        mc.update_home_pose(new_home)
        mc.get_blocks()
    #mc.find_blocks()


if __name__ == '__main__':
    main()
