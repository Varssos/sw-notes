Git bisect
==========


`Git bisect doc <https://git-scm.com/docs/git-bisect>`_ 

`Tutorial how to run automatic git bisect <https://migarstka.github.io/gitbisect/>`_ 


How to run automatic git bisect
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    git bisect start
    git bisect bad HEAD
    git bisect good <last_good_commit>
    git bisect run <check_command>
    
    # E.g.
    git bisect start
    git bisect bad HEAD
    git bisect good c5b6863
    git bisect run cmake --build build


Quit from bisect section
~~~~~~~~~~~~~~~~~~~~~~~~
::

    git bisect reset