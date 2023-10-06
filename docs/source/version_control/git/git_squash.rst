Git squash
==========

Squash child commits to one above the ``parent_commit_id``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
All the commit above the <parent_commit_id> can be couple into one
::

    git rebase -i <parent_commit_id>


Squash N commits from top
~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git rebase -i HEAD~N


Squash commits from branch ``squash-merge-branch`` to ``master``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git checkout master
    git merge --squash <branch_to_squash>