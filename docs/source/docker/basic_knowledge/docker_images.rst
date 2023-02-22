Docker images
=============

Pull an image or a repository from a registry
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker pull ubuntu
    docker pull hello-world

Create an image from existing docker containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker commit <container_id> <image_new_name>

List docker images
~~~~~~~~~~~~~~~~~~
::

    docker image ls
    # or
    docker images

List docker history layers
~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker history <image_name>
