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
