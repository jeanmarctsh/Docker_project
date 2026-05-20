# 🚀  Conteneurisation et déploiement d'une application python avec base de données mysql

## Prise en main et utilisation de docker swarm pour une Haute disponibilité 

## 🚧 Ceci est un projet à but compréhensive (En cours de finition)  

## 🛠️ Prérequis

- Un cluster **Docker Swarm** fonctionnel (1 nœud Manager et au moins 2 nœuds Workers).
- Docker Engine installé et configuré en mode Swarm sur l'ensemble des machines.
- Une bonne connectivité réseau

---

## 📁 Stucture générale du projet

La structure générale du projet se présente de la manière suivante:

```text
Docker-project/
├── Images/                                 # Différentes images et architecture du projet
├── stack/
│   ├── docker-compose/
│   │   ├── Vidéos/                         # Démos au format vidéo
│   │   ├── bdd.yml                         # Configuration de MYSQL via un fichier compose
│   ├── mongo.yml                           # Exemplaire de configuration de mongodb via un fichier compose (déploiement swarm)
│   └── nginx.yml                           # Exemplaire de configuration du serveur web nginx (déploiement via swarm)
├── web_app
│   ├── Hotel-Management-using-SQL-main/
|   ├── Images/                             # Différentes images liées au déploiement    
│   │   ├── deploy.yml                      # Fichier de déploiement swarm(projet plus MYSQL)
│   │   ├── Dockerfile                      # Construction d'image et bonnes pratiques
│   │   ├── w-db.sh                         # Script d'attente de la base de données
│   │   └── .env.exemple                    # Exemple de différentes valeurs pour la configuration 
└── └── README.md                           # Description générale du projet

```
---

# Output (Résultats attendus)

Une fois le déploiement terminé, l'infrastructure doit présenter l'état suivant :

1. Haute disponibilité activée  (`3/3` répliques fonctionnelles) :
   
   ```bash
   docker stack services MYAPP
   # Output attendu : MYAPP_myapp à 3/3 répliques
   ```
2. Distribution sur le cluster (Conteneurs répartis sur vos différents nœuds) :
   
   
    `MYAPP_myapp.1` branché sur le nœud __gitea-ubuntu__
    `MYAPP_myapp.2` branché sur le nœud __marc-ubuntu__
    `MYAPP_myapp.3` branché sur le nœud __ansible-ubuntu__ 

3. Application Streamlit prête :
   
   Les logs du service doivent confirmer que le serveur est actif et que l'interface est accessible via le port `8501`.
        
---

## Déploiement

Pour déployer ce projet, veuillez:

1. Clonez le dépôt Git sur votre nœud Manager :
   
    ```bash
    git clone git@github.com:jeanmarctsh/Docker_project.git
    cd Docker_project/web_app/Hotel-Management-using-SQL-main/
    ```
    > ⚠️ __Note importante__ : Assurez-vous d'avoir créé et configuré votre secret Docker Swarm.

2. Renseignement des valeurs

    Veuillez reneigner les différentes valeurs en fonctions de vos besoins

    veuillez créer le fichier .env à la racine du dossier web_app en vous référant au fichier .env.exemple et 
    adopter les valeurs en fonction de vos besoins

3. Déploiement de la Stack

    Depuis le nœud Manager uniquement , lancez le déploiement du service :

    ```bash
    cd Docker_project/web_app  && docker stack deploy -c deploy.yml MYAPP
    ```
4. Vérification du déploiement

    Après environ une minute, validez que l'application est correctement répartie et en Haute Disponibilité :

    ```bash
    docker stack services MYAPP
    ```

    L'output doit afficher `3/3` répliques pour le service web.

    ```bash
    docker stack ps MYAPP
    ```
    L'output doit montrer les conteneurs répartis sur vos différents nœuds (`Running`).

5. Application Streamlit prête

    Pour afficher les logs de l'application déployée afin de voir l'état général ainsi que le port `8501`, 
    veuillez saisir la commande :

    ```bash
    docker service logs MYAPP_myapp
    ```

---

## ✍️ AUTEUR
- Nom : Ngandu Jean-Marc
- [![Email](https://img.shields.io/badge/Email-red?style=for-the-badge&logo=gmail)](mailto:jeanmarctshimbombo@gmail.com)
- [![LinkedIn](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/jean-marc-ngandu-b60796222)
- [![GitHub](https://img.shields.io/badge/GitHub-black?style=for-the-badge&logo=github)](https://github.com/jeanmarctsh)

