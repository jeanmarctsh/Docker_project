# 🚀  Conteneurisation et déploiement d'une application python avec base de données mysql

## Prise en main et utilisation de docker swarm pour une Haute disponibilité 

## 🚧 Projet en cours de développement.  

## Prérequis
- Docker (docker swarm -- one manager and two workers)
- MySQL
- Python
- Linux

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
└── └── README.md                           # Description générale du projet

```
        

