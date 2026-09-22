.. warning::
    This page has been migrated to varssos-mkdocs (docs/version_control/git/git_blame.md). This copy is outdated and no longer maintained.

Git blame
=========

`Git blame doc <https://git-scm.com/docs/git-blame>`_

`Git blame bitbucket tutorial <https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-blame>`_


Show revision and author last modified each line of a file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame README.md

Git blame show from line 1 to line 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame -L 1,5 README.md


Show email instead of username
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame -e README.md

Ignore whitespace changes
~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame -w README.md

Detects moved or copied lines within in the same same
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame -M README.md

Detects lines that were moved or copied from other files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git blame -C README.md
