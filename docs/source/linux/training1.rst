Training1
=========



Cwiczenie 1
-----------
Linux.ppt

#. Utwórz konto dla użytkownika Kermit wraz z katalogiem domowym ``sudo useradd -d /home/Kermit -m Kermit``
#. Utwórz konto dla użytkownika Piggy, ale katalog domowy ma być ustawiony na /muppety/Piggy. ``sudo useradd -d /muppety/Piggy -m Piggy``
#. Utwórz grupę muppety. ``sudo groupadd muppety``
#. Dodaj do grupy muppety użytkowników Kermit oraz Piggy. ``sudo usermod -G muppety Kermit``
#. Przenieś katalog domowy dla użytkownika Kermit na /muppety/Kermit. ``sudo mv /home/Kermit/ /muppety/``
#. Zablokuj hasło użytkownikowi Piggy. ``sudo usermod -L Piggy``
#. Odblokuj konto Piggy ``sudo usermod -U Piggy``

Cwiczenie 2
-----------

Linux1.pdf

1) Zaloguj się do systemu.
2) Zmień własne hasło. ``sudo passwd $USER``
3) Sprawdź własny identyfikator oraz grupy, do których należysz. ``id``
4) Sprawdź kto jest zalogowany w chwili obecnej w systemie. ``w/who/finger``
5) Zapoznaj się z opisem struktury katalogów – polecenie man 7 hier.
   ``man 7 hier``
6) Wyświetl zawartość katalogu domowego. ``ls ~``

7) Wyświetl zawartość podstawowych katalogów w systemie (np. /dev, /etc,
   /home, /usr).

::

   ls /dev

8)  Utwórz katalog kat1 w katalogu domowym. ``mkdir kat1``
9)  W katalogu kat1 utwórz jednym poleceniem strukturę katalogów
    kat2/kat3/kat4. ``mkdir -p kat2/kat3/kat4``
10) Usuń jednym poleceniem cała strukturę katalogów kat3/kat4.

::

   cd ~/kat1/kat2
   rm -rf kat3

11) Utwórz w katalogu domowym pliki o dowolnych nazwach z rozszerzeniami
    .txt i .c.

::

   touch test.txt
   touch test.c

12) Skopiuj jednym poleceniem wszystkie pliki z katalogu domowego z
    rozszerzeniem .txt do katalogu kat1.

::

   cp *.txt ./kat1/

13) Skopiuj jednym poleceniem wszystkie pliki z katalogu domowego z
    rozszerzeniem .c do katalogu kat2.

::

   cp *.c ./kat1/kat2

14) Skopiuj całą strukturę katalogów kat1 tworząc analogiczną strukturę
    o nazwie kat1b.

::

   cp -r kat1/ kat1b

15) Usuń wszystkie plik z katalogu kat1/kat2.

