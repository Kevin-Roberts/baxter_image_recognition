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

            #
            # config file:
            # Table Height: table_height
            #
            # Blackout: blackout_y_pixel
            #
            # Color#1: x y
            # Color#2: x y
            # etc for all colors
            #

            f.write("Table Height: " + str(self.move.table_height) + "\n\n")

            self.find_blocks()

            # get the maximum y of a block for blacking out the bottom of the picture
            miny = 0
            for color in self.block_list:
                for blocknum in self.block_list[color]:
                    miny = min(miny, self.block_list[color][blocknum][0])

            # subtract 2 from min to account for slight variations
            f.write("Blackout: " + str(miny - 2) + "\n\n")

            for color in self.block_list:
                if len(self.block_list[color]) == 1:
                    f.write(color + ": " + str(self.box_list[color][0].pose.position.x - 0.1) + " " + str(self.block_list[color][0].pose.position.y) + "\n")
                else:
                    print "ERROR: Baxter recognized " + str(len(self.block_list[color])) + " blocks of color:" + color
                    print "Expected 1"

                    f.close()
                    sys.exit(1)

            print "Configuration completed successfully. Stored in config.txt"
        else:
            #
            # config file:
            # Table Height: table_height
            #
            # Blackout: blackout_y_pixel
            #
            # Color#1: x y
            # Color#2: x y
            # etc for all colors
            #

            #Load config file
            f = open('config.txt','r')

            # table height line
            line = f.readline()
            splitline = line.split(":")

            if len(splitline) != 2 or splitline[0] != "Table Height":
                print "ERROR: config file not in expected state."
                f.close()
                sys.exit(1)

            self.move.table_height = float(splitline[1].strip())

            # read blackout
            f.readline()
            line = f.readline()
            splitline = line.split(":")

            if len(splitline) != 2 or splitline[0] != "Blackout":
                print "ERROR: config file not in expected state."
                f.close()
                sys.exit(1)

            # this doesn't seem right????
            self.right_camera.blackout = float(splitline[1].strip())

            # read the colors
            f.readline()

            while 1:
                line = f.readline()

                if not line:
                    break

                splitline = line.split(":")

                if len(splitline) != 2:
                    print "ERROR: config file not in expected state."
                    f.close()
                    sys.exit(1)

                color = splitline[0]

                if not self.block_list[color]:
                    print "ERROR: config file contains unexpected color " + color
                    f.close()
                    sys.exit(1)

                splitline[1] = splitline[1].strip()

                # get the x and y cords for the color
                splitline = splitline[1].split(" ")

                if len(splitline) != 2:
                    print "ERROR: config file not in expected state."
                    f.close()
                    sys.exit(1)

                self.box_pose[color].position.x = float(splitline[0])
                self.box_pose[color].position.y = float(splitline[1])


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

    while True:
        new_home = mc.move.new_home_pose()
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
        new_home.position.x +=0.13
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
