Docker containters
==================

Create new docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker run ubuntu

Create new docker container with interactive bash
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker run --interactive --tty ubuntu bash
    # or
    docker run -it ubuntu bash

Print all docker containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker container ls -a
    # or
    docker ps -a

Print running docker containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker container ls
    # or
    docker ps


Start again docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker start <container_id>/<container_name>

Execute command in running docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker exec <container_id>/<container_name> ls

Go to interactive mode on running docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker exec -it <container_id>/<container_name> bash
