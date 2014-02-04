Image Recognition
=================

I threw this example together. Essentially I am isolating one square and then drawing that squares boundaries. The program gets the coordinates of the squares and would know which color the object is based on which color is masked for.

I believe this snippet of code could easily be expanded and used as our block detection function.

I added the example image I used (blocks.jpg), the output you should end up with (output.jpg), and the source code (run with "python square_recognition.py").

If you have any troubles ask me (Kevin) for help getting it setup.

Requirements
============
I suggest downloading them all [HERE](http://www.lfd.uci.edu/~gohlke/pythonlibs/) if you have windows, specifically if you have 64 bit windows. 

Obviuosly we will need the Ubuntu version but I believe ROS has OpenCV packaged within it already (aka Baxter already uses OpenCV) so the download shouldn't be a problem once ROS is setup (on a side note I got ROS all set up on my computer).

Python 2.7: Obvious

Numpy: Python scientific number library, OpenCV uses it

OpenCV: Library for image processing, has tons of features and works well. [Examples here](http://docs.opencv.org/trunk/doc/py_tutorials/py_tutorials.html).
