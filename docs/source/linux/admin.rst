Admin tools
===========

! Reorganize this page

#. Zmiana portu dla ssh::
   
    sudo nano /etc/ssh/sshd_config
    listing port: sudo semanage port -l
    sudo semanage port -a -t ssh_port_t -p tcp 2022


#. Sprawdź, jakie polecenia uruchomił dowolny inny użytkownik, pracujący w tej chwili w systemie::

    ps aux | grep -v $USER | tail -1

#. Uruchom w tle wyszukiwanie w całym systemie plików o nazwach pasujących do wzorca “*user*”, błędy przekieruj na urządzenie puste, wyniki do pliku wyniki. Uruchamiając, obniż priorytet tego polecenia do najniższego. ::
   
    nice -n20 find / -name "*user*"  2>/dev/null >/tmp/wyniki&





SWAP
~~~~

increase swap::

   sudo dd if=/dev/zero of=/var/swap.fs bs=1M count=1024
   ls -al /var/swap.fs
   sudo chmod 600 /var/swap.fs
   sudo swapon /var/swap.fs
   sudo nano /etc/fstab
   echo "/var/swap.fs none swap defaults 0 0" >> /etc/fstab

Na pliku::

   sudo dd if=/dev/zero of=/var/nowa.fs bs=1M count=1024
   sudo mkfs.ext4 /var/nowa.fs
   sudo mkdir /mnt/partzpliku
   sudo mount /var/nowa.fs /mnt/partzpliku/
   tail -1 /etc/mtab



DNF
---

``https://www.tecmint.com/install-php-8-on-centos/``


CRON
~~~~

crontab-generator.org

crontab -e
357 crontab -l
358 cat /tmp/datazcrona 
359 at now +3 minutes
360 atq
361 at -c 1
362 atq
363 date
364 cat /tmp/datazcrona


atq -  sprawdzanie kolejki do wykoanania dla .. attention
   

Extra Permissions
~~~~~~~~~~~~~~~~~
https://www.thegeekdiary.com/linux-interview-questions-special-permissions-suid-sgid-and-sticky-bit/

setfacl -m u:Kermit:rw echo.txt
getfacl echo.txt

umask 0006


SMTP
~~~~

Po skonfigurowaniu servera smtp według instrukcji :download:`poczta.pdf`  należy odbłokować porty

::

    firewall-cmd --add-service=smtp --permanent
    firewall-cmd --add-service=pop3 --permanent
    firewall-cmd --add-service=pop3s --permanent
    firewall-cmd --add-service=imap --permanent
    firewall-cmd --add-service=imaps --permanent

Na kliencie na drugim urządzeniu instalacja np. thunderbird

user: student
address: student@alma1.test.lab
pass:...



NextCloud
~~~~~~~~~

https://www.tecmint.com/install-nextcloud-on-centos-8/


SystemD
~~~~~~~~~~

1) Zmiana portu dla ssh
::
   
   sudo nano /etc/ssh/sshd_config
   listing port: sudo semanage port -l

   sudo semanage port -a -t ssh_port_t -p tcp 2022
