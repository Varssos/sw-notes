Basic shell tools
=================


1. Przy pomocy programu locate znajdź wszystkie pozycje, które posiadają w nazwie słowo mozilla

.. raw:: html
   
   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   locate "mozilla"

.. raw:: html

   </details>


2.  Przy pomocy programu locate znajdź wszystkie pozycje, które posiadają w nazwie słowo mozilla i znajdują się w podkatalogach katalogu /usr.


.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   locate /usr/ --basename "mozilla"

.. raw:: html

   </details>


3. Korzystając z programu find znajdź wszystkie pliki, które posiadają w nazwie słowo mozilla i znajdują się w podkatalogach katalogu /usr.


.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find /usr/ -name "mozilla"ls -alSr | grep -v ^d

.. raw:: html

   </details>


4. Korzystając z programu find znajdź wszystkie katalogi o nazwie bin, które znajdują się w katalogu /usr.


.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find /usr/ -name "bin" -type d

.. raw:: html

   </details>


5.  Skopiuj wszystkie pliki zwykłe o rozmiarze pomiędzy 10 a 100 bajtów z katalogu /usr/bin do katalogu /tmp/files (wykorzystaj polecenie find z parametrem -exec).


.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find /usr/bin -type f -size +10c -size -100c -exec cp {} /tmp/files/ \; -print 

.. raw:: html

   </details>


6.  W katalogu domowym utwórz plik o nazwie plik.txt – sprawdź jakie są prawa dostępu do niego

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   touch plik.txt
   ls -la

.. raw:: html

   </details>


1. Dla pliku plik.txt dodaj prawo zapisu dla grupy.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   sudo chmod g+w plik.txt

.. raw:: html

   </details>


8. Dla pliku plik.txt odejmij prawo zapisu dla właściciela

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   sudo chmod u-r plik.txt

.. raw:: html

   </details>


9. Dla pliku plik.txt dodaj prawo wykonywania dla wszystkich użytkowników.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

    sudo chmod +x plik.txt

.. raw:: html

   </details>


10.  Dla pliku plik.txt przywróć oryginalne prawa korzystając z notacji numerycznej.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

    chmod 644 test.txt

.. raw:: html

   </details>


11.  Utwórz dowiązanie do pliku plik.txt o nazwie plik2.txt w katalogu domowym.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

    ln -s plik.txt plik2.txt

.. raw:: html

   </details>


12.  Utwórz dowiązanie symboliczne do katalogu kat1/kat2 o nazwie abc w katalogu domowym

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ln -s kat1/kat2 abc

.. raw:: html

   </details>


13. Wyświetl plik /etc/passwd z podziałem na strony przyjmując, że strona ma 5 linii tekstu.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   more -5 /etc/passwd

.. raw:: html

   </details>


14. Korzystając z polecenia cat utwórz plik tekst3, który będzie składał się z zawartości pliku tekst1, ciągu znaków podanego ze standardowego wejścia (klawiatury) i pliku tekst2.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat tekst1 > tekst3 && cat >> tekst3 && cat tekst2  >> tekst3

.. raw:: html

   </details>


15. Wyświetl po 5 pierwszych linii wszystkich plików w swoim katalogu domowym w taki sposób, aby nie były wyświetlane ich nazwy.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   head -5 * 2>/dev/null -q

.. raw:: html

   </details>


16.  Wyświetl linie o numerach 3, 4 i 5 z pliku /etc/passwd

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat -n /etc/passwd | head -5 | tail -3

.. raw:: html

   </details>


17. Wyświetl linie o numerach 7, 6 i 5 od końca pliku /etc/passwd

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   tac  /etc/passwd | head -7 | tail -3

.. raw:: html

   </details>


18. Wyświetl zawartość /etc/passwd w jednej linii

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat /etc/passwd | tr '\n' ' '

.. raw:: html

   </details>


