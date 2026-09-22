.. warning::
    This page has been migrated to varssos-mkdocs (docs/network/linux_networking.md). This copy is outdated and no longer maintained.

Network diagnostic on Linux
===========================

1. arp -n                   // Zwraca tablicę cache adresów które zostały poprawnie odwzorowane
2. nc {ip} {port}           // Sprawdzanie połączenia
3. ping -I {interface} {ip} // Pingowanie przez wybrany interfejs
4. netstat -a -n | grep ESTABLISHED // sprawdzanie aktywne sesje
5. nmap {ip} 	 // scan ports for ip