# Utilisation d'une image python légère pour réduire la taille de l'image 
FROM python:3.13-slim

# Métadonnées identifiant l'auteur
LABEL author="APP Download FROM GITHUB and DOKERFILE-DEPLOY BY JM "

# Installation de différentes dépendances système nécessaires (client MySQL)
# Le nettoyage des listes apt permet d'alléger l'image
RUN apt-get update && apt-get install -y --no-install-recommends \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Niveau Sécurité : Création d'un groupe et d'un utilisateur non-root (marco)
# But? éviter d'exécuter l'application avec les privilèges administrateur
RUN groupadd -r appgroup && useradd -r -g appgroup -u 1001 marco

# Définition du répertoire de travail dans le conteneur
WORKDIR /home/apk

# Copie du code source de l'application en attribuant directement la propriété à l'utilisateur crée (marco)
COPY --chown=marco:appgroup ./Hotel-Management-using-SQL-main/app /home/apk/

# Copie du script d'attente/initialisation de la base de données
COPY --chown=marco:appgroup w-db.sh /usr/local/bin/w-db.sh

# Installation des bibliothèques Python nécessaires via pip
RUN pip install --no-cache-dir streamlit pillow pandas mysql-connector-python

# Donne les droits d'exécution au script de démarrage
RUN chmod +x /usr/local/bin/w-db.sh

# Bascule sur l'utilisateur non-root pour l'exécution des commandes suivantes
USER marco

# Conteneur écoutant sur le port 8501(port par défaut de streamlit)
EXPOSE 8501

# Commande lancée au démarrage du conteneur (le script shell)
CMD ["/usr/local/bin/w-db.sh"]

## projet en cours de développement
## projet python télécharger sur github


## connaitre le port par defaut de streamlit
