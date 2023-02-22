Docker build context
====================

.. important:: Using this syntax: ``docker build ./folder .`` Docker client pack this folder and send to docker deamon. 
    
    1. If ``Dockerfile`` need files which is above this folder, it will throw error.
    2. If you want to optimize your project you should try to use as small resources as possible 
    3. You can pass separately path to ``Dockerfile`` and context folder e.g::

        docker build -f ./path/Dockerfile  ./nested/folder

