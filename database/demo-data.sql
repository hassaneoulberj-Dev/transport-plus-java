-- Données fictives. À importer UNE SEULE FOIS sur une base vide après schema.sql.
USE transport_demo;
INSERT INTO users (id,nom,prenom,email,password,telephone,cin,role) VALUES
(1,'Demo','Admin','admin@example.test','DemoAdmin2026!','0600000001','DEMO001','ADMIN'),
(2,'Demo','Client','client@example.test','DemoClient2026!','0600000002','DEMO002','CLIENT');
INSERT INTO vehicules (id,type_vehicule,marque,modele,capacite,immatriculation,statut) VALUES
(1,'BUS','Demo','Autocar',40,'DEMO-BUS-01','ACTIF');
INSERT INTO voyages (id,ville_depart,ville_arrivee,date_depart,date_arrivee,vehicule_id,prix,places_totales,places_disponibles,statut) VALUES
(1,'Meknes','Rabat',DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)+INTERVAL 9 HOUR,DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)+INTERVAL 12 HOUR,1,90,40,40,'ACTIF'),
(2,'Rabat','Casablanca',DATE_ADD(CURRENT_DATE, INTERVAL 8 DAY)+INTERVAL 10 HOUR,DATE_ADD(CURRENT_DATE, INTERVAL 8 DAY)+INTERVAL 12 HOUR,1,70,40,40,'ACTIF');
INSERT INTO offres_speciales (titre,description,code_promo,reduction_pourcentage,date_debut,date_fin,statut) VALUES
('Offre demonstration','Exemple fictif','DEMO10',10,CURRENT_DATE,DATE_ADD(CURRENT_DATE, INTERVAL 30 DAY),'ACTIVE');
