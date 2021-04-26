-- A partir de la base Gescom :

-- Créez un groupe marketing qui peut ajouter, 
-- modifier et supprimer des produits et des catégories, 
-- consulter des commandes, leur détails et les clients. 
-- Ce groupe ne peut rien faire sur les autres tables.

-- Création du groupe marketing

CREATE ROLE 'marketing'@'localhost'

-- Définition des privilèges de marketing

GRANT SELECT, UPDATE, DELETE, INSERT ON afpa_gescom.products TO 'marketing'@'localhost';
GRANT SELECT, UPDATE, DELETE, INSERT ON afpa_gescom.categories TO 'marketing'@'localhost';
GRANT SELECT ON afpa_gescom.orders TO 'marketing'@'localhost';
GRANT SELECT ON afpa_gescom.orders_details TO 'marketing'@'localhost';
GRANT SELECT ON afpa_gescom.customers TO 'marketing'@'localhost';

-- Création d'utilisateurs (utilisateur1, utilisateur2, utilisateur3)

CREATE USER 'utilisateur1'@'localhost';
CREATE USER 'utilisateur2'@'localhost';
CREATE USER 'utilisateur3'@'localhost';


-- Attribution du rôle marketing aux utilisateurs

GRANT marketing TO 'utilisateur1'@'localhost', 'utilisateur2'@'localhost', 'utilisateur3'@'localhost';