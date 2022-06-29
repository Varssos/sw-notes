Git problems
============

Can't resolve host github.com on WSL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Problem::

    fatal error : fatal: unable to access 'https://github.com/vinivasundharan/abcd.git/': Couldn't resolve host 'github.com'

`Solution <https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6>`_ 

1. Create a file: /etc/wsl.conf::

    [network]
    generateResolvConf = false

2. In powershell or cmd::

    wsl --shutdown
3. Create a file /etc/resolv.conf. If it exists, replace existing one with this new file::

    options use-vc
    nameserver 8.8.8.8

4. Check::
   
    ping github.com
    # or
    git pull
