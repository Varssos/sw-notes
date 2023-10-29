ReadtheDocs setup environment
=============================

VS code setup for ReadtheDocs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Install ``reStructuredText`` and ``Extension Pack for reStructuredText`` extensions and ``WSL`` in case of windows system
2. On windows: Open project with click in the left bottom corner and ``Open Folder in WSL...``
3. Install esbonio, docutils::

    pip install esbonio
    pip install docutils
    pip install sphinx-rtd-theme
    pip install restructuredtext-lint
    pip install rstcheck
    pip install doc8

    # Or 

    pip install --upgrade esbonio==0.16.0
    pip install --upgrade docutils==0.18.1
    pip install --upgrade sphinx-rtd-theme==1.2.0
    pip install --upgrade restructuredtext-lint==1.4.0
    pip install --upgrade rstcheck==6.1.1
    pip install --upgrade doc8==0.11.2


    
4. Create a file ``.vscode/settings.json`` in project folder
5. Add on the bottom::
   
    "esbonio.sphinx.buildDir" : "${workspaceFolder}/docs/build",
    "esbonio.sphinx.confDir"  : "${workspaceFolder}/docs/source",
    "esbonio.sphinx.srcDir"   : "${workspaceFolder}/docs/source",
    "esbonio.server.enabled": true,
    "restructuredtext.linter.run": "onSave",
    "restructuredtext.preview.name": "sphinx",
    "restructuredtext.preview.scrollEditorWithPreview": false,
    "restructuredtext.preview.scrollPreviewWithEditor": false

6. In case of any problems check `setting live preview <https://docs.restructuredtext.net/articles/configuration.html#live-preview>`_ 
7. If extension has problem with e.g. ``esbonio language server`` and there is no idea what is the problem. You can:

   1. Save VS code settings from ``settings.json`` and data from ``~/.config/Code/``
   2. Uninstall VS code
   3. Remove config files from ``~/.config/Code/``
   4. `Install VS code on Linux <https://code.visualstudio.com/docs/setup/linux>`_ 
   5. If needed go to first steps of configuring VS code

8. Or try to run VS code ``code . --no-sandbox``