Ansible become password
=======================

Password in ansible.cfg
~~~~~~~~~~~~~~~~~~~~~~~
Add this to ansible.cfg::

    ansible_become_password = 12345


Hashed password in secrets.yml
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. In ``group_vars/all/secrets.yml``::

    ansible_become_password: 12345

2. Encrypt file::

    ansible-vault encrypt ./group_vars/all/secrets.yml

3. In ``ansible.cfg``::

    vault_password_file = pass

4. Create file ``pass`` and fill password::

    echo "12345" > pass

5. Run ansible::

    ansible-playbook ./run.yml
