Tar
===

Jesteś w katalogu domowym. Skopiuj poniższy kod do terminala. Utworzy on katalogi z plikami do ćwiczeń.


``mkdir s1 && ls -l -R /boot > s1/l1.txt && cp s1/l1.txt s1/l2.txt && cp -r s1 s2 && cp -r s1 s3 && touch l3.txt``



1. Utwórz archiwum a1.tar z katalogu s1::

    tar -cf a1.tar s1

2. Podejrzyj zawartość archiwum a1.tar::

    tar tvf a1.tar

3. Utwórz archiwum a2.tar z katalogu s2 z podglądem zawartości::

    tar cfv a2.tar s2

4. Dodaj plik l3.txt do a1.tar (następnie pokaż dodatkowo zawartość a1.tar).::

    tar -rf a1.tar l3.txt
    tar tvf a1.tar

5. Usuń plik l2.txt z a2.tar (następnie pokaż dodatkowo zawartość a2.tar):: 
   
    tar --delete --file=a1.tar l2.txt
    tar --list --file=a1.tar


6. Dodaj do a1.tar zawartość a2.tar (następnie pokaż dodatkowo zawartość a1.tar).::

    tar --concatenate --file=a1.tar a2.tar

7. Skopiuj a1.tar pod nazwą a3.tar (zwykłe cp). Wyodrębnij zawartość a1.tar do katalogu s4 (pokaż zawartość s4).::

    tar -xf a1.tar -C s4

8. Z a3.tar stwórz plik skompresowany a3.tar.gz::

    tar -zcf a3.tar.gz a3.tar

9. Z katalogu s3 stwórz skompresowany plik s3.zip::

    tar zcf s3.zip s3


10. Z katalogu s3 stwórz plik skompresowany s3.tar.bz2

    tar cjf s3.tar.bz2 s3

Więcej info AWK/GREP/SED/bash `Link <https://j.wojtanowski.po.opole.pl/index.php?folder=U3lzdGVteSBvcGVyYWN5am5lIElJL0FXSyBHUkVQIFNFRA==>`_ 


