HID descriptors
~~~~~~~~~~~~~~~

Ucgosu:

https://github.com/microsoft/hidtools

https://github.com/Theodor-Lindberg/NPP-TOML-Syntax

https://teenydt.github.io/

My:

https://github.com/tmk/tmk_keyboard/wiki/USB:-HID-Report-Descriptor



HID converter python3 library
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/nipo/hrdc

::

    python3 ./setup.py build
    sudo python3 ./setup.py install

go to examples::

    python3 mouse.py -N -o code

Here is gamepad: https://github.com/nipo/hrdc/blob/master/doc/why.rst

Create gamepad.py and then::

    python3 gamepad.py -N -o code





[probably deprecated] HID converter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/DIGImend/hidrd

Steps::

    ./boostrap
    ./configure
    make 
    sudo make install