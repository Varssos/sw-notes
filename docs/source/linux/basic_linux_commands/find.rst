.. warning::
    This page has been migrated to varssos-mkdocs (docs/linux/shell_tools/find.md). This copy is outdated and no longer maintained.

find
====

Move only files ignoring directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    find /path/to/search -type f -exec mv -t /path/where/to/move {} +
    # -t means target

