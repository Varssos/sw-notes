Problems on OpenWrt
===================

File system read only
~~~~~~~~~~~~~~~~~~~~~
::

    Your JFFS2-partition seems full and overlayfs is mounted read-only.
    Please try to remove files from /overlay/upper/... and reboot!::

1. Check filesystem::

    df -Th
2. Check installed packages (some necessary packages e.g python)::

    opkg list-installed | grep python

3. Uninstall packages::

    opkg remove python3.9

4. Find rest bin/.*so files in filesystem::

    find / -name "*python*"
    # Output
    # /usr/lib/python3.9
    # /overlay/upper/usr/lib/python3.9

5. Remove files::

    rm /overlay/upper/usr/lib/python3.9
    rm /usr/lib/python3.9

