#!/bin/bash

echo "==============================="
echo "Installation et Configuration du Dépôt Debian Privé"
echo "==============================="

# Mise à jour des paquets
sudo apt update

# Installation d'Apache
sudo apt install -y apache2

# Création des répertoires du dépôt
echo "Création des répertoires du dépôt..."
sudo mkdir -p /var/www/html/dists/bookworm/main/binary-amd64
sudo mkdir -p /var/www/html/pool/main

# Copie des paquets dans le dépôt
echo "Copie des paquets dans le dépôt..."
sudo cp -r public/pool/main/* /var/www/html/pool/main/

# Copie des fichiers dists
echo "Copie des fichiers dists..."
sudo cp -r public/dists/* /var/www/html/dists/


# Copie de Packages.gz s'il existe
if [ -f public/dists/bookworm/main/binary-amd64/Packages.gz ]; then
    echo "Copie de Packages.gz..."
    sudo cp public/dists/bookworm/main/binary-amd64/Packages.gz /var/www/html/dists/bookworm/main/binary-amd64/
else
    echo "ATTENTION : Packages.gz introuvable !"
fi


# Redémarrage d'Apache
echo "Redémarrage du serveur Apache..."
sudo systemctl restart apache2

# Vérification si Apache fonctionne
if sudo systemctl status apache2 | grep -q "active (running)"; then
    echo "Apache fonctionne correctement."
else
    echo "Erreur : Apache ne s'est pas démarré correctement. Veuillez vérifier la configuration."
    exit 1
fi

# Adresse IP publique
# IP_PUBLIQUE=$(curl -s http://checkip.amazonaws.com)
IP_PUBLIQUE=$(curl -s http://ipinfo.io/ip)

echo "======================================"
echo "Installation et configuration terminées avec succès !"
echo "Accédez à votre dépôt Debian via :"
echo "http://$IP_PUBLIQUE/dists/bookworm/main/binary-amd64/Packages.gz"
echo "======================================"

