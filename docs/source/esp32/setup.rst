Setup environment ESP
=====================


Setup ESP32 on Debian based distribution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/linux-macos-setup.html

1. Install prerequisities::

    sudo apt-get update
    sudo apt-get install git wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

2. Get esp-idf repo::

    git clone --recursive https://github.com/espressif/esp-idf.git
    cd esp-idf

3. Install::
   
   ./install.h all

4. Set up the environment variables::
   
   . ./export.sh

Get started with esp hello-world
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Go to your project directory

2. Copy hello-world::

    cp -r $IDF_PATH/examples/get-started/hello_world .

3. Configure project::

    cd hello_world
    idf.py set-target esp32
    idf.py menuconfig

4. Build::
   
   `idf.py build`

5. Setup port::

    sudo adduser $USER dialout
    sudo chmod a+rw /dev/ttyUSB0

6. Flash::

    idf.py -p /dev/ttyUSB0 flash

7. Monitor the output::

    idf.py monitor


Setup esp32 in vs code
~~~~~~~~~~~~~~~~~~~~~~

https://docs.platformio.org/en/stable/tutorials/espressif32/espidf_debugging_unit_testing_analysis.html