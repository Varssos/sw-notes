Get file from remote repo
=========================

1. git fetch will download all the recent changes, but it will not put it in your current checked out code (working area)::

    git fetch

2. git checkout / -- path/to/file will checkout the particular file from the downloaded changes (origin/master)::

    git checkout origin/master -- path/to/file