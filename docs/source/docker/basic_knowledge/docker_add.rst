.. warning::
    This page has been migrated to varssos-mkdocs (docs/docker/basic_knowledge/docker_add.md). This copy is outdated and no longer maintained.

Docker add
==========

Docker add, download file from link
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: dockerfile

    FROM ubuntu

    ADD http://archive.ubuntu.com/ubuntu/pool/main/n/nano/nano_6.2-1_amd64.deb .

    RUN ls

Docker add, extract tar.gz
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: dockerfile

    FROM ubuntu

    ADD test.tar.gz .

    RUN ls