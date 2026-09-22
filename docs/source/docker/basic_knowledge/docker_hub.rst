.. warning::
    This page has been migrated to varssos-mkdocs (docs/docker/basic_knowledge/docker_hub.md). This copy is outdated and no longer maintained.

Docker Hub
==========

.. important:: First sign up in https://hub.docker.com/


Push docker image to docker hub
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker login
    docker tag <your_image>  <your_username>/<new_image_name>
    docker push  <username>/<new_image_name>