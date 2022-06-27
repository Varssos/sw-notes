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

Makefile functions
~~~~~~~~~~~~~~~~~~

All knowledge about function is `here <https://www.gnu.org/software/make/manual/html_node/Functions.html#Functions>`_ 

Function call syntax
--------------------

Function call looks like this:

.. code-block:: Makefile

    $(function arguments)

or like this:

::

    ${function arguments}

.. important:: Commas and unmatched parentheses or braces cannnot appear in the test of an argument as written. It can be done in this way:

    .. code-block:: Makefile

        comma:= ,
        empty:=
        space:= $(empty) $(empty)
        foo:= a b c
        bar:= $(subst $(space),$(comma),$(foo))
        # bar is now ‘a,b,c’.

String substitution
-------------------

**Text replacement**

.. code-block:: Makefile

    $(subst from,to,text)

Example:

.. code-block:: Makefile

    $(subst ee,EE,feet on the street)
    # Result: 'fEEt on the strEEt'

**Pattern replacement**

.. code-block:: Makefile

    $(patsubst pattern,replacement,text)

Example:

.. code-block:: Makefile

    $(patsubst %.c,%.o,x.c.c bar.c)
    #Result: 'x.c.o bar.o'

It is equivalent to:

.. code-block:: Makefile

    $(var:pattern=replacement)

Example:

.. code-block:: Makefile

    objects = foo.o bar.o baz.o
    $(objects:.o=.c)
    # Result: foo.c bar.c baz.c

**Remove leading and trailing whitespace from string**

.. code-block:: Makefile

    $(strip string)

Example:

.. code-block:: Makefile

    $(strip a b c )
    # Result: 'a b c'

**Find string**

.. code-block:: Makefile

    $(findstring find,in)

It search for ``find`` in ``in`` and return true on success. Examples:

.. code-block:: Makefile

    $(findstring a,a b c)
    $(findstring a,b c)

**Filter text**

.. code-block:: Makefile

    $(filter pattern…,text)

Returns all whitespace-separated words in text that do match any of the parrern words, removing any words that do not match. Example:

.. code-block:: Makefile

    sources := foo.c bar.c baz.s ugh.h
    foo: $(sources)
        cc $(filter %.c %.s,$(sources)) -o foo
    # Result: cc foo.c bar.c baz.s -o foo

**Filter out text**

.. code-block:: Makefile

    $(filter-out pattern…,text)

It works exaclty opposite to ``filter``. Example:

.. code-block:: Makefile

    objects=main1.o foo.o main2.o bar.o
    mains=main1.o main2.o
    $(filter-out $(mains),$(objects))
    # Result: foo.o bar.o

**Sort**

.. code-block:: Makefile

    $(sort list)

Example:

.. code-block:: Makefile

    $(sort foo bar lose)
    # Result: 'bar foo lose'

**Word**

.. code-block:: Makefile

    $(word n,text)

Returns the nth word of ``text``. It starts counting from 1!. Example:

.. code-block:: Makefile

    $(word 2, foo bar baz)
    # Result: 'bar'

**Wordlist**

.. code-block:: Makefile

    $(wordlist s,e,text)

Returns the list of words in ``text`` starting with word ``s`` and ending with ``e`` (inclusive). Example:

.. code-block:: Makefile

    $(wordlist 2, 3, foo bar baz)
    # Return: 'bar baz'

**Words**

.. code-block:: Makefile

    $(words text)

Returns the number of words in ``text``. Example:

.. code-block:: Makefile

    $(words  foo bar baz)
    # Return: '3'

**Firstword**

.. code-block:: Makefile

    $(firstword foo bar)

**Lastword**

.. code-block:: Makefile

    $(lastword foo bar)

**Some practical examples**

.. code-block:: Makefile

    #VPATH:=src:../headers
    $(subst :, ,$(VPATH))
    # Result: 'src ../headers'

.. code-block:: Makefile

    override CFLAGS += $(patsubst %,-I%,$(subst :, ,$(VPATH)))
    # Result: '-Isrc -I../headers'










