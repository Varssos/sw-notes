VS code problems
================


Unable to connect to remote device with Remote-SSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Context:
You are able to connect to device via ssh.
You are not able to connect in vscode with Remote-SSH extension.

::

    [20:47:13.751] stderr> rm: cannot remove '/home/user/.vscode-server/bin/252e5463d60e63238250799aef7375787f68b4ee/out/vs/server/node/server.main.js': Permission denied

**Fix:**

1. Try to: ``ctrl+shift+p`` and ``Remote-SSH: Kill VS Code server on host``
2. If it still fails, try to remove all content from ``~/.vscode-server/bin`` on remote machine::

    cd ~/.vscode-server/bin
    ls
    sudo rm -rf ./*


3. If it still fails, try to remove ``~/.config/Code/User/globalStorage/ms-vscode-remote.remote-ssh`` content on your host machine
4. Try again: Remote-SSH: Kill VS Code server on host
5. Now it should connect correctly