::

   rm kat1/kat2/*

16) Usuń jednym poleceniem całą strukturę katalogów kat1b.

::

   rm -rf kat1b

17) Zmień nazwę dowolnego pliku w katalogu kat1.

::

   mv ~/kat1/test.txt test3.txt

18) Przenieś katalog kat1/kat2 do katalogu domowego tworząc w ten sposób
    katalog kat2b.

::

   mv ~/kat1/kat2/ ~/kat2b

19) Przy pomocy programu locate znajdź wszystkie pozycje, które
    posiadają w nazwie słowo mozilla.

::

   locat "mozilla"

20) Przy pomocy programu locate znajdź wszystkie pozycje, które
    posiadają w nazwie słowo mozilla i znajdują się w podkatalogach
    katalogu /usr.

::

   locate /usr/ --basename "mozilla"

21) Korzystając z programu find znajdź wszystkie pliki, które posiadają
    w nazwie słowo mozilla i znajdują się w podkatalogach katalogu /usr.

::

   find /usr/ -name "mozilla"

22) Korzystając z programu find znajdź wszystkie katalogi o nazwie bin,
    które znajdują się w katalogu /usr.

::

   find /usr/ -name "bin" -type d

23) Skopiuj wszystkie pliki zwykłe o rozmiarze pomiędzy 10 a 100 bajtów
    z katalogu /usr/bin do katalogu kat1/kat2 (wykorzystaj polecenie
    find z parametrem -exec).

::

   find /usr/bin -type f -size +10c -size -100c -exec cp {} /tmp/pliki/ \; -print 

24) W katalogu domowym utwórz plik o nazwie plik.txt – sprawdź jakie są
    prawa dostępu do niego

::

   touch plik.txt
   ls -la

25) Dla pliku plik.txt dodaj prawo zapisu dla grupy.

::

   sudo chmod g+w plik.txt

26) Dla pliku plik.txt odejmij prawo zapisu dla właściciela.

::

   sudo chmod u-r plik.txt

27) Dla pliku plik.txt dodaj prawo wykonywania dla wszystkich
    użytkowników.
28) Dla pliku plik.txt przywróć oryginalne prawa korzystając z notacji
    numerycznej.
29) Utwórz dowiązanie do pliku plik.txt o nazwie plik2.txt w katalogu
    domowym.
30) Utwórz dowiązanie symboliczne do katalogu kat1/kat2 o nazwie abc w
    katalogu domowym.
31) Przejrzyj pomoc systemową dla wszystkich poleceń zaprezentowanych
    podczas zajęć.

Linux3:

0) Wyśw. plik /etc/passwd z podziałem na strony przyjmując, że
strona ma 5 linii tekstu.

::

   more -5 /etc/passwd

1) Korzystając z polecenia cat utwórz plik tekst3, który będzie składał
   się z zawartości pliku tekst1, ciągu znaków podanego ze standardowego
   wejścia (klawiatury) i pliku tekst2.

::

   cat tekst1 > tekst3 && cat >> tekst3 && cat tekst2  >> tekst3

2) Wyświetl po 5 pierwszych linii wszystkich plików w swoim katalogu
   domowym w taki sposób, aby nie były wyświetlane ich nazwy.

::

   head -5 * 2>/dev/null -q

3) Wyświetl linie o numerach 3, 4 i 5 z pliku /etc/passwd
   ``cat -n /etc/passwd | head -5 | tail -3``
4) Wyświetl linie o numerach 7, 6 i 5 od końca pliku /etc/passwd
   ``tac  /etc/passwd | head -7 | tail -3``
5) Wyświetl zawartość /etc/passwd w jednej linii
   ``cat /etc/passwd | tr '\n' ' '``
6) Za pomocą filtru tr wykonaj modyfikację pliku, polegającą na
   umieszczeniu każdego słowa w osobnej linii.

::

   cat pliktest | tr ' ' '\n' > pliktest2

7) Zlicz wszystkie pliki znajdujące się w katalogu /etc i jego
   podkatalogach

::

   find /etc/ -type f | wc -l

8) Napisać polecenie zliczające sumę znaków z pierwszych trzech linii
   pliku /etc/passwd

::

   head -3 /etc/passwd | wc -c

9) Wyświetl listę plików z aktualnego katalogu, zamieniając wszystkie
   małe litery na duże.

::

   ls | tr [:lower:] [:upper:]

10) Wyświetl listę praw dostępu do plików w aktualnym katalogu, ich
    rozmiar i nazwę

::

   ls -al | tr -s ' '| cut -f1,5,9 -d ' ' | tr ' ' '\t'

11) Wyświetl listę plików w aktualnym katalogu, posortowaną według
    rozmiaru pliku

::

   ls -la | tr -s ' ' | sort -k 5 -n
   ls -alSr | grep -v ^d

12) Wyświetl zawartość pliku /etc/passwd posortowaną wg numerów UID w
    kolejności od największego do najmniejszego

::

   cat /etc/passwd | sort -t : -k 3 -n -r

13) Wyświetl zawartość pliku /etc/passwd posortowaną najpierw wg numerów
    GID w kolejności od największego do najmniejszego, a następnie UID

::

   cat /etc/passwd | sort -t : -k4 -k3 -n -r

14) Podaj liczbę plików każdego użytkownika

::

   find /home/student -type f | wc -l
   find ~ -type f -user student | wc -l

15) Sporządź statystykę praw dostępu (dla każdego z praw dostępu podaj
    ile razy zostało ono przydzielone)

::

   ls -al | cut -f1 -d ' ' | grep -v total | sort | uniq -c

16) Podaj nazwy trzech najmniejszych plików w katalogu posortowane wg
    nazwy

::

   ls -alSr | grep -v total | head -3 | sort -k 9

17) Podaj pięciu użytkowników o największej liczbie uruchomionych
    procesów

::

   ps aux | sort | cut -f1 -d ' ' | grep -v USER | uniq -c | head -5

18) Wyświetl zawartość 3 największych podkatalogów katalogu bieżącego

::

   ls -al `sudo du | sort -n -r | head -4 | tail -3 | cut -f2`

19) Wyświetl nazwy tych użytkowników, którzy domyślnie używają innego
    interpretera niż bash

::

   cat /etc/passwd | grep -v bash | cut -f1 -d:

20) Wyświetl nazwy wszystkich plików nagłówkowych posortowane
    wykorzystywanych w plikach bieżącego katalogu

::

   find ./ -type f -exec cat {} \; | grep "^#include" | cut -f2 -d ' ' | sort | uniq -c | sort -n -r

21) Wyświetl statystykę używanych komend (bez argumentów) w postaci
    posortowanej listy: ilość komenda ( wsk. należy użyć polecenia
    history)

::

   history | tr  -s ' ' | cut -f3 -d ' ' | sort | uniq -c | sort -n -r

22) W podanym katalogu utwórz podkatalogi wszystkim użytkownikom ze
    swojego roku i dodatkowo zapisz w pliku o nazwie users.txt
    posortowaną listę tych użytkowników.

::

   who i cos tam dalej

23) Sprawdź czy któryś z użytkowników jest zalogowany w systemie więcej niż jeden raz. Dla każdego takiego użytkownika należy wyświetlić jego identyfikator i listę terminali na których pracuje.