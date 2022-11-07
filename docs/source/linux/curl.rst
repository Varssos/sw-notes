CURL
====


CURL Problems
~~~~~~~~~~~~~
Invoking: ``curl https://sources.openwrt.org/``

::

    curl: (60) SSL certificate problem: unable to get local issuer certificate
    More details here: https://curl.se/docs/sslcerts.html

    curl failed to verify the legitimacy of the server and therefore could not
    establish a secure connection to it. To learn more about this situation and
    how to fix it, please visit the web page mentioned above.

Solution:

1. ``echo "cacert=/etc/ssl/certs/ca-certificates.crt" >> nano ~/.curlrc``
2. Or temporary ``curl https://sources.openwrt.org/ -k``