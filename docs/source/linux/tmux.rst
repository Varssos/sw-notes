Tmux
====

How to configure tmux
~~~~~~~~~~~~~~~~~~~~~
::

    sudo apt update && sudo apt install tmux git
    git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

    mkdir -p ~/Documents/my_files/linux/
    git clone https://github.com/Varssos/tmux_config.git ~/Documents/my_files/linux/tmux_config
    mkdir -p ~/.config/tmux
    ln -s ~/Documents/my_files/linux/tmux_config/tmux.conf ~/.config/tmux/tmux.conf

    tmux source ~/.config/tmux/tmux.conf
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
