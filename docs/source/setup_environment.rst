ReadtheDocs setup environment
=============================

VS code
~~~~~~~

1. Install ``reStructuredText`` and ``Extension Pack for reStructuredText`` extensions
2. Create a file ``.vscode/settings.json`` in project folder
3. Add on the bottom::
   
    "esbonio.sphinx.buildDir" : "${workspaceFolder}/docs/build",
    "esbonio.sphinx.confDir"  : "${workspaceFolder}/docs/source",
    "esbonio.sphinx.srcDir"   : "${workspaceFolder}/docs/source",
    "esbonio.server.enabled": true,
    "restructuredtext.linter.run": "onSave",
    "restructuredtext.preview.name": "sphinx",
    "restructuredtext.preview.scrollEditorWithPreview": false,
    "restructuredtext.preview.scrollPreviewWithEditor": false

4. In case of any problems check `setting live preview <https://docs.restructuredtext.net/articles/configuration.html#live-preview>`_ 
5. If extension has problem with e.g. ``esbonio language server`` and there is no idea what is the problem. You can:

   1. Save VS code settings from ``settings.json`` and data from ``~/.config/Code/``
   2. Uninstall VS code
   3. Remove config files from ``~/.config/Code/``
   4. `Install VS code on Linux <https://code.visualstudio.com/docs/setup/linux>`_ 
   5. If needed go to first steps of configuring VS code

6. Or try to run VS code ``code . --no-sandbox``