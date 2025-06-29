#!/bin/bash

# Mettre à jour les paquets et installer Apache2
sudo apt update
sudo apt install -y apache2

# Création de la structure des dossiers Debian
mkdir -p /var/www/html/dists/bookworm/main/binary-amd64
mkdir -p /var/www/html/pool/main

# Copier les paquets et le fichier Packages.gz
cp htop_3.2.2-2_amd64.deb /var/www/html/pool/main/
cp Packages.gz /var/www/html/dists/bookworm/main/binary-amd64/

# Redémarrer le service Apache2
sudo systemctl restart apache2

echo "Installation et configuration du dépôt Debian terminée !"
echo "Accédez au dépôt via : http://3.145.202.176/dists/bookworm/main/binary-amd64/Packages.gz"
