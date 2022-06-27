rm undo single file
===================

::

    # this restores the file status in the index
    git reset -- <file>
    # then check out a copy from the index
    git checkout -- <file>