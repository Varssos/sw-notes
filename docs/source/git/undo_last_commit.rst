Undo last commit
================

Remove last commit and return to previous::

    git reset --hard [previous Commit SHA id here]
    git push origin [branch Name] -f

If you want to keep your changes, you can also use::

    git reset --soft [previous Commit SHA id here]