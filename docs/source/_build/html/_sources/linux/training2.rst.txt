Training#2
==========

SystemD
~~~~~~~~~~

1) Zmiana portu dla ssh
::
   
   sudo nano /etc/ssh/sshd_config
   listing port: sudo semanage port -l

   sudo semanage port -a -t ssh_port_t -p tcp 2022

2) 

#Linux 1

Cwiczenie 1
-----------

1) Sprawdź, jakie polecenia uruchomił dowolny inny użytkownik, pracujący w tej chwili w
systemie. ::

   ps aux | grep -v $USER | tail -1

2) Uruchom w tle wyszukiwanie w całym systemie plików o nazwach pasujących do wzorca
“*user*”, błędy przekieruj na urządzenie puste, wyniki do pliku wyniki. Uruchamiając,
obniż priorytet tego polecenia do najniższego. ::
   
   nice -n20 find / -name "*user*"  2>/dev/null >/tmp/wyniki&

Cwiczenie 2
-----------

https://www.tecmint.com/create-raid-6-in-linux/