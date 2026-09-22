.. warning::
    This page has been migrated to varssos-mkdocs (docs/version_control/git/git_bisect.md). This copy is outdated and no longer maintained.

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


Quit from bisect session
~~~~~~~~~~~~~~~~~~~~~~~~
::

    git bisect reset


How to run git bisect for more complex scripts?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Git bisect. Examples <https://git-scm.com/docs/git-bisect#_examples>`

.. code-block:: bash

    #!/bin/bash

    # Test cmd
    cmake --build build

    test_result=$?

    # Check if --look-for-fix flag is passed
    if [[ "$1" == "--look-for-fix" ]]; then
        echo "Looking for a fix"
        if [ $test_result -eq 0 ]; then
            echo "Test PASSED - marking as BAD. Exit 1"
            exit 1
        else
            echo "Test FAILED - marking as GOOD. Exit 0"
            exit 0
        fi
    else
        echo "Looking for regression"
        # Normal mode: pass through the original exit code
        exit $test_result
    fi

Look for regression
-------------------

.. code-block:: bash

    git bisect start
    # Last known failure
    git bisect bad b80429e0253345ee698cf2b79900d2bb3a63cd36
    # Commit which we know that is good
    git bisect good 99bf39086586ec047a56967df12248c8ae60fc75
    # Try to find first failing
    git bisect run ./bisect_test.sh # The best is to run from outside of the project
    git bisect reset


Look for fix revision
---------------------

.. code-block:: bash
    
    git bisect start --term-old=broken --term-new=fixed
    git bisect broken bc71d08f0375dfce9e35f4b5c711e4080894db56
    git bisect fixed f84dac99c46dc0f22ed001b61b63f3093a51cd2a
    git bisect run ./bisect_test.sh --look-for-fix # The best is to run from outside of the project
    git bisect reset
