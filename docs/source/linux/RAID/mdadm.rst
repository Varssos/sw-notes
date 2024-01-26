mdadm
=====

We asume that you have 2 disk drives and you try to create raid1 (mirror)

Setup raid1 with mdadm on ubuntu 22.04
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Install mdadm::

    sudo apt-get install mdadm

2. Check if disk drives are visible under /dev/sdc /dev/sdd etc::

    lsusb
    sudo fdisk -l

3. If you have existing partitions on your disk drives and you want to erase them::

    sudo fdisk /dev/sdc
    d
    w

4. Create raid1::

    sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdc /dev/sdd

5. Create ext4 fs on your raid::

    sudo mkfs.ext4 /dev/md0

6. Mount raid::

    sudo mkdir /mnt/raid
    sudo mount /dev/md0 /mnt/raid

7. Add to fstab::

    echo "/dev/md0    /mnt/raid    ext4    defaults    0    2" >> /etc/fstab

8. Check sync status::

    cat /proc/mdstat

How to remove mdadm raid
~~~~~~~~~~~~~~~~~~~~~~~~
::

    cat /proc/mdstat
    sudo mount | grep /dev/md0
    sudo umount /dev/md0
    sudo fuser -mv /dev/md0
    sudo mdadm --stop /dev/md0
    sudo mdadm --remove /dev/md0

It was safe for me to remove raid and recreate it again(without data loss)
::

    sudo mdadm --stop /dev/md0
    sudo mdadm --remove /dev/md0
    sudo mdadm --zero-superblock /dev/sdb
    sudo mdadm --zero-superblock /dev/sdc
    # Then create again with ansible

How to setup mdadm with RAID1 in ansible
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is based on that role: `ansible-mdadm Github <https://github.com/mrlesmithjr/ansible-mdadm/tree/master>`_

1. Install galaxy dependency::

    ansible-galaxy install mrlesmithjr.mdadm

2. In ``run.yml`` add role like this

.. code-block:: yaml

    ---
    - hosts: nas
      become: yes
      vars:
        mdadm_arrays:
        # Define array name
        - name: 'md0'
        # Define disk devices to assign to array
        devices:
            - '/dev/sdc'
            - '/dev/sdd'
        # Define filesystem to partition array with
        filesystem: 'ext4'
        # Define the array raid level
        # 0|1|4|5|6|10
        level: '1'
        # Define mountpoint for array device
        mountpoint: '/mnt/md0'
        # Define if array should be present or absent
        state: 'present'
        # Set mount options (optional)
        opts: 'noatime'

     roles:
       - role: mrlesmithjr.mdadm

You can move that vars to your ``vars.yml``
