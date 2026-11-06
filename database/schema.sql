-- Installation neuve uniquement. Aucun compte ni donnée originale.
CREATE DATABASE IF NOT EXISTS transport_demo CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE transport_demo;

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('INFO','ALERTE','PROMOTION','RAPPEL') DEFAULT 'INFO',
  `vue` tinyint(1) DEFAULT 0,
  `date_notification` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `offres_speciales` (
  `id` int(11) NOT NULL,
  `titre` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `code_promo` varchar(50) DEFAULT NULL,
  `reduction_pourcentage` decimal(5,2) DEFAULT NULL,
  `reduction_fixe` decimal(10,2) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `statut` enum('ACTIVE','EXPIREE','DESACTIVEE') DEFAULT 'ACTIVE',
  `conditions` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `paiements` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `mode_paiement` enum('CARTE','ESPECES','VIREMENT','CHEQUE') NOT NULL,
  `date_paiement` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(100) DEFAULT NULL,
  `statut` enum('PAYE','EN_ATTENTE','ECHOUE') DEFAULT 'EN_ATTENTE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `voyage_id` int(11) NOT NULL,
  `date_reservation` timestamp NOT NULL DEFAULT current_timestamp(),
  `nombre_places` int(11) NOT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  `statut` enum('CONFIRME','EN_ATTENTE','ANNULE','REMBOURSE') DEFAULT 'EN_ATTENTE',
  `numero_billet` varchar(50) DEFAULT NULL,
  `siege_numbers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `role` enum('CLIENT','ADMIN') NOT NULL DEFAULT 'CLIENT',
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `vehicules` (
  `id` int(11) NOT NULL,
  `type_vehicule` enum('BUS','VAN','CAR','MINIBUS') NOT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `modele` varchar(50) DEFAULT NULL,
  `capacite` int(11) NOT NULL,
  `immatriculation` varchar(20) DEFAULT NULL,
  `statut` enum('ACTIF','EN_MAINTENANCE','HORS_SERVICE') DEFAULT 'ACTIF',
  `date_mise_service` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `voyages` (
  `id` int(11) NOT NULL,
  `ville_depart` varchar(100) NOT NULL,
  `ville_arrivee` varchar(100) NOT NULL,
  `date_depart` datetime NOT NULL,
  `date_arrivee` datetime DEFAULT NULL,
  `vehicule_id` int(11) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `places_totales` int(11) NOT NULL,
  `places_disponibles` int(11) NOT NULL,
  `statut` enum('ACTIF','ANNULE','COMPLET','EN_ATTENTE') DEFAULT 'ACTIF',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_vue` (`vue`);

ALTER TABLE `offres_speciales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_promo` (`code_promo`),
  ADD KEY `idx_statut` (`statut`),
  ADD KEY `idx_dates` (`date_debut`,`date_fin`);

ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_reservation` (`reservation_id`);

ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_billet` (`numero_billet`),
  ADD KEY `idx_client` (`client_id`),
  ADD KEY `idx_voyage` (`voyage_id`),
  ADD KEY `idx_statut` (`statut`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `immatriculation` (`immatriculation`),
  ADD KEY `idx_statut` (`statut`);

ALTER TABLE `voyages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicule_id` (`vehicule_id`),
  ADD KEY `idx_depart_arrivee` (`ville_depart`,`ville_arrivee`),
  ADD KEY `idx_date_depart` (`date_depart`),
  ADD KEY `idx_statut` (`statut`);

ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `offres_speciales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `vehicules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `voyages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`voyage_id`) REFERENCES `voyages` (`id`);

ALTER TABLE `voyages`
  ADD CONSTRAINT `voyages_ibfk_1` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`);
