ssh-keygen
==========

`Generate ssh keys ssh academy <https://www.ssh.com/academy/ssh/keygen>`_ 

::

    cd ~/.ssh
    ssh-keygen -t rsa
    # Pass file name e.g.  test_x
    # Pass password
    # On the result you will get private key: test_x and public: test_x.pub
    # Then you can copy to remote machine
    ssh-copy-id -p PORT -i ~/.ssh/YOUR_PUB_KEY.pub USER@IP