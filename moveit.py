#!/usr/bin/python


#To Use this script, first launch....
# rosrun baxter_tools joint_trajectory_action_server.py (Pretty sure that is the correct name/location)
# roslaunch move_group.launch (if this doesn't work then demo_baxter.launch should work for sure)
# python moveit.py

import rospy
from moveit_commander import MoveGroupCommander
from moveit_commander import RobotCommander

if __name__ == '__main__':

    rospy.init_node('moveit_py', anonymous=True)
    robot = RobotCommander()
    print robot.get_group_names()
    #print "hello"
    #group = MoveGroupCommander("right_arm")
    # move to a random target
    x = robot.right_arm.get_current_joint_values()
    print x
    x[1] = x[1] + 0.1
# launching with move_group.launch instead of demo_baxter.launch should get rid of rviz
# if this has no end effector uses end effector from get_end_effector_link
# http://moveit.ros.org/doxygen/classmoveit_1_1planning__interface_1_1MoveGroup.html#a4e8b5b43b1df5e8f3e8c95c25387f45f
    robot.right_arm.set_joint_value_target(x,"right_hand")
    robot.right_arm.go()
    rospy.sleep(1)
    rospy.spin()

