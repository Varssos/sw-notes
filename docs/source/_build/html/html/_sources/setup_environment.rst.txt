ReadtheDocs setup environment
=============================

VS code
~~~~~~~

1. Create a file ``.vscode//settings.json`` in project folder
2. Add on the bottom::
   
    "esbonio.sphinx.buildDir" : "${workspaceFolder}/docs/source/_build/html",
    "esbonio.sphinx.confDir"  : "${workspaceFolder}/docs/source",
    "esbonio.sphinx.srcDir"   : "${workspaceFolder}/docs/source",
    "esbonio.server.enabled": true,
    "restructuredtext.linter.run": "onSave"

3. In case of any problems check `this <https://docs.restructuredtext.net/articles/configuration.html#live-preview>`_ 