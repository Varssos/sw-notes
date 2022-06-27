Nmap
====

Cool tutorial about `nmap <https://securitybeztabu.pl/nmap-jak-sprawdzic-otwarte-porty/>`_ 

Basic scan
~~~~~~~~~~
::

    nmap 192.168.0.100

Ping scan
~~~~~~~~~
::

    nmap -sP 192.168.0.100/24

Scan port range
~~~~~~~~~~~~~~~
::

    nmap -p 1000-1500 192.168.0.100

Scan few ports
~~~~~~~~~~~~~~
::

    nmap -p 80,443 192.168.0.100

Scan hosts from input file
~~~~~~~~~~~~~~~~~~~~~~~~~~

Input file list.txt::

    10.0.1.4
    192.168.0.1

Command::

    nmap -iL list.txt



