Getting started with ansible
============================




Control node:
    A system on which Ansible is installed.

Managed node:
    A remote system, or host, that Ansible controls

Inventory:
    A list of managed nodes that are logically organized.


.. important:: If your managed node (e.g routers etc) don't have python. You can use only ``raw`` or ``script`` module https://stackoverflow.com/questions/62714153/does-ansible-shell-module-need-python-on-target-server

1. Install ansible::

    python3 -m pip install --user ansible
    sudo apt-get install sshpass


2. Create playbook e.g. ``testplay.yml`` as below

.. code-block:: yaml

   --- 
   - hosts: all
     gather_facts: no
     
     tasks:
       - name: Create file
         ansible.builtin.raw: touch /tmp/file.txt

       - name: Fill data to file.txt
         ansible.builtin.raw: echo "12345" > /tmp/file.txt
        
3. Make dir ``inventory`` alongside with ``testplay.yml`` and add into it file ``all`` with content::

    [openWRT]
    192.168.0.101 ansible_user=sshroot ansible_ssh_pass=YOUR_DEVICE_SSH_PASS

4. To run ansible script type::

    ansible-playbook -i inventory testplay.yml

5. Verify if ``/tmp/file.txt`` on your device has following content: ``12345``