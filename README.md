# Dépôt Debian Privé (mon-depot-debian)

## Structure du dépôt

mon-depot-debian/
├── Dockerfile
├── public/
│ ├── dists/
│ │ └── bookworm/
│ │ └── main/
│ │ └── binary-amd64/
│ │ └── Packages.gz
│ └── pool/
│ └── main/
│ └── htop_3.2.2-2_amd64.deb



- `public/` contient tous les fichiers accessibles via le serveur HTTP Apache dans Docker.
- Le dossier `dists/bookworm/main/binary-amd64` contient les index du dépôt.
- Le dossier `pool/main` contient les paquets `.deb`.

---

## lancer le dépôt Debian avec Docker

1. Construire l'image Docker :
```bash
docker build -t mon-depot-debian .

2. Lancer un conteneur exposant le port 80 :

docker run -d -p 80:80 --name mon-depot-debian mon-depot-debian

Accéder au dépôt Debian

Depuis un navigateur ou une machine cliente, vous pouvez accéder aux fichiers du dépôt via :
http://3.145.202.176/dists/bookworm/main/binary-amd64/Packages.gz

Pour installer un paquet depuis ce dépôt, configurez le fichier sources.list de la machine cliente avec une ligne comme :

deb [trusted=yes] http://3.145.202.176 bookworm main

Mettre à jour le dépôt

    Ajoutez vos fichiers .deb dans le dossier public/pool/main/.

    Générez ou mettez à jour le fichier Packages.gz dans public/dists/bookworm/main/binary-amd64/.

    Reconstruisez et relancez le conteneur Docker si nécessaire.

Git

    Ce dépôt est versionné avec Git et hébergé sur GitHub.

    Le fichier .gitignore permet d’ignorer les fichiers temporaires et inutiles.

Contact

Pour toute question, contactez [ton-email-ou-lien].

Merci d’utiliser ce dépôt Debian privé !


---

Tu peux créer ce fichier avec :

```bash
nano README.md

