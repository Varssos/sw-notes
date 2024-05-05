Nextcloud basic
===============

`linuxserver/nextcloud <https://docs.linuxserver.io/images/docker-nextcloud/>`_


How to create basic nextcloud docker?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Create you nextcloud dir
2. Create there ``docker-compose.yml`` with this conetent::

    services:
      nextcloud:
        image: lscr.io/linuxserver/nextcloud:latest
        container_name: nextcloud
        environment:
        - PUID=1000
        - PGID=1000
        - TZ=Etc/UTC
        volumes:
        - ./appdata:/config
        - ./data:/data
        ports:
        - 8443:443
        restart: unless-stopped
3. Run::

    docker-compose up -d

4. Open ``127.0.0.1:8443``
5. It is recommended to use something like nginx-proxy-manager to connect with https
