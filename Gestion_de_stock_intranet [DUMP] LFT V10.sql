-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 02 juil. 2020 à 13:22
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_de_stock_intrav7`
--

-- --------------------------------------------------------

--
-- Structure de la table `bon_de_commande`
--

DROP TABLE IF EXISTS `bon_de_commande`;
CREATE TABLE IF NOT EXISTS `bon_de_commande` (
  `id_BON_DE_COMMANDE` int(11) NOT NULL AUTO_INCREMENT,
  `Date_de_commande` datetime DEFAULT NULL,
  `id_FOURNISSEUR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_BON_DE_COMMANDE`),
  KEY `id_FOURNISSEUR` (`id_FOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `bon_de_commande`
--

INSERT INTO `bon_de_commande` (`id_BON_DE_COMMANDE`, `Date_de_commande`, `id_FOURNISSEUR`) VALUES
(1, '2020-06-22 09:00:00', 1),
(2, '2020-06-24 15:00:00', 2),
(3, '2020-05-27 10:00:00', 3),
(4, '2020-04-15 14:30:00', 4),
(5, '2020-05-11 09:00:00', 6),
(6, '2020-06-30 14:00:00', 5),
(7, '2020-03-16 14:00:00', 8),
(8, '2020-06-30 15:00:00', 7),
(9, '2020-06-08 08:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

DROP TABLE IF EXISTS `details`;
CREATE TABLE IF NOT EXISTS `details` (
  `id_BON_DE_COMMANDE` int(11) NOT NULL,
  `id_MATERIEL` int(11) NOT NULL,
  `Quantité_entree` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_BON_DE_COMMANDE`,`id_MATERIEL`),
  KEY `id_MATERIEL` (`id_MATERIEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `details`
--

INSERT INTO `details` (`id_BON_DE_COMMANDE`, `id_MATERIEL`, `Quantité_entree`) VALUES
(9, 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `id_MATERIEL` int(11) DEFAULT NULL,
  `id_EMPRUNTEUR` int(11) DEFAULT NULL,
  `Nombre` int(11) DEFAULT NULL,
  `Date_d_emprunt` datetime DEFAULT NULL,
  `Date_de_retour` datetime NOT NULL,
  `Observation` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`id_MATERIEL`, `id_EMPRUNTEUR`, `Nombre`, `Date_d_emprunt`, `Date_de_retour`, `Observation`) VALUES
(0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', ''),
(9, 1, 1, '2020-05-15 14:00:00', '2020-05-18 09:00:00', 'Objet rendu à la même état');

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

DROP TABLE IF EXISTS `emprunteur`;
CREATE TABLE IF NOT EXISTS `emprunteur` (
  `id_EMPRUNTEUR` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_emprunteur` varchar(50) DEFAULT NULL,
  `Prenom_emprunteur` varchar(50) DEFAULT NULL,
  `Fonction_Emprunteur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_EMPRUNTEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `emprunteur`
--

INSERT INTO `emprunteur` (`id_EMPRUNTEUR`, `Nom_emprunteur`, `Prenom_emprunteur`, `Fonction_Emprunteur`) VALUES
(1, 'JEAN', 'Luc', 'Prof Maths'),
(2, 'LAFAILLETTE', 'Saumon', 'Profs Francais'),
(3, 'GIRARD', 'Baumon', 'Prof Techno'),
(4, 'Neumann', 'Adi', 'Prof Allemand'),
(5, 'FARANTSA', 'Nadja', 'Prof Malagasy'),
(6, 'RASOA', 'Nomena', 'Prof SVT'),
(7, 'MARIE', 'Fracoise', 'Infirmière'),
(8, 'MARDO', 'Pinki', 'Prof physique');

-- --------------------------------------------------------

--
-- Structure de la table `fiche_de_sortie`
--

DROP TABLE IF EXISTS `fiche_de_sortie`;
CREATE TABLE IF NOT EXISTS `fiche_de_sortie` (
  `id_FICHE_DE_SORTIE` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_sortie` varchar(50) DEFAULT NULL,
  `Categorie_sortie` varchar(50) DEFAULT NULL,
  `Nombre_sortie` int(11) DEFAULT NULL,
  `Date_de_sortie` datetime DEFAULT NULL,
  `id_Salle_info` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_FICHE_DE_SORTIE`),
  KEY `id_Salle_info` (`id_Salle_info`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fiche_de_sortie`
--

INSERT INTO `fiche_de_sortie` (`id_FICHE_DE_SORTIE`, `Nom_sortie`, `Categorie_sortie`, `Nombre_sortie`, `Date_de_sortie`, `id_Salle_info`) VALUES
(1, 'Benq', 'Videoprojecteur', 1, '2020-06-08 09:00:00', 9);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_d_entree`
--

DROP TABLE IF EXISTS `fiche_d_entree`;
CREATE TABLE IF NOT EXISTS `fiche_d_entree` (
  `id_FICHE_D_ENTREE` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_entree` varchar(50) DEFAULT NULL,
  `Categorie_entree` varchar(50) DEFAULT NULL,
  `Nombre_Entree` varchar(50) DEFAULT NULL,
  `DATE_ENTREE` datetime DEFAULT NULL,
  `Id_Salle_info` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_FICHE_D_ENTREE`),
  KEY `Id_Salle_info` (`Id_Salle_info`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fiche_d_entree`
--

INSERT INTO `fiche_d_entree` (`id_FICHE_D_ENTREE`, `Nom_entree`, `Categorie_entree`, `Nombre_Entree`, `DATE_ENTREE`, `Id_Salle_info`) VALUES
(1, 'Epson', 'Videoprojecteur focal court', '1', '2020-06-05 12:00:00', 9),
(3, 'Benq', 'Videoprojecteur', '1', '2020-06-08 08:00:00', 9);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_FOURNISSEUR` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_FOURNISSEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_FOURNISSEUR`, `Nom`) VALUES
(1, 'Remax'),
(2, 'MCPro'),
(3, 'Prolink'),
(4, 'Raitra'),
(5, 'Powergame'),
(6, 'Citic'),
(7, 'Cec'),
(8, 'Micromania');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_entree`
--

DROP TABLE IF EXISTS `ligne_entree`;
CREATE TABLE IF NOT EXISTS `ligne_entree` (
  `id_FICHE_D_ENTREE` int(11) NOT NULL,
  `id_MATERIEL` int(11) NOT NULL,
  `Quantité_entree` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_FICHE_D_ENTREE`,`id_MATERIEL`),
  KEY `id_MATERIEL` (`id_MATERIEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ligne_entree`
--

INSERT INTO `ligne_entree` (`id_FICHE_D_ENTREE`, `id_MATERIEL`, `Quantité_entree`) VALUES
(1, 11, 1),
(1, 12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_sortie`
--

DROP TABLE IF EXISTS `ligne_sortie`;
CREATE TABLE IF NOT EXISTS `ligne_sortie` (
  `id_FICHE_D_SORTIE` int(11) NOT NULL,
  `id_MATERIEL` int(11) NOT NULL,
  `Quantité_sortie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_FICHE_D_SORTIE`,`id_MATERIEL`),
  KEY `id_MATERIEL` (`id_MATERIEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ligne_sortie`
--

INSERT INTO `ligne_sortie` (`id_FICHE_D_SORTIE`, `id_MATERIEL`, `Quantité_sortie`) VALUES
(1, 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id_MATERIEL` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_mat` varchar(50) DEFAULT NULL,
  `Categorie_mat` varchar(50) DEFAULT NULL,
  `Etat_Mat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_MATERIEL`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id_MATERIEL`, `Nom_mat`, `Categorie_mat`, `Etat_Mat`) VALUES
(1, 'Asus', 'Souris', 'Bon'),
(2, 'Viewsonic', 'Ecran', 'Bon'),
(3, 'Dell', 'Clavier', 'Bon'),
(4, 'Hewlett Packard', 'Unité Centrale', 'Bon'),
(5, 'Sonigear', 'Hauts parleurs mini', 'Sous carton'),
(6, 'Legrand', 'Prise-multiple', 'Nouveau'),
(7, 'RJ45', 'Cable reseau', 'Bon'),
(8, 'Vga', 'CableVGA', 'Bon'),
(9, 'Acer', 'Laptop', 'Bon'),
(10, 'Samsung galaxy Tab 10', 'Tablette', 'Bon'),
(11, 'Benq', 'Videoprojecteur', 'Nouveau'),
(12, 'EPSON', 'Videoprojecteur Focal Court', 'Lentille Hors Service');

-- --------------------------------------------------------

--
-- Structure de la table `salle_info`
--

DROP TABLE IF EXISTS `salle_info`;
CREATE TABLE IF NOT EXISTS `salle_info` (
  `id_Salle_info` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_de_la_salle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Salle_info`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle_info`
--

INSERT INTO `salle_info` (`id_Salle_info`, `Nom_de_la_salle`) VALUES
(1, 'CDI Numerique'),
(2, 'CDI Cube'),
(3, 'Permanence 6ème'),
(4, 'Salle de formation continue'),
(5, 'Salle des profs'),
(6, 'Salle de visioconférence'),
(7, 'Salle info Maths'),
(8, 'Salle info Lettres'),
(9, 'Salle Info Techno'),
(10, 'Salle Info STMG'),
(11, 'Salle Info Pro'),
(12, 'Salle Info Langue');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Id_Stock` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Stock` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Stock`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`Id_Stock`, `Nom_Stock`) VALUES
(1, 'Stock_Bureau'),
(2, 'Stock_Banalise'),
(3, 'Stock_Amphi');

-- --------------------------------------------------------

--
-- Structure de la table `stocker`
--

DROP TABLE IF EXISTS `stocker`;
CREATE TABLE IF NOT EXISTS `stocker` (
  `Id_Materiel` int(11) NOT NULL,
  `Id_Stock` int(11) NOT NULL,
  `Emplacement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `stocker`
--

INSERT INTO `stocker` (`Id_Materiel`, `Id_Stock`, `Emplacement`) VALUES
(1, 1, 'Carton Cote Sud Etagere A Rangé 1'),
(2, 1, 'Coté Est Etagere I Rangé 1'),
(3, 1, 'Coté Sud Etagere B Rangé 1'),
(4, 1, 'Coté Ouest au Sol'),
(5, 1, 'Carto Coté Sud Etagère C Rangé 1'),
(6, 1, 'Carton Coté Sud Etagere D Rangé 1'),
(7, 1, 'Carton Coté Sud Etagere E Rangé 1'),
(8, 1, 'Carton Coté Est Etagere H Rangé 1'),
(9, 1, 'Coffre Laptop Au Milieu'),
(10, 1, 'Coffre Tablette Au Milieu'),
(10, 1, 'Coté Est Etagere J Rangé 1'),
(11, 3, 'Coté Est Au Sol Rangé 2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
