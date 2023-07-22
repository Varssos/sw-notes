find
====

Move only files ignoring directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    find /path/to/search -type f -exec mv -t /path/where/to/move {} +
    # -t means target

