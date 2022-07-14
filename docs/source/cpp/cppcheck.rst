Cppcheck
========

`Manual how to deal with cppcheck <https://cppcheck.sourceforge.io/manual.pdf>`_ 

Install on Linux
~~~~~~~~~~~~~~~~

.. note:: Installing with `apt-get install` you will get a outdated version like 1.9. It will be better to build and install from source


1. Download `*.tar.gz` file from `here <https://cppcheck.sourceforge.io/>`_  
2. Save in your folder where you want to store files
3. Invoke below commands to extract and build cppcheck::

    tar -xf cppcheck-2.8.tar.gz 
    cd cppcheck-2.8
    cmake --build build
    cmake --install build

In case of ``cppcheck: /usr/local/bin/cppcheck`` add to ``~/.bashrc path``::

    export PATH=$PATH:/usr/local/bin

And restart terminal.
