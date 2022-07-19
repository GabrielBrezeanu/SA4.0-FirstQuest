# Learning Path

## Tasks:
- [0](https://github.com/GabrielBrezeanu/SA4.0-FirstQuest/blob/master/tasks/1stWEEK_README.md), [1](), [...](),

### Exercitiul 0: "First Quest - Linux Ninja, Git Warrior, Docker Shaman"

**Linux**:

- Am creat un VM cu Ubuntu-22.04.

```console
sa40@sa40-VirtualBox:~$ neofetch 
            .-/+oossssoo+/-.               sa40@sa40-VirtualBox 
        `:+ssssssssssssssssss+:`           -------------------- 
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 22.04 LTS x86_64 
    .ossssssssssssssssssdMMMNysssso.       Host: VirtualBox 1.2 
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 5.15.0-41-generic 
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 2 hours, 17 mins 
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 1750 (dpkg), 9 (snap) 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 5.1.16 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Resolution: 800x600 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   Terminal: /dev/pts/0 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   CPU: Intel i5-10400F (1) @ 2.904GHz 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   GPU: 00:02.0 VMware SVGA II Adapter 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Memory: 522MiB / 5815MiB 
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/
  +sssssssssdmydMMMMMMMMddddyssssssss+                             
   /ssssssssssshdmNNNNmyNMMMMhssssss/                              
    .ossssssssssssssssssdMMMNysssso.
      -+sssssssssssssssssyyyssss+-
        `:+ssssssssssssssssss+:`
            .-/+oossssoo+/-.
```

- Am creat o conexiune la VM prin SSH.

**Git**:
```console
f0rest:~$ git --version 
git version 2.37.1
```

### Exercitiul 1:
**Partea 1**:

Pentru a rezolva aceasta parte din exercitiu m-am documentat din [acest ghid](https://www.redhat.com/sysadmin/manage-permissions) de la RedHat.
In unele situatii comanda "grep" impreuna cu lucrul cu regex au fost foarte utile, spre exemplu in a vedea daca userii `alex` si `alina` au fost creati:
```console
sa40@sa40-VirtualBox:~$ cat /etc/passwd | grep -oE '^[^:]+'
root
daemon
[...]
alex
alina
```
Ulterior, am dat de comanda `getent`, care poate fi folosita in a verifica daca un user sau un grup exista in sistem.
```console
sa40@sa40-VirtualBox:~$ getent group devops
devops:x:1003:
sa40@sa40-VirtualBox:~$ getent group engineer
engineer:x:1004:
```

Ca sa setez parole pentru ambii useri am folosti comanda `passwd`. Usage: `passwd [user]`.

Next, `grupuri si useri`. Am atribuit grupurilor cate un ID:
```console
sa40@sa40-VirtualBox:~$ sudo groupmod -g 500 devops
sa40@sa40-VirtualBox:~$ sudo groupmod -g 600 engineer
sa40@sa40-VirtualBox:~$ getent group devops
devops:x:500:
sa40@sa40-VirtualBox:~$ getent group engineer
engineer:x:600:
```
Grupurile permit o metoda mai usoara de partajare a fisierelor intre fiecare user ce apartine unui grup, dar sunt utile si atunci cand un user are nevoie de anumite privilegii pentru ca este mai usor sa atribui privilegii unui grup decat la fiecare user individual.

```console
sa40@sa40-VirtualBox:~$ cat /etc/group | grep devops
devops:x:500:alex
sa40@sa40-VirtualBox:~$ cat /etc/group | grep engineer
engineer:x:600:alex,alina

sa40@sa40-VirtualBox:~$ cat /etc/passwd | grep alex
alex:x:1001:500::/home/alex:/bin/sh
sa40@sa40-VirtualBox:~$ cat /etc/passwd | grep alina
alina:x:1002:1002::/home/alina:/bin/sh
```
DevOps este `primary group` pentru userul `alex` si `engineer` este `suplementary group` pentru userii `alex` si `alina`. Ne dam seama de acest lucru pentru ca `primary group`-ul este inregistrat in fisierul `/etc/passwd` iar grupurile `suplementary` sunt inregistrate in fisierul `/etc/group`.

Scrolland un articol despre useri si grupuri am dat de o parte care mi-a atras atentia: "There’s no place like /home" si atunci mi-am dat seama ca eu atunci cand am creat userii `alex` si `alina` nu le-am creat si un fisier `/home`. Am facut asta ulterior folosind comanda `mkhomedir_helper <user>`.

Am configurat git pentru userul `alex`, adica am generat o cheie SSH folosind comanda `ssh-keygen -t nume_key -C "email"`, dupa am adaugat cheia in ssh-agent iar ultimul pas a fost sa adaug cheia in contul meu de GitHub. Acum am putut sa dau `git clone` prin ssh de pe userul `alex`. Din folder-ul repo-ului am schimbat ownerul in `alex` prin comanda `$ sudo chown alex:devops . -R`. Am folosit `ls -l <path-to-repo>` pentru a verifica daca ownerul a fost schimbat:
```console
sa40@sa40-VirtualBox:/home/alex/SA4.0-FirstQuest$ ls -l /home/alex/SA4.0-FirstQuest/
total 20
drwxr-xr-x 2 alex devops 4096 Jul 19 10:25 bonus1
drwxr-xr-x 7 alex devops 4096 Jul 19 10:25 Flutter-WhatsAppClone
drwxr-xr-x 2 alex devops 4096 Jul 19 10:25 part2
-rw-r--r-- 1 alex devops 2414 Jul 19 10:25 README.md
drwxr-xr-x 2 alex devops 4096 Jul 19 10:25 tasks
```
a 3-a coloana reprezinta userul iar a 4-a grupul. Sau, mai simplu, comanda `stat` cu argumentele `%U` si `%G` pentru a returna userul si grupul:
```console
sa40@sa40-VirtualBox:/home/alex/SA4.0-FirstQuest$ stat -c "%U %G" /home/alex/SA4.0-FirstQuest/
alex devops
```
Next, am blocat userul `alina` prin `usermod -L alina`.
