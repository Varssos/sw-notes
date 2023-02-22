Docker cp
=========

Copy from host to docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker cp <local_file> <container_id/name>:<path_where_to_copy>
    # E.g.
    docker cp skni.txt practical_faraday:/

Copy from docker container to host
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker cp <container_id/name>:<path_where_to_copy> <local_file> 
    # E.g.
    docker cp practical_faraday:/ skni.txt 