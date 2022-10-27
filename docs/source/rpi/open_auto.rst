Open Auto
=========



1. Prepare Raspberry PI OS Legacy (BUSTER)
2. Update apt and fix problem with them like here :ref:`Apt Raspbian repositories` 
3. Follow installation from readme like here: https://github.com/humeman/openauto-patched-installer 


Problems:
1. USB permissions: https://github.com/f1xpl/openauto/wiki/udev-rules-(USB-permissions)



sudo apt-get install mtp-tools
sudo apt-get install libmtp-runtime


The other source:
1. https://github.com/openDsh/aasdk

2. For https://github.com/openDsh/openauto

Missing?::

    sudo apt-get install qtdeclarative5-dev

Last error in make -j1 in openauto:

[ 83%] Linking CXX shared library /home/pi/openauto/lib/libopenauto.so
/usr/bin/ld: cannot find -lh264bitstream




OpenDash can be also interestring

https://github.com/openDsh/dash