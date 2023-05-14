Apt Raspbian repositories
=========================

You can encounter problems with installing some aps at start like::

    E: Failed to fetch http://mirrordirector.raspbian.org/raspbian/pool/main/q/qtconnectivity-opensource-src/qtconnectivity5-dev_5.11.3-2_armhf.deb  Unable to connect to mirrordirector.raspbian.org:http:


Solution:

Try::

    sudo apt clean
    sudo apt update
    sudo apt upgrade

If it won't fix it. Try to change default mirror in ``/etc/apt/sources.list``::

    Instead of: 
    deb http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi
    Change to:
    deb http://www.mirrorservice.org/sites/archive.raspbian.org/raspbian bullseye main contrib non-free rpi
    Different mirrors are available here: http://raspbian.org/RaspbianMirrors
    In my case it fixed problem with dependencies for openauto
