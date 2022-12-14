Git base knowledge
==================

`Academind git & github 2h course <https://www.youtube.com/watch?v=ulQA5tjJark&t=6555s>`_ 


Git dictionary
~~~~~~~~~~~~~~

- ``git`` - A free version control system
- ``commit`` - save code snapshot
- ``branch`` - alternative code version
- ``checkout`` - move between branches & commits


Github
~~~~~~

A cloud git repository & services provider. It store & manage git repositories. 

It enables:
    - Cloud Git repository storage ``push`` & ``pull``. Public & private, team management & more
    - Code management & collaborative development ( via ``Issues``, ``Projects``, ``Pull Requests`` & more )
    - Automation & CI/CD ( via GitHub Actions, Github Apps & more)


Key git commands
~~~~~~~~~~~~~~~~

Create git repository
---------------------

- ``git init``. This create in current folder ``.git`` folder and init local repo
- You can create repo in gitlab or github in web interface


Create Commits
--------------

1. ``git add <files(s)>`` Stage changes for next commit
2. ``git commit`` Create a commit that includes all stagd changes

::

    git add index.html
    git commit -m "Initial commit"
    git log #(optionaly). It prints only commits before and current HEAD 

Move between Commits
--------------------

- ``git checkout <id>`` Temporarily move to another commit. It change pointer ``HEAD`` to desired commit id


Move between Branches
---------------------

- ``git checkout <branch_name>`` Temporarily move to another branch 


Undo Commits
------------

- ``git revert <id>`` Revert changes of commit by creating a new commit 
- ``git reset --hard <id>`` Undo changes by deleting all commits since <id>


Git ignore
----------

In the root folder you can add ``.gitignore`` file and in each line specify directions/files which should be ignore in ``git add``


Git branches
------------


- ``git branch <branch_name>`` - Create a new branch
- ``git checkout <branch_name>`` - Switch to passed branch name
- ``git checkout - b <branch_name>`` - Create and switch to new branch. Following two above in one command

- ``git branch`` - List existing branches

- ``git branch -D <branch_name>`` - Delete branch

- ``git merge <name>`` - Merge branch

- ``git push origin <local_branch_name>`` - Push local branch to remote(origin) 

Git remote
----------

- ``git remote`` - Print origin
- ``git remote get-url origin`` - Print url of remote repo

Git config
----------
::

    git config --global user.name "Varssos"
    git config --global user.email "abcd@gmail.com"

GitHub Repositories
~~~~~~~~~~~~~~~~~~~

Start remote repo
-----------------

You have 2 options after creating a remote repo on github/gitlab etc:

1. If you don't have local repo at start::

    git clone <your_github_url>
    # E.g.
    git clone https://github.com/Varssos/github-crash-course.git

2. If you want to add local repo to empty remote::

    git remote add origin <your_github_url>
    git remote add origin https://github.com/Varssos/github-crash-course.git
    git push --set-upstream origin master
    # If there will be problem with authentication, checkout 


Github authenticate
-------------------
::

    git remote set-url origin <user@your_github_url>
    git remote set-url origin https://Varssos@github.com/Varssos/github-crash-course.git


Password/Token is in github -> ``Settings`` -> ``Developer settings`` -> ``Personal access tokens`` -> ``Generate new token`` then check ``repo`` scope -> ``Generate token`` and copy token.

This token is set for each collaborator. It is not taken from creator account!!!


Add github collaborators
------------------------

1. ``Settings`` -> ``Collaborators`` and then add colaborator
2. You should set branch protection. ``Settings`` -> ``Branches`` -> add ``Branch name pattern`` like ``master``. Check ``Require a pull request before merging`` -> ``Create``


Github Pull request or Merge request
------------------------------------

1. Go to ``Pull request`` section
2. Choose to which branch it will be merge/pull, then from which branch
3. Write text, you can specify issue with ``#{issue_num}`` like: ``#1``
4. ``Create pull request``
5. Now someone should verify it and accept