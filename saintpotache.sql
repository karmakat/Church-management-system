-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 22 avr. 2022 à 23:52
-- Version du serveur :  5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `saintpotache`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorierecette`
--

CREATE TABLE `categorierecette` (
  `id` int(11) NOT NULL,
  `designation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorierecette`
--

INSERT INTO `categorierecette` (`id`, `designation`) VALUES
(1, 'Don et legs'),
(2, 'Aumone'),
(4, 'Offrande'),
(5, 'Dime');

-- --------------------------------------------------------

--
-- Structure de la table `categoriesortie`
--

CREATE TABLE `categoriesortie` (
  `id` int(11) NOT NULL,
  `designation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categoriesortie`
--

INSERT INTO `categoriesortie` (`id`, `designation`) VALUES
(1, 'Don et legs');

-- --------------------------------------------------------

--
-- Structure de la table `depense`
--

CREATE TABLE `depense` (
  `id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `motif` varchar(20) NOT NULL,
  `datesortie` date NOT NULL,
  `pouracqui` varchar(20) NOT NULL,
  `autorisation` varchar(20) NOT NULL,
  `refcategoriesortie` int(11) NOT NULL,
  `libelle` varchar(20) NOT NULL,
  `user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `depense`
--

INSERT INTO `depense` (`id`, `montant`, `motif`, `datesortie`, `pouracqui`, `autorisation`, `refcategoriesortie`, `libelle`, `user`) VALUES
(1, 3000, 'Help', '2022-04-23', 'Marie', 'Stan', 1, 'Plancul', 'MoseY'),
(2, 3000, 'Aide', '2022-04-15', 'Marie', 'Stan', 1, 'Plancul', 'Masuku');

-- --------------------------------------------------------

--
-- Structure de la table `pageconnexion`
--

CREATE TABLE `pageconnexion` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pageconnexion`
--

INSERT INTO `pageconnexion` (`id`, `nom`, `password`) VALUES
(1, 'admin', 2022);

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `id` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `montantenlettre` varchar(100) NOT NULL,
  `motif` varchar(20) NOT NULL,
  `daterecette` date NOT NULL,
  `refcategorierecette` int(11) NOT NULL,
  `user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`id`, `montant`, `montantenlettre`, `motif`, `daterecette`, `refcategorierecette`, `user`) VALUES
(1, 1000, 'mille dollars', 'Quete', '2022-04-06', 4, 'Marie'),
(2, 300, 'trois cents', 'Matoleo', '2022-04-22', 2, 'Tricart Pigeon');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorierecette`
--
ALTER TABLE `categorierecette`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categoriesortie`
--
ALTER TABLE `categoriesortie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depense`
--
ALTER TABLE `depense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refcategoriesortie` (`refcategoriesortie`);

--
-- Index pour la table `pageconnexion`
--
ALTER TABLE `pageconnexion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refcategorierecette` (`refcategorierecette`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorierecette`
--
ALTER TABLE `categorierecette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `categoriesortie`
--
ALTER TABLE `categoriesortie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `depense`
--
ALTER TABLE `depense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `pageconnexion`
--
ALTER TABLE `pageconnexion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `depense`
--
ALTER TABLE `depense`
  ADD CONSTRAINT `refcategoriesortie` FOREIGN KEY (`refcategoriesortie`) REFERENCES `categoriesortie` (`id`);

--
-- Contraintes pour la table `recette`
--
ALTER TABLE `recette`
  ADD CONSTRAINT `refcategorierecette` FOREIGN KEY (`refcategorierecette`) REFERENCES `categorierecette` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
