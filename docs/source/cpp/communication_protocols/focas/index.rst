Focas
=====

FOCAS means Fanuc Open CNC API Specification. 
There are FOCAS1/2, version 1 and 2.

- FOCAS1 : Library for CNC other than FS300i/310i/320i
- FOCAS2 : Library for FS300i/310i/320i


Connection type
~~~~~~~~~~~~~~~

- High Speed Serial Bus (HSSB) ( from what I know it is used only with FOCAS )
- Ethernets

Applicable CNCs
~~~~~~~~~~~~~~~

List of applicable CNCs can be fine `here <https://www.inventcom.net/fanuc-focas-library/general/fwlib32>`_ in section ``Applicable CNCs``

.. important:: 1. Focas library is precompiled. For linux devices there is only available 32 bit version which produce following problems:
    
    - ``short`` is in fact ``int16_t`` instead of ``int32_t``


FOCAS library installing on x86 Linux OS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download library
----------------
::

    git clone https://github.com/strangesast/fwlib.git

Get to correct directory
------------------------
::

    cd ./fwlib/Linux

Copy shared library to system directory
---------------------------------------
::

    sudo cp libfwlib32-linux-x64.so.1.0.5 /usr/local/lib/libfwlib32.so.1.0.5

Create a symbolic link
----------------------
::

    sudo ln -s /usr/local/lib/libfwlib32.so.1.0.5 /usr/local/lib/libfwlib32.so

Update headers and libraries installed in system
------------------------------------------------
::

    sudo ldconfig

Important data to retrieve from FOCAS lib
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`List of all cnc functions <https://www.inventcom.net/fanuc-focas-library/general/flist_all>`_ 


CNC system information
----------------------

`cnc_sysinfo() <https://www.inventcom.net/fanuc-focas-library/misc/cnc_sysinfo>`_ 

You can retrieve:
  - Additional information
  - Max controlled axes
  - Kind of CNCKind of M/T/TT
  - Series number
  - Version number
  - Current controlled axes
  
CNC Program name and number
---------------------------

`cnc_exeprgname() <https://www.inventcom.net/fanuc-focas-library/program/cnc_exeprgname>`_


CNC Program number, comment and processing time
-----------------------------------------------

`cnc_rdprgdirtime <https://www.inventcom.net/fanuc-focas-library/program/cnc_rdprgdirtime>`_ 


CNC Status information
----------------------

`cnc_statinfo <https://www.inventcom.net/fanuc-focas-library/misc/cnc_statinfo>`_ 

You can retrive information like:
    - T/M mode selection
    - AUTOMATIC/MANUAL mode selection
    - Status of automatic operation
    - Status of axis movement,dwell
    - Status of M,S,T,B function
    - Status of emergency  
    - Status of alarm ( which is in practice warning )
    - Status of program editing

CNC Alarm type
--------------

`cnc_alarm2 <https://www.inventcom.net/fanuc-focas-library/misc/cnc_alarm2>`_ 

It reads long variable(int32_t) which is alarm type. Depending on which bit is '1' it signals appropriate alarm message and should be mapped as in documentation. In practice it should be the same as the output of ``cnc_rdalmmsg2()``

CNC Alarm message
-----------------

`cnc_ralmmsg2 <https://www.inventcom.net/fanuc-focas-library/misc/cnc_rdalmmsg2>`_ 

.. important:: In case of real alarm:
    
  - statinfo.emergency = ``Emergency`` (1)
  - statinfo.alarm = ``Alarm`` (1)
  - In cnc_alarm2(), minimum one bit is ``1'``
  - Alarm message contain real alarm message

  In case of no alarm:

  - statinfo.emergency = ``Not Emergency`` (0)
  - statinfo.alarm = ``No Alarm`` (0)
  - In cnc_alarm2, all bits are ``0``
  - Alarm message is empty or contain: ``(reserved)``

CNC feedrate and spindle speed
------------------------------

`cnc_rddynamic <https://www.inventcom.net/fanuc-focas-library/position/cnc_rddynamic>`_ 


CNC macro variables
-------------------

`cnc_rdmacro <https://www.inventcom.net/fanuc-focas-library/ncdata/cnc_rdmacro>`_ 

CNC change path
---------------

In some cases CNC machines have like 3 programs/ 3 working CNCs/turret. In that case you can have 3 macro #800. To get macro for appropriate path/turret you should use:

`cnc_setpath <https://www.inventcom.net/fanuc-focas-library/misc/cnc_setpath>`_ 


CNC PMC addresses
-----------------

`pmc_rdpmcrng <https://www.inventcom.net/fanuc-focas-library/pmc/pmc_rdpmcrng>`_ 


CNC Operator panel data
-----------------------

`cnc_rdopnlsgnl <https://www.inventcom.net/fanuc-focas-library/misc/cnc_rdopnlsgnl>`_ 



