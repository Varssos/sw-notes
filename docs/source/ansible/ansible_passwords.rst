Ansible passwords/secrets
=========================


https://www.redhat.com/sysadmin/ansible-playbooks-secrets

`Ansible Vault <https://docs.ansible.com/ansible/latest/vault_guide/index.html>`_ 

Encrypt your api_key.yml
~~~~~~~~~~~~~~~~~~~~~~~~
::

    ansible-vault encrypt api_key.yml

Run playbook with asking for vaule pass
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ansible-playbook main.yml --ask-vault-pass

Decrypt your api_key.yml
~~~~~~~~~~~~~~~~~~~~~~~~
::

    ansible-playbook decrypt api_key.yml
