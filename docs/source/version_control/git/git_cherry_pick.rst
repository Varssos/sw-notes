.. warning::
    This page has been migrated to varssos-mkdocs (docs/version_control/git/git_cherry_pick.md). This copy is outdated and no longer maintained.

Git cherry-pick
===============

Put commit to current branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git cherry-pick <commit_hash>


Put some commits to current branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git cherry-pick <commit_1_hash> <commit_2_hash>


Apply commit changes to staging on current branch
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git cherry-pick -n <commit_hash>
