Ansible playbooks
=================

Run playbook
~~~~~~~~~~~~
::

    ansible-playbook run.yml -K --ask-vault-pass

``run.yml:``

.. code-block:: yaml

    ---
    - hosts: all
      become: yes

      tasks:
        - import_tasks: tasks/essential.yml


Tasks e.g. in ``tasks/essential.yml``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Update packages with dnf
------------------------
.. code-block:: yaml

    - name: Update packages
      dnf:
        name: "*"
        state: latest

Update packages with apt
------------------------
.. code-block:: yaml

    - name: Update packages
      apt:
        update_cache: yes
        upgrade: yes

Install packages
----------------
.. code-block:: yaml

    - name: Install essential packages
      package:
        packages:
          - vim
          - htop
          - neofetch
          - tmux
          - speedtest-cli
        state: latest

