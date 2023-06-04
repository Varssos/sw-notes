Git log
=======

Show complete repo commit history
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log

Show last N commits history
~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log -N
    git log -3

Show author commits
~~~~~~~~~~~~~~~~~~~
::

    git log --author=<author_name>

Show commits before date
~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --before "2023-05-12"

Show commits after date
~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --after "2023-05-13"


Show commit modifications history
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log -p


Show commit short stat modifications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --stat


Show commits each in one line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --oneline


Present commit history in ASCII graph mode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --graph


Search phrase in commit messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log --grep="YOUR_PHRASE"


Search commits connected with file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git log -- PATH_TO_YOUR_FILE
