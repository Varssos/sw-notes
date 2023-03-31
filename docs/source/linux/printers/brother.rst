Brother printer on Linux
========================


1. Follow this instruction `To install the printer driver easily using a tool. (Linux) <To install the printer driver easily using a tool. (Linux)>`_ 
::

    gunzip linux-brprinter-installer-*.*.*-*.gz
    sudo bash linux-brprinter-installer-*.*.*-* Brother machine name
    # Next in my case:
    DCP-J315W
    Will you specify the Device URI? [Y/n] ->Y
    13     # 13 (I): Specify IP address.
    192.168.X.X  # Type printer IP
    # Many y y y 

2. Now you are albe to print

3. Setup scanner
::

    sudo apt-get install sane xsane

4. Restart PC
5. Now you should see XSane app in system and be able to scan documents