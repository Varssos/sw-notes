Setup docker environment WSL
============================

Based on that article I wrote a few steps how to set docker in the WSL
`Setup docker in wsl <https://medium.com/geekculture/run-docker-in-windows-10-11-wsl-without-docker-desktop-a2a7eb90556d>`_ 

It's better to follow official tutoria: https://docs.docker.com/engine/install/ubuntu/

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
    newgrp docker
    # then docker ps shouldnt output with:
    permission denied ... dial unix /var/run/docker.sock: connect: permission denied

4. Exit terminal, turn on again and try
::

    docker --version
    docker pull ubuntu
