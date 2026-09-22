.. warning::
    This page has been migrated to varssos-mkdocs (docs/version_control/repo_tool/repo_useful_examples.md). This copy is outdated and no longer maintained.

Repo useful examples
====================


Override all projects with remote changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    repo forall -c "git reset --hard HEAD"