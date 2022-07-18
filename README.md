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