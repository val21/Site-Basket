-- phpMyAdmin SQL Dump
-- version 4.2.12
-- http://www.phpmyadmin.net
--
-- Client :  mysql
-- Généré le :  Mar 29 Novembre 2016 à 08:27
-- Version du serveur :  5.5.50-MariaDB
-- Version de PHP :  5.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `infs3_prj17`
--

-- --------------------------------------------------------

--
-- Structure de la table `ACCEDER`
--

CREATE TABLE IF NOT EXISTS `ACCEDER` (
  `IDUSER` char(1) NOT NULL,
  `IDCAT` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLE`
--

CREATE TABLE IF NOT EXISTS `ARTICLE` (
  `IDART` char(1) NOT NULL,
  `IDMENU` char(1) NOT NULL,
  `TITRE` char(1) DEFAULT NULL,
  `DESCR` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIE`
--

CREATE TABLE IF NOT EXISTS `CATEGORIE` (
  `IDCAT` char(1) NOT NULL,
  `NIVAUTCAT` int(11) DEFAULT NULL,
  `PAGECAT` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `COMPETITION`
--

CREATE TABLE IF NOT EXISTS `COMPETITION` (
  `IDCOMPET` char(1) NOT NULL,
  `DATECOMPET` date DEFAULT NULL,
  `LIBCOMPET` char(1) DEFAULT NULL,
  `LIEUCOMPET` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `EQUIPE`
--

CREATE TABLE IF NOT EXISTS `EQUIPE` (
  `IDEQUIPE` char(1) NOT NULL,
  `NBMATCHSJOUES` int(11) DEFAULT NULL,
  `NBVICTOIRES` int(11) DEFAULT NULL,
  `NIVEAUEQUIP` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `MENU`
--

CREATE TABLE IF NOT EXISTS `MENU` (
  `IDMENU` char(1) NOT NULL,
  `IDCAT` char(1) NOT NULL,
  `PAGEM` char(1) DEFAULT NULL,
  `NIVAUTM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `PARTICIPER`
--

CREATE TABLE IF NOT EXISTS `PARTICIPER` (
  `IDEQUIPE` char(1) NOT NULL,
  `IDMATCH` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `RENCONTRE`
--

CREATE TABLE IF NOT EXISTS `RENCONTRE` (
  `IDMATCH` char(1) NOT NULL,
  `IDCOMPET` char(1) NOT NULL,
  `LIEU` char(1) DEFAULT NULL,
  `DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE IF NOT EXISTS `UTILISATEUR` (
  `IDUSER` char(1) NOT NULL,
  `IDEQUIPE` char(1) DEFAULT NULL,
  `NOM` char(20) DEFAULT NULL,
  `PRENOM` char(20) DEFAULT NULL,
  `EMAIL` char(30) DEFAULT NULL,
  `MDP` char(20) DEFAULT NULL,
  `NIVEAUAUT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `UTILISATEUR`
--

INSERT INTO `UTILISATEUR` (`IDUSER`, `IDEQUIPE`, `NOM`, `PRENOM`, `EMAIL`, `MDP`, `NIVEAUAUT`) VALUES
('0', NULL, 'Traore', 'Adama', 'azerty@gmail.com', 'azerty', NULL),
('1', NULL, 'test', 'test', 'test@test', 'a94a8fe5ccb19ba61c4c', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ACCEDER`
--
ALTER TABLE `ACCEDER`
 ADD PRIMARY KEY (`IDUSER`,`IDCAT`), ADD KEY `FK_ACCEDER2` (`IDCAT`);

--
-- Index pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
 ADD PRIMARY KEY (`IDART`), ADD KEY `FK_CONTENIR` (`IDMENU`);

--
-- Index pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
 ADD PRIMARY KEY (`IDCAT`);

--
-- Index pour la table `COMPETITION`
--
ALTER TABLE `COMPETITION`
 ADD PRIMARY KEY (`IDCOMPET`);

--
-- Index pour la table `EQUIPE`
--
ALTER TABLE `EQUIPE`
 ADD PRIMARY KEY (`IDEQUIPE`);

--
-- Index pour la table `MENU`
--
ALTER TABLE `MENU`
 ADD PRIMARY KEY (`IDMENU`), ADD KEY `FK_APPARTENIR` (`IDCAT`);

--
-- Index pour la table `PARTICIPER`
--
ALTER TABLE `PARTICIPER`
 ADD PRIMARY KEY (`IDEQUIPE`,`IDMATCH`), ADD KEY `FK_PARTICIPER2` (`IDMATCH`);

--
-- Index pour la table `RENCONTRE`
--
ALTER TABLE `RENCONTRE`
 ADD PRIMARY KEY (`IDMATCH`), ADD KEY `FK_COMPOSER` (`IDCOMPET`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
 ADD PRIMARY KEY (`IDUSER`), ADD KEY `FK_ETRE_MEMBRE_DE` (`IDEQUIPE`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ACCEDER`
--
ALTER TABLE `ACCEDER`
ADD CONSTRAINT `FK_ACCEDER` FOREIGN KEY (`IDUSER`) REFERENCES `UTILISATEUR` (`IDUSER`),
ADD CONSTRAINT `FK_ACCEDER2` FOREIGN KEY (`IDCAT`) REFERENCES `CATEGORIE` (`IDCAT`);

--
-- Contraintes pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
ADD CONSTRAINT `FK_CONTENIR` FOREIGN KEY (`IDMENU`) REFERENCES `MENU` (`IDMENU`);

--
-- Contraintes pour la table `MENU`
--
ALTER TABLE `MENU`
ADD CONSTRAINT `FK_APPARTENIR` FOREIGN KEY (`IDCAT`) REFERENCES `CATEGORIE` (`IDCAT`);

--
-- Contraintes pour la table `PARTICIPER`
--
ALTER TABLE `PARTICIPER`
ADD CONSTRAINT `FK_PARTICIPER` FOREIGN KEY (`IDEQUIPE`) REFERENCES `EQUIPE` (`IDEQUIPE`),
ADD CONSTRAINT `FK_PARTICIPER2` FOREIGN KEY (`IDMATCH`) REFERENCES `RENCONTRE` (`IDMATCH`);

--
-- Contraintes pour la table `RENCONTRE`
--
ALTER TABLE `RENCONTRE`
ADD CONSTRAINT `FK_COMPOSER` FOREIGN KEY (`IDCOMPET`) REFERENCES `COMPETITION` (`IDCOMPET`);

--
-- Contraintes pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
ADD CONSTRAINT `FK_ETRE_MEMBRE_DE` FOREIGN KEY (`IDEQUIPE`) REFERENCES `EQUIPE` (`IDEQUIPE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
