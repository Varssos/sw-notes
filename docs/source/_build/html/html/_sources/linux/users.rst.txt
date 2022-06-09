Users
=====


#. Utwórz konto dla użytkownika Kermit wraz z katalogiem domowym ``sudo useradd -d /home/Kermit -m Kermit``
#. Utwórz konto dla użytkownika Piggy, ale katalog domowy ma być ustawiony na /muppety/Piggy. ``sudo useradd -d /muppety/Piggy -m Piggy``
#. Utwórz grupę muppety. ``sudo groupadd muppety``
#. Dodaj do grupy muppety użytkowników Kermit oraz Piggy. ``sudo usermod -G muppety Kermit``
#. Przenieś katalog domowy dla użytkownika Kermit na /muppety/Kermit. ``sudo mv /home/Kermit/ /muppety/``
#. Zablokuj hasło użytkownikowi Piggy. ``sudo usermod -L Piggy``
#. Odblokuj konto Piggy ``sudo usermod -U Piggy``
#. Zmień własne hasło ``sudo passwd $USER``
#. Sprawdź własnt identyfikator oraz grupy, do których należysz ``id``
#. Sprawdź kto jest zalogowany w chwili obecnej w systemie ``w/who/finger``

