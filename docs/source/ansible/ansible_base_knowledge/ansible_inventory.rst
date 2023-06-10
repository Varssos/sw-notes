Ansible inventory
=================

- Default location for inventory is ``/etc/ansible/hosts``.
- You can specify different inventory with ``-i <path>``
- Create ``ansible.cfg`` with pointing to default inventory location::

    [defaults]
    INVENTORY = inventory


Basic inventory in INI format
::

    [ubuntu]
    192.168.0.62
    192.168.0.63


Inventory with passwords in INI format
::

    [ubuntu]
    192.168.0.62 ansible_user=seba_nas ansible_port=5555 ansible_ssh_pass=YOUR_DEVICE_SSH_PASS
    192.168.0.63 ansible_user=seba_nas ansible_port=5555 ansible_ssh_pass=YOUR_DEVICE_SSH_PASS

Inventory with keys
::

    [ubuntu]
    192.168.0.62 ansible_user=seba_nas ansible_ssh_private_key_file=~/.ssh/nas_seba


Or set inventory in yaml format

.. code-block:: yaml

    machines:
        hosts:
            seba_nas:
                ansible_host: 192.168.0.62
                ansible_port: 5555
                ansible_user: seba_nas

Or set ansible_user as vars

.. code-block:: yaml

    machines:
        hosts:
            seba_nas:
                ansible_host: 192.168.0.62
                ansible_port: 5555
            
        vars:
            ansible_user: seba_nas




Use metagroups in inventory

.. code-block:: yaml

    nas:
        hosts:
            seba_nas:
            ansible_host: 192.168.0.62

    rpi:
        hosts:
            seba_rpi:
            ansible_host: 192.168.0.60

    home_lab:
        children:
            nas:
            rpi:
