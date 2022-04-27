Prepare debug configuration
===========================


Visual Studio Code
~~~~~~~~~~~~~~~~~~


If app is very simple just watch `VS debugging <https://www.youtube.com/watch?v=G9gnSGKYIg4>`_ 
, otherwise if it is not enough try hints described below

Before you start, make sure that binary and shared libraries are build with arg ``-g`` or in CMake ``CMAKE_BUILD_TYPE`` set to ``Debug``. Otherwise gdb will not stop on desired breakpoints.

**Building binary with Cmake:**

1. Navigate to {project_directory}
2. ``mkdir build``
3. ``cd build``
4. ``cmake -DCMAKE_BUILD_TYPE=Debug ../``
5. After that, when you type ``cmake --build build`` and ``cmake --install build`` in {project_directory} it will build as a debug bin/shared_obj  

**Steps to configure debugging in VS**

1. Go to "Run and Debug" section on left hand side, click "create a launch.json file" and choose GDB
2. In launch.json change section "program" to program binary location e.g.: ``/usr/local/bin/{bin_name}``
3. If any args are needed set them in this way::

    "args": [
        "-c", 
        "{directory}/config_file.cfg" ],

4. It is possible to specify gdb binary location, just add section ``"miDebuggerPath": "/usr/bin/gdb"``