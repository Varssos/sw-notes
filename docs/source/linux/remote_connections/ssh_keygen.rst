ssh-keygen
==========

`Generate ssh keys ssh academy <https://www.ssh.com/academy/ssh/keygen>`_ 

`How to generate ssh keys on ubuntu <https://phoenixnap.com/kb/generate-setup-ssh-key-ubuntu>`_ 

::

    cd ~/.ssh
    ssh-keygen -t rsa
    # Pass file name e.g.  test_x
    # Pass password
    # On the result you will get private key: test_x and public: test_x.pub
    # Then you can copy to remote machine
    ssh-copy-id -p PORT -i ~/.ssh/YOUR_PUB_KEY.pub USER@IP


Expected output::

    $ ssh-copy-id -p PORT -i ~/.ssh/YOUR_PUB_KEY.pub USER@IP
    /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "YOUR_PUB_KEY.pub"
    /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
    /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
    USER@IP's password: 

    Number of key(s) added: 1

    Now try logging into the machine, with:   "ssh 'USER@IP'"
    and check to make sure that only the key(s) you wanted were added.
