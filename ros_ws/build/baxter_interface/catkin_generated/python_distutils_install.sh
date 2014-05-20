#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/kevin/ros_ws/src/baxter_interface"

# todo --install-layout=deb per platform
# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/kevin/ros_ws/install/lib/python2.7/dist-packages:/home/kevin/ros_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/kevin/ros_ws/build" \
    "/usr/bin/python" \
    "/home/kevin/ros_ws/src/baxter_interface/setup.py" \
    build --build-base "/home/kevin/ros_ws/build/baxter_interface" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/kevin/ros_ws/install" --install-scripts="/home/kevin/ros_ws/install/bin"
