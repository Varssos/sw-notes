SED
===



Tutorial: https://www.digitalocean.com/community/tutorials/the-basics-of-using-the-sed-stream-editor-to-manipulate-text-in-linux
Pobierz plik BSD.txt do ćwiczenia :download:`BSD.txt`

1. Wyświetlanie tylko przetworzonych lini (-n) ``sed -n 'p' BSD``
2. Printowanie pierwszej lini ``sed -n '1p' BSD``
3. Printowanie lini od 1 do 5 ``sed -n '1,5p' BSD``
4. Printuj od 1 i 4 kolejne ``sed -n '1,+4p' BSD``
5. Printowanie od 1 i co 4 linijki, czyli 1,5,9.. ``sed -n '1~4p' BSD``
6. Usuwanie co drugiej lini startując od 1 ``sed '1~2d' BSD``
7. Usunięcie co drugiej lini statując od 1 i zapisanie do innego pliku ``sed '1~2d' BSD > everyother.txt``
8. Usunięcie co drugą linię statując od 1, ale napisując ``sed -i '1~2d' everyother.txt``
9. Usunięcie co drugą linię startując od 1, nadpisując, ale tworząc backup ``sed -i.bak '1~2d' everyother.txt``
10. Zamień 'ma' na 'MA' w pliku test ``sed -i 's/ma/MA/' test`` lub odwrotnie ``sed -i 's_MA_ma_' test`` ALE, TYLKO PIERWSZE WYSZUKANIA W LINII
11. Zamień wszystkie wystąpienia 'on' na 'forward' ``sed 's/on/forward/g' song.txt``
12. Zamień drugie wystąpienie słowa w linii 'on' na 'forward' ``sed 's/on/forward/2' song.txt``
13. Zamień od drugie wystąpienie słowa w linii 'on' na 'forward' ``sed 's/on/forward/2g' song.txt``
14. Znajdź 'SiNgInG' bez względu na rozmiar litery i zamień na 'saying' ``sed 's/SiNgInG/saying/i' song.txt``
15. Znajdź 'at' i wszystko co jest przed włącznie z 'at' zamień na 'REPLACED' ``sed 's/^*at/REPLACED/' song.txt``
16. Znajdź 'at' i wszystko co jest przed włącznie z 'at' obrocz nawiasami ( ) ``sed 's/^.*at/(&)/' song.txt``
17. Pozamieniaj pierwsze z drugim słowem w linijce ``sed 's/\([^ ][^ ]*\) \([^ ][^ ]*\)\2 \1/' song.txt``
18. Wiersze z łańcuchem 'bash' ``sed -n '/bash/p' /etc/passwd``
19. Wszystko oprócz trzeciego wiersza ``sed -n '3!p' /etc/passwd``




Cwiczenie1
~~~~~~~~~~

1. Wyświetl 20 pierwszych linii pliku.  ``sed -n '1,20p' /etc/passwd``
2. Wyświetl 4-tą linię tekstu. ``sed -n '4p' /etc/passwd`` 
3. zakomentować linie od 5 do 10 w pliku ``sed '5,10 s|.*|//&|' test`` 
4. zakomentować linie od 5 do końca pliku  ``cat -n /etc/passwd | sed '5,$ s|.*|//&|'``
5. Ponumerować linie w pliku ``sed = /etc/passwd``
6. Usuń wszystkie puste linie w danym pliku. ``sed -i '/^$/d' test``
7. W danym pliku zamień wszystkie nawiasy okrągłe na okrągłe. ``cat test | sed -re 's/[(]/[/g' | sed -re 's/[)]/]/g'``
8. Usuń wszystkie kropki i przecinki z tekstu. ``cat pliktest | sed -e 's/,//g' -e 's/\.//g'``
9. W danym pliku zamień wszystkie małe litery a na duże A. ``sed -e 's/a/A/g' test``



Cwiczenie2
~~~~~~~~~~

Here is a article.txt file :download:`txt <article.txt>`
Dla niego wykonaj poniższe zadania

1. Wykasuj  <article> i </article> ``sed -e 's|<article>||g' -e 's|</article>||g' article`` (trzeba | bo / występuje we wzorze)
2. Zamień <title> na Title:, i  usuń </title> ``sed -i -e 's|<title>|Title: |g' -e 's|</title>||g' article``
3. Usuń <para> i </para> ``sed -i -e 's|<para>||g' -e 's|</para>||g' article``
4. Zamień <emphasis> i </emphasis> znakiem * ``sed -i -e 's|<emphasis>|*|g' -e 's|</emphasis>|*|g' article``

::   
   
   This is a <emphasis>great</emphasis> bargain.
   będzie
   This is a *great* bargain.

5. Zamień web na Web ``sed -i -e 's/web/Web/g' article``
6. Zamień linie zaczynające się od  <listing> na ---begin listing ``sed -i -e 's/^<listing>/---begin listing/g' article``
7. Zamień linie zaczynające się od  </listing> na ---end listing ``sed -i -e 's|^</listing>|---end listing|g' article``
8. Zamień &lt; na <. ``sed -i -e 's|&lt|<|g' article``
9. Zamień &gt; na >. ``sed -i -e 's|&gt|>|g' article``
10. Zamień &amp; na &. ``sed -e 's|\&amp|\&\.|g' article``
11. Zamień ścieżkę w ``"modbus-tcp": "/home/user/...."`` w pliku ``modbus_test.cfg.bak``

.. code-block:: bash

   TEST_CFG_PATH="/home/user/bla/bla/"
   sed "s#\"modbus-tcp\":\s\".*\"#\"modbus-tcp\": \"$TEST_CFG_PATH\"#g" modbus_test.cfg.bak

12. Zamień ścieżkę makrze ``#define TEST_CFG_PATH "DODAJ_TU_SCIEZKE"`` w pliku ``abc.hpp``  
    
.. code-block:: bash

   TEST_CFG_PATH="/home/user/bla/bla/"
   sed "s#TEST_CFG_PATH \".*\"#TEST_CFG_PATH \"$TEST_CFG_PATH\"#g" abc.hpp

sed -e "s/^\s.*/{&}/g" basic_shell_tools.rst