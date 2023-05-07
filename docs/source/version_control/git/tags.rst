Tags
====

`Git tagging documentation <http://link>`_ 

Listing your tags::

    git tag

Listing your tags with pattern::

    git tag -l "v1.8.5*"

Creating annotated tags::

    git tag -a v1.4 -m "my version 1.4"

Creating lightweight tags::

    git tag v1.4-lw

Show tag data::

    git show v1.4
    # Output
    tag v1.4
    Tagger: Ben Straub <ben@straub.cc>
    Date:   Sat May 3 20:19:12 2014 -0700

    my version 1.4

    commit ca82a6dff817ec66f44342007202690a93763949
    Author: Scott Chacon <schacon@gee-mail.com>
    Date:   Mon Mar 17 21:52:11 2008 -0700

Update tag on remote server::

    git push origin v1.5

Delete tags::

    git tag -d v1.4-lw

Checkout tags::

    git checkout v2.0.0