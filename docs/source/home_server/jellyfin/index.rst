.. warning::
    This page has been migrated to varssos-mkdocs (docs/home_server/jellyfin.md). This copy is outdated and no longer maintained.

Jellyfin
========


.. toctree:: 
    :maxdepth: 1

    jellyfin_ubuntu



Problems with Jellyfin
~~~~~~~~~~~~~~~~~~~~~~

The path could not be found
---------------------------

Jellyfin just dont have access to your media directory. Try::

    sudo setfacl -m u:jellyfin:rx /home/seba_nas
