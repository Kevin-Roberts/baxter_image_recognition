baxter_image_recognition
========================

The Baxter Robot from Rethink Robotics is a safe-to-operate robot that can be deployed in an industrial setting. This project consists of using image recognition to classify, pick up, and place objects based on their color or shape.

Wiki
====
The Wiki for this project can be found here (https://github.com/Kevin-Roberts/baxter_image_recognition/wiki). This wiki contains information about the specifications, tasks, timeline, and eventually examples for this project.

The Wiki contains some useful information but also checkout the ClassDocumentation word file in the repository to see all of the setup steps and documentation for all of the functions in this project.

In order to run the baxter_image_recognition libary simply install all of Baxter's libaries (look at Rethink Robotics wiki for more information https://github.com/RethinkRobotics/sdk-docs/wiki) and run master_controller.py. If you are interested in using baxter_image_recognition's libaries as interfaces to your own project I suggest you look into move_controller.py and image_receiver.py. master_controller.py puts the whole project together and image_processor.py handles the image processing to detect blocks based on there color and translates the image coordinates to "Pose" objects used to tell baxters limbs where to move to (with move_controller.py). 

Contributors 
============
Kevin Roberts - robe0815@umn.edu

Brandon Strub - stru0232@umn.edu

Patrick Deziel - dezie027@umn.edu

Richmond Uong - uongx001@umn.edu

Sam Koehnen - koehn087@umn.edu

