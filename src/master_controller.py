#!/usr/bin/python

import rospy
import math
from move_controller import MoveController
from image_receiver import ImageReceiver
from image_process import ImageProcessor

class MasterController(object):
	
	def __init__(self, mode = None):
		self.mode = mode;
		if mode == 'blocksort':
			self.ir = ImageReceiver("right_hand_camera")
			self.ip = ImageProcessor()
			self.rh = MoveController('right')
			rospy.init_node("ImageReceiver", anonymous=True)
			self.il.disableCamera()
		    	self.ih.disableCamera()
		    	self.ir.enableCamera()
			self.blueblocklist[] = None
			self.redblocklist[] = None
			self.greenblocklist[] = None
			self.queue = None

	def get_image():
		self.rh.move_to_home()
	    	self.image = ir.getImage()
	     	self.ip.setImage(self.image)

	def find_blocks():
		self.blueblocklist[] = self.ip.findBlock("BLUE")
		#self.redblocklist[] = self.ip.findBlock("RED")
		#self.greenblocklist[] = self.ip.findBlock("GREEN")

	def get_block_coords():
		#

	def sort_blocklist():
		#this can sort the blocks into the queue

	def move_block(block)
		#self.rh.pick_at_pose(block.pose)
		#self.rh.drop_at_pose(box.(block.color).pose) #this will probably change

#Might be nice to have a block class (box class too?). Also, might be useful in image_processor.py
class Block(object):

	def __init__(self,color, pos = None):
		self.color = color
		self.pose = pose
		

def main():
	mc = MasterController('blocksort')
	mc.getImage()
	mc.findBlocks()
	
#	for i in queue:
#		move_block(queue[i])
		


if __name__ == '__main__':
    main()
