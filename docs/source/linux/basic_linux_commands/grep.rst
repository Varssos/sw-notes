.. warning::
    This page has been migrated to varssos-mkdocs (docs/linux/shell_tools/grep.md). This copy is outdated and no longer maintained.

grep
====

Search recursively phrase and exclude dir
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    grep --exclude-dir=your_dir/ -rn "abc"

Search recursively with case insensitive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    grep -rni "abc"
