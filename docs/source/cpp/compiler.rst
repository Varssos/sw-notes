Compiler
========

Install on Ubuntu
~~~~~~~~~~~~~~~~~

Check gcc/g++ version
---------------------
::
    
    g++ --version 
    gcc --version
    # In my case it was 9.4

Install desired g++ version
---------------------------

In my case I had to install manually g++-10

::

    sudo apt update
    sudo apt install g++-10

Replace symbolic links
----------------------
::

    # Check symbolic links
    ls -la /usr/bin | grep gcc
    ls -la /usr/bin | grep g++

    # Remove symbolic links
    rm /usr/bin/gcc
    rm /usr/bin/g++

    # Create symbolic links
    ln -s /usr/bin/gcc-10 /usr/bin/gcc
    ln -s /usr/bin/g++-10 /usr/bin/g++

    # Check symbolic links
    ls -la /usr/bin | grep gcc
    ls -la /usr/bin | grep g++

    # Check compiler versions
    g++ --version 
    gcc --version