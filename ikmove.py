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

class MoveController(object)

    def __init__(self, limb):
        rospy.init_node("rsdk_ik_service_client")
        self.ns = "ExternalTools/" + limb + "/PositionKinematicsNode/IKService"
        self.iksvc = rospy.ServiceProxy(self.ns, SolvePositionIK)
        self.ikreq = SolvePositionIKRequest()
        self.hdr = Header(stamp=rospy.Time.now(), frame_id='base')
        self.limb = baxter_interface.Limb(limb)
        self.table_height = self.calc_table_height()

        self.home_pose = Pose(
                position=Point(
                    x=0.52598,
                    y=0,
                    z=0,
                    ),
                orientation=Quaternion(
                    x=0,
                    y=math.pi/4,
                    z=0,
                    w=0,),
                )

    def move_to_pose(self, pose):
        pose_stamped = PoseStamped(
            header=self.hdr
            pose = pose
            )

        self.ikreq.pose_stamp.append(pose_stamped)
        try:
            rospy.wait_for_service(ns, 5.0)
            resp = self.iksvc(self.ikreq)
        except (rospy.ServiceException, rospy.ROSException), e:
            rospy.logerr("Service call failed: %s" % (e,))
            return -1

        # Not sure if the index can stay 0 or if it needs to be len(resp.isValid)-1
        if(resp.isValid[0]):
            print("Success - Valid Joint Solution Found")
            limb_joints = dict(zip(resp.joints[0].name, resp.joints[0].position))

            # this works for sure, but loop is not desired obviously
            # while not rospy.is_shutdown():
            #     self.arm.set_joint_positions(limb_joints)
            #     rospy.sleep(0.1)

            # Has some weird 0.2 first order filter but otherwise seems like the way to go?
            self.arm.move_to_joint_positions(self, limb_joints)
        else:
            print("Invalid Pose - No Valid Joint Solution Found")
            return -1
        return 0

    def move_to_home(self):
        # Possibly I could make this a while loop but that would be slightly slower so I'm not sure
        if(self.arm.endpoint_pose().position.z < self.table_height + 0.09):
            self.raise_up()

        return self.move_to_pose(self.home_pose)

    def raise_up(self):
        moveup_pose = self.arm.endpoint_pose()
        moveup_pose.position.z = moveup.position.z + 0.1
        return move_to_pose(moveup_pose)

    def pick_at_pose(self, pose):
        # Possibly fix the z coord to the table height?
        return -1

    def drop_at_pose(self, pose):
        # Possibly fix the z coord to the table height?
        return -1

    def calc_table_height(self):
        self.move_to_home()
        tempPose = self.home_pose
        while(move_to_pose(tempPose) != -1):
            tempPose.position.z = tempPose.position.z - 0.05

            # Maybe I want to check if this is the same as self.home_pose
        return tempPose.position.z

    def checkPoseRanges(self, pose):
        # this will check to make sure you don't give a position value that is too far in one direction.
        return -1