Setup docker environment WSL
============================

Based on that article I wrote a few steps how to set docker in the WSL
`Setup docker in wsl <https://medium.com/geekculture/run-docker-in-windows-10-11-wsl-without-docker-desktop-a2a7eb90556d>`_ 


1. Enable systemd
::

    sudo service docker start
    
    and add:

    [boot]
    systemd=true

2. Install docker
::

    sudo apt update
    sudo apt install docker.io -y

3. Add user to the docker group
::

    sudo usermod -aG docker $USER

4. Exit terminal, turn on again and try
::

    docker --version
    docker pull ubuntu

5. In case of problem: ``Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?``
::
    
    sudo service docker start
