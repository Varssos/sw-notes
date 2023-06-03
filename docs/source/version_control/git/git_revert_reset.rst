Git reset/revert, undo changes/files
====================================


Create commit which revert our changes in commit <commit_id>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git revert <commit_id>


Reset commit, stay with unstaged modifications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Reset to state in <commit_id>, commits ahead of that commit will be erased from history and modification will be not staged
::

    git reset <commit_id>


Reset commits, stay with staged modifications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Reset to state in <commit_id>, commits ahead of that commit will be erased from history and modification will be staged
::

    git reset --soft <commit_id>


Erase commits before and on that <commit_id>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git reset --hard <commit_id>


Unstage file
~~~~~~~~~~~~
::

    git reset -- <file>

Erase local file modification
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git checkout -- <file>


Unstage file and erase local modification
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git reset -- <file>
    git checkout -- <file>
