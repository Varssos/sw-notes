Tmux
====

How to configure tmux
~~~~~~~~~~~~~~~~~~~~~

`How to configure tmux, Dreams of Code <https://www.youtube.com/watch?v=DzNmUNvnB04>`_

::

    sudo apt update && sudo apt install tmux git
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

    mkdir -p ~/Documents/my_files/linux/
    git clone https://github.com/Varssos/tmux_config.git ~/Documents/my_files/linux/tmux_config
    mkdir -p ~/.config/tmux
    ln -s ~/Documents/my_files/linux/tmux_config/tmux.conf ~/.config/tmux/tmux.conf

    ~/.tmux/plugins/tpm/scripts/source_plugins.sh
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh



    # In case of any modifications in tmux config use that to source changes:
    tmux source ~/.config/tmux/tmux.conf


Create sessions and windows to existing session
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example of creating tmux session with two windows::

    tmux new-session -d -s my-session-1 -n my-window-1
    tmux new-window -n my-window-2 -t my-session-1

Create sessions with multiple windows on startup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. sudo nano /etc/init.d/tmux_startup
2. Fill ``~/.bashrc`` with::

    #!/bin/bash

    sessions=("abc" "xyz" )

    if tmux has-session -t abc > /dev/null 2>&1; then
        :
    else
        for session in "${sessions[@]}"; do
            tmux new-session -d -s "$session" -n build
            tmux new-window -n flash -t "$session"
            tmux new-window -n test -t "$session"
        done
    fi

3. On next reboot it should create tmux session on startup
