/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg/JointCommand.msg
 *
 */


#ifndef BAXTER_CORE_MSGS_MESSAGE_JOINTCOMMAND_H
#define BAXTER_CORE_MSGS_MESSAGE_JOINTCOMMAND_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace baxter_core_msgs
{
template <class ContainerAllocator>
struct JointCommand_
{
  typedef JointCommand_<ContainerAllocator> Type;

  JointCommand_()
    : mode(0)
    , command()
    , names()  {
    }
  JointCommand_(const ContainerAllocator& _alloc)
    : mode(0)
    , command(_alloc)
    , names(_alloc)  {
    }



   typedef int32_t _mode_type;
  _mode_type mode;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _command_type;
  _command_type command;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _names_type;
  _names_type names;


    enum { POSITION_MODE = 1 };
     enum { VELOCITY_MODE = 2 };
     enum { TORQUE_MODE = 3 };
 

  typedef boost::shared_ptr< ::baxter_core_msgs::JointCommand_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_core_msgs::JointCommand_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct JointCommand_

typedef ::baxter_core_msgs::JointCommand_<std::allocator<void> > JointCommand;

typedef boost::shared_ptr< ::baxter_core_msgs::JointCommand > JointCommandPtr;
typedef boost::shared_ptr< ::baxter_core_msgs::JointCommand const> JointCommandConstPtr;

// constants requiring out of line definition

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_core_msgs::JointCommand_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace baxter_core_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/groovy/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/groovy/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/groovy/share/geometry_msgs/cmake/../msg'], 'baxter_core_msgs': ['/home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_core_msgs::JointCommand_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_core_msgs::JointCommand_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_core_msgs::JointCommand_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f69af3f61011453886d7d5d74920c405";
  }

  static const char* value(const ::baxter_core_msgs::JointCommand_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf69af3f610114538ULL;
  static const uint64_t static_value2 = 0x86d7d5d74920c405ULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_core_msgs/JointCommand";
  }

  static const char* value(const ::baxter_core_msgs::JointCommand_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 mode\n\
float64[] command\n\
string[]  names\n\
\n\
int32 POSITION_MODE=1\n\
int32 VELOCITY_MODE=2\n\
int32 TORQUE_MODE=3\n\
";
  }

  static const char* value(const ::baxter_core_msgs::JointCommand_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mode);
      stream.next(m.command);
      stream.next(m.names);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct JointCommand_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_core_msgs::JointCommand_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_core_msgs::JointCommand_<ContainerAllocator>& v)
  {
    s << indent << "mode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.mode);
    s << indent << "command[]" << std::endl;
    for (size_t i = 0; i < v.command.size(); ++i)
    {
      s << indent << "  command[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.command[i]);
    }
    s << indent << "names[]" << std::endl;
    for (size_t i = 0; i < v.names.size(); ++i)
    {
      s << indent << "  names[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.names[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_CORE_MSGS_MESSAGE_JOINTCOMMAND_H
