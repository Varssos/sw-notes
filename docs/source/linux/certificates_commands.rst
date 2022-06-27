Certificates-practical commands
===============================

Extracting pfx file to CA certificate, public key, private key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's imagine that you have a domain.pfx file. You can use openssl 
command to generate certs, keys. After each command you have to pass password


CA certificate::

    openssl pkcs12 -in domain.pfx -nodes -nokeys -cacerts -out ca.crt

Public key::

    openssl pkcs12 -in domain.pfx -clcerts -nokeys -out cert.crt

Private key::

    openssl pkcs12 -in domain.pfx -nocerts -nodes -out private.key

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


