## minitalk

Ce projet consiste à mettre en place une communication entre deux programmes (un client et un serveur) via les **signaux Unix**.
Le client envoie un message, caractère par caractère, au serveur à l’aide des signaux `SIGUSR1` et `SIGUSR2`, codant chaque bit.
Le serveur les reçoit et les reconstruit en message lisible.

Compétences que j’ai acquises ou approfondies :
- [x] Compréhension et manipulation des **signaux Unix** (`kill()`, `sigemptyset()`, `sigaction()`)
- [x] Approfondissement de la notion de processus et de **PID** (`getpid()`)
- [x] Transmission **bit par bit** d’un message en C
- [x] Mise en place d’un **protocole minimaliste de communication**

**Démonstration :**

![minitalk](https://github.com/user-attachments/assets/1bb71017-ae80-4439-94cf-350eaf4730d4)
