FROM python:3.11-slim

# Installer Aptly (adapté selon ta version Debian / aptitude)
RUN apt-get update && apt-get install -y aptly

# Copier les fichiers du dépôt (à adapter selon ta structure)
COPY public /public

WORKDIR /public

# Exposer le port 8000
EXPOSE 8000

# Lancer le serveur HTTP python au démarrage du conteneur
CMD ["python3", "-m", "http.server", "8000"]
