.. warning::
    This page has been migrated to varssos-mkdocs (docs/bash/bash_rules.md). This copy is outdated and no longer maintained.

Bash rules
==========

`Jak wytresowac Basha <https://www.youtube.com/watch?v=fK-CoMVPxxQ>`_


Rule: always use quotes
~~~~~~~~~~~~~~~~~~~~~~~

Dont::

    echo $1
    echo one two *

Do::

    echo "$1"
    echo "one two *"

Why?::

    $ VAR="one two *"

    $ echo "${VAR}"
    one two *

    $ echo ${VAR}
    onw two bin boot cdroom dev etc home...

Rule: no space around =
~~~~~~~~~~~~~~~~~~~~~~~

Rule: assignment quotes
~~~~~~~~~~~~~~~~~~~~~~~

Rule: immutable globals
~~~~~~~~~~~~~~~~~~~~~~~

- keep them to minimum
- USE_UPPER_CASE_FORMAT
- make them readonly

