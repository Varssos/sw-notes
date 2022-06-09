Clang format
============

Setup clang format in VS code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Windows <https://www.youtube.com/watch?v=xxuaOG0WjIE>`_ 

**On Linux:**

`Tutorial how to set it on Linux <https://eellaup.medium.com/how-to-set-up-clang-format-in-visual-studio-code-in-a-vagrant-environment-georgiatech-gios-1935ed73efd1>`_ 

1. Check available clang-format versions

::

    sudo apt-cache search clang-format

2. Install last version e.g

::

    sudo apt-get install clang-format-12

3. Check location of installed clang-format bin

::

    whereis clang-format-12
    # Output: /user/bin/clang-format-9
    # You should put it in clang-format VS code extension config

4. Install the clang-format VS code extension
5. Edit extension setting in JSON format and add this on the bottom

::
    
    "editor.codeActionsOnSave": {
        "source.fixAll": true
    },
    "editor.formatOnSave": true,
    "clang-format.executable": "/usr/bin/clang-format-12",
    "clang-format.style": "file",
    "clang-format.language.c.enable": true,
    "[c]": {
        "editor.defaultFormatter": "xaver.clang-format",
        "editor.wordBasedSuggestions": false,
        "editor.suggest.insertMode": "replace",
        "editor.semanticHighlighting.enabled": true
    },
    "clang-format.language.cpp.enable": true,
    "[cpp]": {
        "editor.defaultFormatter": "xaver.clang-format",
        "editor.wordBasedSuggestions": false,
        "editor.suggest.insertMode": "replace",
        "editor.semanticHighlighting.enabled": true
    }

1. Download :download:`.clang-format <.clang-format>` and put it in project path







