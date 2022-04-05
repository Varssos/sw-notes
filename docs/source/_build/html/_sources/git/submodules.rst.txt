Submodules
==========

Hejo Domi :*

Overview
~~~~~~~~

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

    