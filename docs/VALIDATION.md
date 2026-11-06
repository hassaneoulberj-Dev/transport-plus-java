# Validation et limites

## Vérifications réalisées

- 12 variantes distinctes compilées : 10 réussites et 2 échecs documentés.
- Version publique compilée après modification de la configuration MySQL, cible Java 17.
- Import de schema.sql puis demo-data.sql dans une base MySQL temporaire isolée.
- Authentification des deux comptes fictifs et rejet d’un mot de passe incorrect.
- Lecture des deux voyages de démonstration.
- Création d’une réservation de deux places et récupération par le client.
- Vérification du passage de 40 à 38 places disponibles.
- Rejet d’une demande de 50 places.
- Chargement de la police Font Awesome.
- Suppression de la base temporaire après les vérifications ; aucune base préexistante modifiée.

## Limites constatées et tests restants

- Les mots de passe des comptes de l’application restent stockés en clair dans le modèle original. Les comptes fournis sont uniquement des comptes de démonstration.
- L’annulation dans ReservationDAO change le statut sans restituer les places. La gestion du changement de statut et la concurrence sur les numéros de siège doivent être consolidées avant un usage réel.
- Le parcours graphique complet, les formulaires, les statistiques et la mise en page des reçus PDF n’ont pas été testés de bout en bout.
- L’application doit être présentée comme un mini-projet académique, pas comme un service de réservation prêt à exploiter.
