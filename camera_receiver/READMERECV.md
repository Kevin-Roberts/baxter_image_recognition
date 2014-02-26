camera_receiver.py
==================

I figured out the message type that I was looking for was in sensor_msgs.msg instead of std_msgs.msg.

I found a pretty good tutorial on converting the ROS images into OpenCV images [HERE](http://wiki.ros.org/cv_bridge/Tutorials/ConvertingBetweenROSImagesAndOpenCVImagesPython#CA-d0786c764cd18216e8ac7d4340893acdb7fe4def_39)

I converted that into the file above.

So in order for this to work you need to first enable the camera and turn it on using camera_control.py
Eventually the camera will automatically turn on and off ect.


Currently it should display the image in a window which will be removed eventually as we only will need the raw image.
