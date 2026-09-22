.. warning::
    This page has been migrated to varssos-mkdocs (docs/embedded_linux/openwrt/installing_image.md). This copy is outdated and no longer maintained.

Installing OpenWrt image
========================

Image download
~~~~~~~~~~~~~~

Get firmware from `firmware selector <https://firmware-selector.openwrt.org/>`_ 

Or `OpenWrt downloads <https://openwrt.org/downloads>`_ 

Or build your own with SDK


Send via scp on device
~~~~~~~~~~~~~~~~~~~~~~
{user}: sshroot/root::

    scp {image_file} {user}@{ip}:/tmp

OpenWrt system upgrade
~~~~~~~~~~~~~~~~~~~~~~
::

    sysupgrade -v -c {image_file}
    # -c attempt to preserve all changed files in /etc/
    # -v more verbose