19. Za pomocą filtru tr wykonaj modyfikację pliku, polegającą na umieszczeniu każdego słowa w osobnej linii.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat pliktest | tr ' ' '\n' > pliktest2

.. raw:: html

   </details>


20. Zlicz wszystkie pliki znajdujące się w katalogu /etc i jego podkatalogach

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find /etc/ -type f | wc -l

.. raw:: html

   </details>


21. Napisać polecenie zliczające sumę znaków z pierwszych trzech linii pliku /etc/passwd

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   head -3 /etc/passwd | wc -c

.. raw:: html

   </details>


22. Wyświetl listę plików z aktualnego katalogu, zamieniając wszystkie małe litery na duże.

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls | tr [:lower:] [:upper:]

.. raw:: html

   </details>


23. Wyświetl listę praw dostępu do plików w aktualnym katalogu, ich rozmiar i nazwę

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls -al | tr -s ' '| cut -f1,5,9 -d ' ' | tr ' ' '\t'

.. raw:: html

   </details>


24. Wyświetl listę plików w aktualnym katalogu, posortowaną według rozmiaru pliku

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls -la | tr -s ' ' | sort -k 5 -n
   ls -alSr | grep -v ^d

.. raw:: html

   </details>

   

.. raw:: html

   </details>


25. Wyświetl zawartość pliku /etc/passwd posortowaną wg numerów UID w kolejności od największego do najmniejszego

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat /etc/passwd | sort -t : -k 3 -n -r

.. raw:: html

   </details>


26. Wyświetl zawartość pliku /etc/passwd posortowaną najpierw wg numerów GID w kolejności od największego do najmniejszego, a następnie UID

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat /etc/passwd | sort -t : -k4 -k3 -n -r

.. raw:: html

   </details>


27.  Podaj liczbę plików każdego użytkownika

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find /home/student -type f | wc -l
   find ~ -type f -user student | wc -l

.. raw:: html

   </details>


28.  Sporządź statystykę praw dostępu (dla każdego z praw dostępu podaj ile razy zostało ono przydzielone)

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls -al | cut -f1 -d ' ' | grep -v total | sort | uniq -c

.. raw:: html

   </details>


29.  Podaj nazwy trzech najmniejszych plików w katalogu posortowane wg nazwy

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls -alSr | grep -v total | head -3 | sort -k 9

.. raw:: html

   </details>


30. Podaj pięciu użytkowników o największej liczbie uruchomionych procesów

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ps aux | sort | cut -f1 -d ' ' | grep -v USER | uniq -c | head -5

.. raw:: html

   </details>


31. Wyświetl zawartość 3 największych podkatalogów katalogu bieżącego

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   ls -al `sudo du | sort -n -r | head -4 | tail -3 | cut -f2`

.. raw:: html

   </details>


32. Wyświetl nazwy tych użytkowników, którzy domyślnie używają innego interpretera niż bash

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   cat /etc/passwd | grep -v bash | cut -f1 -d:

.. raw:: html

   </details>


33.  Wyświetl nazwy wszystkich plików nagłówkowych posortowane wykorzystywanych w plikach bieżącego katalogu


.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   find ./ -type f -exec cat {} \; | grep "^#include" | cut -f2 -d ' ' | sort | uniq -c | sort -n -r

.. raw:: html

   </details>


34.  Wyświetl statystykę używanych komend (bez argumentów) w postaci posortowanej listy: ilość komenda ( wsk. należy użyć polecenia history)

.. raw:: html

   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   history | tr  -s ' ' | cut -f3 -d ' ' | sort | uniq -c | sort -n -r

.. raw:: html

   </details>

35. Z podanej nazwy ``rapidjson_1.1.0-1_mips_24kc.ipk`` weź nazwę pliku aż do 1. delimitera ``_`` 

.. raw:: html
   
   <details>
   <summary><a>solution</a></summary>

.. code-block:: bash

   echo "rapidjson_1.1.0-1_mips_24kc.ipk" | cut -d '_' -f 1

.. raw:: html

   </details>