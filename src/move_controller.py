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


from sensor_msgs.msg import Range

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
                     y=-0.3365,
                     z=0.45,
                     ),
                 orientation=Quaternion(
                     x=0,
                     y=math.pi/4,
                     z=0,
                     w=0,),
               )
                         
    def __init__(self, arm):
        self.ns = "ExternalTools/" + arm + "/PositionKinematicsNode/IKService"
        self.iksvc = rospy.ServiceProxy(self.ns, SolvePositionIK)
        self.ikreq = SolvePositionIKRequest()
        self.hdr = Header(stamp=rospy.Time.now(), frame_id='base')
        self.arm = baxter_interface.Limb(arm)
        self.arm.set_joint_position_speed(0.3)
        self.gripper = baxter_interface.Gripper(arm)
        self.gripper.calibrate()
        self.table_height = None
        self.infrared_topic = "/robot/range/" + arm + "_hand_range/state"
        self.infrared_sub = None

    # I believe the center of ranges are [0.0, -0.55, 0.0, 0.75, 0.0, 1.26, 0.0] (which I believe is x,y,z, x,y,z,w)
    def move_to_pose(self, pose, move=True):
        pose_stamped = PoseStamped(
            header=self.hdr,
            pose = pose
            )

        self.ikreq.pose_stamp = [pose_stamped]
        try:
            rospy.wait_for_service(self.ns, 5.0)
            resp = self.iksvc(self.ikreq)
        except (rospy.ServiceException, rospy.ROSException), e:
            rospy.logerr("Service call failed: %s" % (e,))
            return -1

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

    def raise_up(self, pose):
        pose.position.z += 0.25
        result = self.move_to_pose(pose)
        if result == -1:
            pose.position.z-=0.1
            result = self.move_to_pose(pose)
            pose.position.z-=0.15
        else:
            pose.position.z-=0.25
        return result

    def pick_at_pose(self, pose):
        tz = pose.position.z
        pose.position.z = self.home_pose.position.z
        result = self.move_to_pose(pose)

        pose.position.z = tz + 0.1
        result = self.move_to_pose(pose)
        pose.position.z = tz
        result = self.move_to_pose(pose)
        #if(result==0):
        rospy.sleep(0.2)
        result = self.gripper.close(block=True)
        return result

    def drop_at_pose(self, pose):
        result = self.raise_up(pose)
        result = self.move_to_pose(pose)
        #if(result==0):
        result = self.gripper.open(block=True)
            
        return result

    def update_table_height(self):
        tempPose = Pose(
                 position=Point(
                     x=0.52598,
                     y=-0.3365,
                     z=0.45,
                     ),
                 orientation=Quaternion(
                     x=0,
                     y=math.pi/4,
                     z=0,
                     w=0,),
               )

        self.move_to_pose(tempPose)
        while self.getInfrared() is False:
            tempPose.position.z = tempPose.position.z - 0.2
            self.move_to_pose(tempPose)
        
        # Get infrared sets self.table_height to the infrared distance, add drop distance
        self.table_height += (self.home_pose.position.z - tempPose.position.z)

    def getInfrared(self):
        self.table_height = None
        self.infrared_sub = rospy.Subscriber(self.infrared_topic, Range, self._ir_callback)
        while self.table_height is None:
            continue
        return self.table_height

    def _ir_callback(self, data):
        if data.range > data.min_range and data.range < data.max_range:
            self.table_height = data.range
        else:
            self.table_height = False
        self.infrared_sub.unregister()

    def checkPoseRanges(self, pose):
        # this will check to make sure you don't give a position value that is too far in one direction.
        # result = self.checkNearTable()
        return 0

    def check_near_table(self):
        if(self.arm.endpoint_pose().position.z < self.table_height + 0.14):
            return True
        else:
            return False
