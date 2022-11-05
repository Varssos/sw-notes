Install and configure packages on OpenWRT
=========================================


:download:`Ansible install packages on OpenWRT <./Install_Packages_And_Configure.tar.gz>` 


To invoke below playbook::

    ansible-playbook -i inventory openwrt-playbook.yml

Example Ansible OpenWRT playbook

.. code-block:: yaml

    ---
    - hosts: all
    gather_facts: no
    vars:
        hostname: sshroot@192.168.0.101
        host_password: XXXXXXXXXX
    
    tasks:
        - name: Update package manager
        ansible.builtin.raw: opkg update

        - name: Install packages
        ansible.builtin.raw: opkg install YOUR_PACKAGE_NAME
        
        - name: Copy default config to 
        delegate_to: localhost
        ansible.builtin.shell: |
            set timeout 300
            spawn scp ./default_configs/config.tar.gz {{hostname}}:/etc/YOUR_PACKAGE_NAME

            expect "{{hostname}}'s password:";
            send "{{host_password}}\r"

            expect eof
        args:
            executable: /usr/bin/expect
        
        # - name: Delete config dir
        #   ansible.builtin.raw: rm -rf /etc/YOUR_PACKAGE_NAME/config

        - name: Extract config file
        ansible.builtin.raw: tar -xzvf /etc/YOUR_PACKAGE_NAME/config.tar.gz -C /etc/YOUR_PACKAGE_NAME/
        
        - name: Remove config.tar.gz
        ansible.builtin.raw: rm -rf /etc/YOUR_PACKAGE_NAME/config.tar.gz

