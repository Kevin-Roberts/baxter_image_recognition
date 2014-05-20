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
 * Auto-generated by gensrv_cpp from file /home/kevin/ros_ws/src/baxter_common/baxter_core_msgs/srv/SolvePositionIK.srv
 *
 */


#ifndef BAXTER_CORE_MSGS_MESSAGE_SOLVEPOSITIONIK_H
#define BAXTER_CORE_MSGS_MESSAGE_SOLVEPOSITIONIK_H

#include <ros/service_traits.h>


#include <baxter_core_msgs/SolvePositionIKRequest.h>
#include <baxter_core_msgs/SolvePositionIKResponse.h>


namespace baxter_core_msgs
{

struct SolvePositionIK
{

typedef SolvePositionIKRequest Request;
typedef SolvePositionIKResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SolvePositionIK
} // namespace baxter_core_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::baxter_core_msgs::SolvePositionIK > {
  static const char* value()
  {
    return "834204e935305c14abaec9b5121e2032";
  }

  static const char* value(const ::baxter_core_msgs::SolvePositionIK&) { return value(); }
};

template<>
struct DataType< ::baxter_core_msgs::SolvePositionIK > {
  static const char* value()
  {
    return "baxter_core_msgs/SolvePositionIK";
  }

  static const char* value(const ::baxter_core_msgs::SolvePositionIK&) { return value(); }
};


// service_traits::MD5Sum< ::baxter_core_msgs::SolvePositionIKRequest> should match 
// service_traits::MD5Sum< ::baxter_core_msgs::SolvePositionIK > 
template<>
struct MD5Sum< ::baxter_core_msgs::SolvePositionIKRequest>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_core_msgs::SolvePositionIK >::value();
  }
  static const char* value(const ::baxter_core_msgs::SolvePositionIKRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_core_msgs::SolvePositionIKRequest> should match 
// service_traits::DataType< ::baxter_core_msgs::SolvePositionIK > 
template<>
struct DataType< ::baxter_core_msgs::SolvePositionIKRequest>
{
  static const char* value()
  {
    return DataType< ::baxter_core_msgs::SolvePositionIK >::value();
  }
  static const char* value(const ::baxter_core_msgs::SolvePositionIKRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::baxter_core_msgs::SolvePositionIKResponse> should match 
// service_traits::MD5Sum< ::baxter_core_msgs::SolvePositionIK > 
template<>
struct MD5Sum< ::baxter_core_msgs::SolvePositionIKResponse>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_core_msgs::SolvePositionIK >::value();
  }
  static const char* value(const ::baxter_core_msgs::SolvePositionIKResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_core_msgs::SolvePositionIKResponse> should match 
// service_traits::DataType< ::baxter_core_msgs::SolvePositionIK > 
template<>
struct DataType< ::baxter_core_msgs::SolvePositionIKResponse>
{
  static const char* value()
  {
    return DataType< ::baxter_core_msgs::SolvePositionIK >::value();
  }
  static const char* value(const ::baxter_core_msgs::SolvePositionIKResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BAXTER_CORE_MSGS_MESSAGE_SOLVEPOSITIONIK_H
