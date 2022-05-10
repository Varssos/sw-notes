Submodules
==========

Submodules Overview
~~~~~~~~~~~~~~~~~~~

Submodules are thirdy part libraries/project which you can insert into your own project e.g. libmodbus

`Here`_ is a link which describe submodules in details.

.. _Here: https://git-scm.com/book/en/v2/Git-Tools-Submodules



Adding submodule to project
~~~~~~~~~~~~~~~~~~~~~~~~~~~




Imagine that you want to add libmodbus library to your git project.
Make sure that you are in main project path, and submodule/libmodbus direcotry does not exist.
After that just type to add this library to your submodules::
    
    git submodule add https://github.com/stephane/libmodbus.git submodules/libmodbus

Removing submodule
~~~~~~~~~~~~~~~~~~

In that case suppose that you want to erase submodules/ directory from submodule
Following steps should do it::

    git submodule deinit -f -- submodules/
    rm -rf .git/modules/submodules/
    git rm -f submodules/

submodules/ directory can be replaced by any other e.g.: submodules/libmodbus/


Check status of submodules
~~~~~~~~~~~~~~~~~~~~~~~~~~

:: 

    git submodule status

Point to specific commit
~~~~~~~~~~~~~~~~~~~~~~~~

::

    cd submodules/libmodbus
    git checkout {SHA1} #e.g a2e0e4546e23cefaee95545668f8eaa891f88c9e
    cd ../..
    git add submodules/libmodbus/


Point to specific branch
~~~~~~~~~~~~~~~~~~~~~~~~
When submodule already exist:

::

    git config -f .gitmodules submodule.submodules/libmodbus.branch master


Building submodules
~~~~~~~~~~~~~~~~~~~

::

    git submodule init
    git submodule update
    make -C submodules
    sudo make -C submodules install

Example makefile
~~~~~~~~~~~~~~~~

This makefile should be set in ./submodules/ directory
 
.. code-block:: bash

    runner = $(shell whoami)
    ROOT_DIR = $(shell pwd)
    MAKE = make

    SUBMODULES_DIR_PATH=$(shell pwd)

    .DEFAULT_GOAL=all

    .PHONY: clean all \
        libmodbus libmodbus_install libmodbus_clean 

    all: libmodbus

    install: check_runner \
        libmodbus_install

    clean: \
        libmodbus_clean

    check_runner: # check if make is executed by root user
    ifneq ($(runner), root)
        $(error Some submodules require other module installation. Please, run make as root [now: $(runner)].)
    else
        @echo 'Running as root. OK'
    endif


    # MODBUS ---------------------------------

    libmodbus: libmodbus_clean
        @echo Build libmodbus
        @mkdir -p ./libmodbus/build
        @cd libmodbus; ./autogen.sh;
        @cd libmodbus; ./configure --prefix=`pwd`/build;
        @$(MAKE) -C ./libmodbus/
        @$(MAKE) -C ./libmodbus/ install

    libmodbus_install: check_runner
        @echo Install libmodbus
        @cp -r ./libmodbus/build/* /usr/local/

    libmodbus_clean:
        @echo Clean libmodbus
        @rm -rf ./libmodbus/build

