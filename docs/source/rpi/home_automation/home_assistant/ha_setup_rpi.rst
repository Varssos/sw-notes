Setup HA on RPI4 on docker
==========================

.. important:: I assume that you want to setup HA on RPI4 with Raspberry PI OS on bullseye



Prepare docker
~~~~~~~~~~~~~~
::

    sudo apt update
    sudo apt upgrade
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=armhf signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/raspbian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo systemctl status docker

::

    sudo usermod -aG docker $USER
    newgrp docker

If not existing file: nano /etc/docker/daemon.json create one and put it in::

    {
        "group": "docker"
    }

Run home assistant docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    docker run -d   --name homeassistant   --privileged   --restart=unless-stopped   -e TZ=Europe/Warsaw   -v /home/seba/Documents/HomeAssistant:/config   --network=host   ghcr.io/home-assistant/home-assistant:stable


Setup home assistant on webpage
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to browser and go to: ``RPI_IP:8123``


