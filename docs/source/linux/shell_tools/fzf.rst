fzf
===

Useful links:
https://thevaluable.dev/fzf-shell-integration/


Install fzf on debian based systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    sudo apt install fzf

Setup fzf key bindings::

    echo -e "\nsource /usr/share/doc/fzf/examples/key-bindings.bash" >> ~/.bashrc
    # In the future there should be a completion.bash not only completion.zsh!


Now you should be able to use CTRL-t -> fzf to search for files in current directory.
ALT-c -> fzf to search for directories in current directory.
CTRL-r -> fzf to search for history.


Example usages of fzf
~~~~~~~~~~~~~~~~~~~~~

Replacement for interactive find in current directory::

    fzf

Open file in vim::

    vim $(fzf)


Kill process in interactive way::

    ps -ef | fzf | awk '{print $2}' | xargs kill -9

Preview file content::

    find . -type f | fzf --preview 'less {}'
