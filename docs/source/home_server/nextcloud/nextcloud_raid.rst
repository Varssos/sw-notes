Nextcloud raid
==============

Nextcloud raid docker-compose.yml
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Create docker-compose.yml::

    services:
    nextcloud:
      image: lscr.io/linuxserver/nextcloud:latest
      container_name: nextcloud
      environment:
        - PUID=1000
        - PGID=1000
        - TZ=Etc/UTC
      volumes:
        - "./appdata:/config"
        - "/mnt/md0/Storage/Nextcloud/data:/data"
        - "/mnt/md0/Storage:/raid"
      ports:
        - 8443:443
      restart: unless-stopped

2. Run::

    docker-compose up -d

3. Setup raid in nextcloud UI:

Settings - > Apps -> External storage support -> Enable
Settings - > Administration settings -> External storage

Folder name: Raid, External storage: Local, Authentication: None, Configuration: /raid, Available for: All users


4. Scan files in docker in case of any problems::

    docker exec -it 8a94007fb2f0 bash
    occ files:scan --all
