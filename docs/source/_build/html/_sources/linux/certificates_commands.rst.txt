Certificates-practical commands
===============================

Wget with certs
~~~~~~~~~~~~~~~

Files .crt and .key
-------------------

If you have such cert files::

    user@user:~/.certs$ ls -la
    -rw------- 1 user user 1245 lip 5 11:48 ca.crt
    -rw------- 1 user user 1326 lip 5 11:48 cert.crt
    -rw------- 1 user user 1704 lip 5 11:49 private.key

There is an example of wget::

    wget --ca-certificate=$HOME/.certs/ca.crt --certificate=$HOME/.certs/cert.crt --private-key=$HOME/.certs/private.key 'link'

You can create a script to handle this::

    user@user:~# echo '#!/bin/sh
    wget --ca-certificate=$HOME/.certs/ca.crt --certificate=$HOME/.certs/cert.crt --private-key=$HOME/.certs/private.key $*' > /bin/wget-ca
    user@user:~# chmod +x /bin/wget-ca

Files .cer
----------

If you have such certs files::

    user@user:~/.certs$ ls -la
    -rw------- 1 user user 1348 kwi 25 09:01 ca.cer
    -rw------- 1 user user 1828 kwi 25 09:00 priv.cer
    -rw------- 1 user user 1486 kwi 25 09:00 pub.cer

There is an example of wget::

    wget --ca-certificate=$HOME/.certs/ca.cer --certificate=$HOME/.certs/pub.cer --private-key=$HOME/.certs/priv.cer 'link'

You can create a script to handle this::

    user@user:~# echo '#!/bin/sh
    wget --ca-certificate=$HOME/.certs/ca.cer --certificate=$HOME/.certs/pub.cer --private-key=$HOME/.certs/priv.cer $*' > /bin/wget-ca
    user@user:~# chmod +x /bin/wget-ca

