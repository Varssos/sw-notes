All Makefile knowledge
======================

All knowledge about GNU Makefile `link <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>`_ 

How to make Makefile
~~~~~~~~~~~~~~~~~~~~

1. Create a file ``Makefile``
2. Fill a content e.g. (base, not elegant makefile, but simple to understand)

.. code-block:: Makefile

    CXX = g++
    TARGET = thread
    FLAGS = -g -Wall -std=c++17
    INCLUDE = inc/


    all: thread.o connection.o device.o
        $(CXX) $(FLAGS) -o $(TARGET) $(TARGET).o connection.o device.o -I $(INCLUDE)

    thread.o: thread.cpp
        $(CXX) -c thread.cpp

    device.o: ./src/device.cpp
        $(CXX) -c ./src/device.cpp -I $(INCLUDE)

    connection.o: ./src/connection.cpp
        $(CXX) -c ./src/connection.cpp -I $(INCLUDE)

    clean:
        rm thread.exe
        rm *.o

3. Run ``make`` which invoke first target, in this case ``make all``
4. Run app

Makefile general scheme
~~~~~~~~~~~~~~~~~~~~~~~

A simple makefile consists of rules with the following shape:
::

    target … : prerequisites …
        recipe
        …
        …

    <this file> : <needs these files>
        <and is created by this command>

Imagine that in your project you have a main project folder in it Makefile and 2 folders: `inc` and `src`

Differences between assignments in GNU Makefile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. **Lazy Set**

::

    VARIABLE = value

Normal setting of variable, but any other variables mentioned with the value field are recursively expanded with their value at the point at which the variable is used, not the one it had when it was declared. Example

.. code-block:: Makefile

    MAKE_DEPEND = $(Y) -M

    Y = gcc

    test:
        @echo $(MAKE_DEPEND)

Output::

    gcc -M

.. important:: It will take last declaration of ``Y`` before invoking ``MAKE_DEPEND``


2. **Immediate Set**

::

    VARIABLE := value

Setting of a variable with simple expansion of the values inside - values withing it are expanded at declaration time. Example

.. code-block:: Makefile

    MAKE_DEPEND := $(Y) -M

    Y = gcc

    test:
        @echo $(MAKE_DEPEND)

Output::

    -M

3. **Lazy Set If Absent**

::

    VARIABLE ?= value

Setting of a variable only if it doesn't have a value. ``value`` is always evaluated when VARIABLE is accessed. It is equivalent to::

    ifeq ($(origin VARIABLE), undefined)
        VARIABLE = value
    endif

Example

.. code-block:: Makefile

    Y = first
    Y ?= second

    test:
        @echo $(Y)

Output::

    first

4. **Append**

::

    VARIABLE += value

Appending the supplied value to the existing value (or setting to that value if the variable didn't exist). Example::

    Y = first
    Y += second

    test:
        @echo $(Y)

Output::

    first second

Phony Targets
~~~~~~~~~~~~~

`Well described article <https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html#Phony-Targets>`_

We use ``.PHONY:`` to:
1. Avoid conflict with a file of the same name of target
2. Improve performance
   
So instead of:

.. code-block:: Makefile

    clean:
        rm *.o temp

Shoule be:

.. code-block:: Makefile

    .PHONY: clean
    clean:
            rm *.o temp



