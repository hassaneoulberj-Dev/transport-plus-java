# Comparaison des versions

18 copies ont été examinées : 4 dossiers de sources et 14 archives ZIP/RAR du projet. Elles correspondent à 12 ensembles distincts de sources Java. Les archives de dépendances MySQL et de polices ont été traitées comme ressources, pas comme versions de l’application.

Chaque ensemble distinct a été compilé avec JDK 25, cible Java 17. Dix compilent ; deux échouent.

| Source | Fichiers Java | Empreinte courte | Compilation |
|---|---:|---|---|
| mini_Project | 27 | d86598f5c630 | Échec |
| last version\mini_Project - Copie | 30 | 89990b0ace91 | OK |
| Nouveau dossier\mini_Project | 27 | c942b7727b9f | OK |
| Réservé\mini_Project - Copie | 27 | eb4221669982 | OK |
| Last verstion- Copie.zip | 30 | 17e5e6685cd0 | OK |
| mini_Project - 24.02.2026.rar | 32 | ab2b4df1c306 | Échec |
| mini_Project - Copie.zip | 27 | eb4221669982 | OK |
| mini_Project - Copie11.zip | 30 | 41889bcf7500 | OK |
| mini_Project - Copie24.02.2026.rar | 30 | d79ea0675581 | OK |
| mini_Project.rar | 14 | f7aa13bd068d | OK |
| mini_Project.zip | 27 | d86598f5c630 | Échec |
| mini_Project0.zip | 27 | c942b7727b9f | OK |
| Last version of Java Projecte\mini_Project - Copie24.02.2026.rar | 30 | 4d925442eb2b | OK |
| Nouveau dossier\mini_Project1.rar | 27 | c942b7727b9f | OK |
| Réservé\mini_Project - Copie.zip | 27 | eb4221669982 | OK |
| Réservé\mini_Project1.rar | 27 | c942b7727b9f | OK |
| Versions\mini_Project - Copie1.zip | 30 | 0600c59b7c6b | OK |
| Versions\mini_Project - Copie2.zip | 30 | d9b64ff5ece6 | OK |

## Base retenue

`Last version of Java Projecte/mini_Project - Copie24.02.2026.rar`, 30 fichiers Java.

Cette version compile et comporte l’inscription, les interfaces client et administrateur, les voyages, réservations, offres, statistiques et l’export de reçus. Elle se distingue de l’archive `mini_Project - Copie24.02.2026.rar` à la racine par une génération de PDF en texte natif, au lieu d’un PDF contenant une image JPEG. Les 29 autres fichiers Java sont identiques.

L’archive `mini_Project - 24.02.2026.rar` contient 32 fichiers mais échoue à compiler : ButtonRenderer.java contient des morceaux de code et des imports à des emplacements invalides. Elle n’est donc pas retenue malgré son nombre de fichiers supérieur.

Le dossier mini_Project et son ZIP identique échouent également : main.java déclare une classe publique Main, ce qui ne respecte pas le nom de fichier attendu par le compilateur.

Le choix repose sur le contenu et la compilation. Les dates et noms des fichiers ne suffisent pas à prouver quelle copie fut historiquement la toute dernière.

## Ajustements de publication

- Connexion MySQL configurable par fichier local ignoré par Git ou variables TRANSPORT_DB_URL, TRANSPORT_DB_USER et TRANSPORT_DB_PASSWORD.
- Suppression du mot de passe MySQL codé en dur dans la copie publique.
- Base par défaut transport_demo pour distinguer la démonstration de transport_db existante.
- Structure issue de transport_db.sql, sans les INSERT d’origine ; ajout d’un jeu fictif séparé.
- Scripts de compilation et lancement indépendants des chemins Eclipse locaux.
- Connecteur MySQL et polices conservés avec les notices disponibles.
- Aucun mélange de fichiers d’interface provenant de variantes différentes.
