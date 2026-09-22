.. warning::
    This page has been migrated to varssos-mkdocs (docs/linux/install_deb_from_file.md). This copy is outdated and no longer maintained.

Install deb packages from file
==============================

`Manual packages installation <https://help.ubuntu.com/kubuntu/desktopguide/C/manual-install.html>`_ 

Steps

1. Download desired .deb package
2. Install .deb file in terminal::

    sudo dpkg -i package_file.deb

3. If you want remove::

    sudo apt-get remove package_name