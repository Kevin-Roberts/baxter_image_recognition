#!/usr/bin/python

import rospy
import math
import baxter_interface



from geometry_msgs.msg import (
    PoseStamped,
    Pose,
    Point,
    Quaternion,
    )

from std_msgs.msg import Header

from baxter_core_msgs.srv import (
    SolvePositionIK,
    SolvePositionIKRequest,
    )


# https://github.com/RethinkRobotics/baxter_examples/blob/master/scripts/ik_service_client.py
# https://github.com/RethinkRobotics/baxter_interface/tree/master/src/baxter_interface
class MoveController(object):
    home_pose = Pose(
                 position=Point(
                     x=0.52598,
                     y=0,
                     z=0.45,
                     ),
                 orientation=Quaternion(
                     x=0,
                     y=math.pi/4,
                     z=0,
                     w=0,),
               )
                         
    
    def __init__(self, arm):
        #rospy.init_node("rsdk_ik_service_client")
        self.ns = "ExternalTools/" + arm + "/PositionKinematicsNode/IKService"
        self.iksvc = rospy.ServiceProxy(self.ns, SolvePositionIK)
        self.ikreq = SolvePositionIKRequest()
        self.hdr = Header(stamp=rospy.Time.now(), frame_id='base')
        self.arm = baxter_interface.Limb(arm)
        self.arm.set_joint_position_speed(0.99)
        self.gripper = baxter_interface.Gripper(arm)
        self.gripper.calibrate()
        self.table_height = 0 #self.calc_table_height()
        print self.table_height;

    # I believe the center of ranges are [0.0, -0.55, 0.0, 0.75, 0.0, 1.26, 0.0] (which I believe is x,y,z, x,y,z,w)
    def move_to_pose(self, pose, move=True):
        pose_stamped = PoseStamped(
            header=self.hdr,
            pose = pose
            )

        self.ikreq.pose_stamp.append(pose_stamped)
        try:
            rospy.wait_for_service(self.ns, 5.0)
            resp = self.iksvc(self.ikreq)
        except (rospy.ServiceException, rospy.ROSException), e:
            rospy.logerr("Service call failed: %s" % (e,))
            return -1

        # Not sure if the index can stay 0 or if it needs to be len(resp.isValid)-1
        if resp.isValid[0]:
            print("Success - Valid Joint Solution Found")
            if move:
                limb_joints = dict(zip(resp.joints[0].name, resp.joints[0].position))
                self.arm.move_to_joint_positions(limb_joints)
        else:
            print("Invalid Pose - No Valid Joint Solution Found")
            return -1
        return 0

    def move_to_home(self):
        return self.move_to_pose(self.home_pose)

    def raise_up(self):
        moveup_pose = self.arm.endpoint_pose()
        moveup_pose.position.z = moveup.position.z + 0.15
        return self.move_to_pose(moveup_pose)

    def pick_at_pose(self, pose):
        result = self.move_to_pose(pose)

        # Potentially try these as non-blocking although I might not be able to do the error checking then 
        if(result==0):
            result = self.gripper.close(block=True)
        return result

    def drop_at_pose(self, pose):
        result = self.move_to_pose(pose)
        if(result == 0):
            # might not even have a suction on there 
            result = self.gripper.open(block=True)
            
        return result


    # I wouldn't be surprised if this needs some work and possibly a whole new implementation
    def calc_table_height(self):
        self.move_to_home()
        tempPose = self.home_pose
        self.move_to_pose(tempPose)
        tempPose.position.z = tempPose.position.z - 0.05
        while(self.move_to_pose(tempPose,move=False) != -1):
            tempPose.position.z = tempPose.position.z - 0.05
        
        tempPose.position.z = tempPose.position.z + 0.05
       # while(self.move_to_pose(tempPose) != -1):
       #     tempPose.position.z = tempPose.position.z - 0.025        

        return tempPose.position.z

    def checkPoseRanges(self, pose):
        # this will check to make sure you don't give a position value that is too far in one direction.
        # result = self.checkNearTable()
        return 0

    def check_near_table(self):
        if(self.arm.endpoint_pose().position.z < self.table_height + 0.14):
            return True
        else:
            return False
