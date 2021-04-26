-- à remplir: categories, customers, employees, orders, posts, suppliers 

-- categories

INSERT INTO categories (cat_id, cat_name, cat_parent_id) 
VALUES (2, 'Outils', NULL),
(3, 'Plantes', NULL),
(4, 'Barbecues', NULL);

-- customers

INSERT INTO customers (cus_id, cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, cus_countries_id, cus_mail, cus_phone, cus_password, cus_add_date, cus_update_date)
VALUES (1, 'Dupont', 'Jean', '10 Boulevard Alsace Lorraine','80000', 'Amiens', 'FR', 'dupont.jean@gmail.com', '0605148612', '$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW', '2017-01-02 23:47:20', '2020-05-06 00:01:53'),
(2, 'Looper', 'Dave', '50 Rue de Rouen', '80000', 'Amiens', 'FR', 'davelooper80@gmail.com', '0350401872', '$2y$10$9Jxbv60GE2fDdKXkv2o1We9ToHertxwfeuD7nHjXDaCgFo8cnniSW', '2017-01-21 23:50:20', '2020-04-14 20:01:53'),
(3, 'Hollande', 'François', '7 rue Général Leclerc', '80000', 'Amiens', 'FR', 'fhollande@orange.fr', '0708061214', '$2y$10$9Jxbv60GE2fDdKXkvjhgfe9ToHGjLxwfeuD7nHjXDaCgFo8cnniSW', '2018-05-02 14:47:20', '2020-06-06 12:05:55');

-- employees

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) UNSIGNED DEFAULT NULL,
  `emp_pos_id` int(10) UNSIGNED NOT NULL,
  `emp_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_salary` decimal(8,2) UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  `emp_sho_id` tinyint(3) UNSIGNED NOT NULL,
  `emp_dep_id` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`),
  KEY `emp_shop_id` (`emp_sho_id`),
  KEY `emp_dep_id` (`emp_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_superior_id`, `emp_pos_id`, `emp_lastname`, `emp_firstname`, `emp_address`, `emp_zipcode`, `emp_city`, `emp_mail`, `emp_phone`, `emp_salary`, `emp_enter_date`, `emp_gender`, `emp_children`, `emp_sho_id`, `emp_dep_id`) VALUES
(1, 17, 5, 'MOLETTE', 'Denis', '27 avenue Paul Lepoulpe', '80000', 'Amiens', 'dmolette@blabla.fr', '0102030405', '18473.00', '2020-05-05', 'M', 8, 1, 4),
(2, 3, 2, 'NAGER', 'Emma', '14 rue Tabaga', '80300', 'Albert', 'emmanager@laposte.net', '0102030405', '39576.00', '2015-03-27', 'F', 0, 1, 6),
(3, NULL, 1, 'LEBOSSE', 'Hugo', '28 mail Ludovic Cruchot', '75001', 'Paris', 'leboss@jarditou.com', '0102030405', '350000.78', '2000-01-01', 'M', 2, 1, 8);

-- posts

INSERT INTO posts (pos_id, pos_libelle)
VALUES (1, 'Manager'),
(2, 'Vendeur'),
(3, 'Comptable');

-- suppliers

INSERT INTO suppliers (sup_id, sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail)
VALUES (1, 'Plantage', 'Paris', 'FR', '1 avenue Cyril Hanouna', '75017', 'Nicolas Dujardin', '0102030405', 'contact@plantage.fr'),
(2, 'Jardi+', 'Amiens', 'FR', '200 boulevard Eve Angeli', '80090', 'Mike Anic', '0708091011', 'jardiplus@gmail.com'),
(3, 'Attila', 'Marseille', 'FR', '31 rue Nabilla Benattia', '13000', 'Elle Ephant', '0213141516', 'attila.tondeuses@laposte.net');