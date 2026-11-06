# Transport Plus — Gestion des voyages et réservations

Mini-projet académique Java Swing et MySQL : interfaces client et administrateur pour gérer des voyages en autocar, les réservations, les clients et les offres spéciales.

## Aperçu de l’application

Captures réalisées avec les comptes et données de démonstration.

### Connexion

![Connexion](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20125503.png)

### Tableau de bord administrateur

![Tableau de bord administrateur](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131106.png)

### Gestion des voyages

![Gestion des voyages](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131146.png)

### Gestion des clients

![Gestion des clients](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131202.png)

### Offres spéciales

![Offres spéciales](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131213.png)

### Paramètres

![Paramètres](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131222.png)

### Accueil client

![Accueil client](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131303.png)

### Recherche de voyages

![Recherche de voyages](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131312.png)

### Mes réservations

![Mes réservations](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131322.png)

### Exemple de reçu de réservation

![Exemple de reçu de réservation](screenshots/Capture%20d%E2%80%99%C3%A9cran%202026-11-06%20131547.png)

[Consulter le reçu de réservation au format PDF](docs/exemples/recu-reservation-demo.pdf)

## Fonctionnalités présentes

- Connexion selon le rôle et inscription d’un client.
- Recherche de voyages, choix de places et réservation.
- Consultation des réservations et génération d’un reçu PDF.
- Gestion des voyages, clients, réservations et offres côté administrateur.
- Tableaux de bord et statistiques.

Cette copie a été sélectionnée après comparaison de 18 versions. Voir [le rapport de comparaison](docs/COMPARAISON-VERSIONS.md) et [les vérifications et limites](docs/VALIDATION.md).

## Prérequis

- JDK 17 ou supérieur, incluant javac. Compilation vérifiée avec JDK 25, cible Java 17.
- Serveur MySQL local ; import et accès JDBC vérifiés avec MySQL 8.
- PowerShell sous Windows pour les scripts fournis.

Le connecteur MySQL JDBC 9.5.0 est fourni dans lib/ avec ses notices. Aucune installation Maven n’est nécessaire.

## Installation

### 1. Préparer la base de démonstration

Dans MySQL Workbench, ouvrir et exécuter dans cet ordre :

1. `database/schema.sql` : crée la base transport_demo et ses tables.
2. `database/demo-data.sql` : ajoute les comptes, voyages et offre fictifs.

Exécuter uniquement sur une installation neuve. Si transport_demo existe déjà, ne pas réimporter par-dessus ses tables. La base historique transport_db n’est pas utilisée par défaut.

Les dates des voyages fictifs sont calculées relativement à la date d’import.

### 2. Configurer l’accès MySQL

Depuis la racine du projet :

```powershell
Copy-Item config/database.properties.example config/database.properties
notepad config/database.properties
```

Renseigner db.user et db.password avec les identifiants MySQL locaux. Le fichier database.properties est ignoré par Git et ne doit pas être publié.
Les variables TRANSPORT_DB_URL, TRANSPORT_DB_USER et TRANSPORT_DB_PASSWORD, si présentes, ont priorité sur ce fichier.

### 3. Compiler et lancer

```powershell
.\scripts\run.ps1
```

Si l’exécution des scripts est désactivée, lancer dans un processus distinct :

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\run.ps1
```

Le script compile avant chaque lancement. Pour compiler seulement :

```powershell
.\scripts\build.ps1
```

Le script utilise JAVA_HOME si défini, sinon java et javac disponibles dans le terminal. JAVA_HOME doit désigner un JDK 17 ou supérieur ; Java 11 ne suffit pas pour la cible de compilation choisie.

## Comptes de démonstration

Ces identifiants sont propres à l’application et ne sont pas ceux du serveur MySQL.

| Rôle à sélectionner | Email | Mot de passe fictif |
|---|---|---|
| ADMIN | admin@example.test | DemoAdmin2026! |
| CLIENT | client@example.test | DemoClient2026! |

Pour un premier essai, se connecter comme client, rechercher Meknes → Rabat à la date du voyage, puis réserver deux places. Le compte administrateur permet de consulter les données de démonstration.

## Organisation

```text
src/com/transport/   code Java et polices de l’interface
config/             modèle de configuration MySQL
database/          structure SQL et données fictives
lib/                pilote JDBC et notices
scripts/            compilation et lancement
docs/              comparaison des versions, validation et notice de police
```

## État du projet

Compilation et opérations ciblées en base validées. Le parcours graphique et les reçus restent à vérifier visuellement. Les mots de passe applicatifs sont stockés en clair dans cette version académique ; ne pas y utiliser de vrais comptes. L’annulation ne restitue pas encore les places dans le DAO original.

## Contexte académique et droits

Auteurs, établissement, module et année : à compléter avant diffusion. Le choix de licence pour le code du projet reste à confirmer par ses auteurs. Les dépendances conservent leurs propres notices ; leur présence ne fixe pas la licence du code de l’application.

Les anciennes versions, exports contenant des données et documents personnels sont conservés hors du dépôt public. Rien n’a été publié automatiquement sur GitHub.
