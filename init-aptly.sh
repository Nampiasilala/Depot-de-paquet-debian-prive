#!/bin/bash

# 📌 Configuration de base
REPO_NAME="mon-depot-debian"
DISTRIBUTION="focal"
COMPONENT="main"
ARCH="amd64"
DEB_FILE="htop_3.2.2-2_amd64.deb"  # Nom du paquet à copier

# 📁 Étape 1 : Copier le fichier .deb dans le dossier de partage
echo "📦 Copie du paquet .deb dans le dossier partagé..."
cp "$DEB_FILE" ./aptly-data/

# 🐳 Étape 2 : Accéder au conteneur aptly-python et exécuter les commandes Aptly
echo "⚙️ Configuration du dépôt Aptly dans le conteneur..."
docker exec -i aptly-docker-aptly-python-1 bash <<EOF
set -e

# Création du dépôt
echo "🛠️ Création du dépôt '$REPO_NAME'..."
aptly repo create -distribution="$DISTRIBUTION" -component="$COMPONENT" "$REPO_NAME"

# Ajout du paquet
echo "➕ Ajout du paquet '$DEB_FILE' dans le dépôt..."
aptly repo add "$REPO_NAME" /aptly/"$DEB_FILE"

# Publication du dépôt
echo "🌍 Publication du dépôt Aptly..."
aptly publish repo -architectures="$ARCH" "$REPO_NAME"
EOF

echo "✅ Dépôt Aptly publié avec succès."
echo "🌐 Ouvre http://localhost ou http://IP_DE_TA_MACHINE dans ton navigateur."
