Training#4
==========

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



