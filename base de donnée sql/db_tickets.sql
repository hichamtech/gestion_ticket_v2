-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 25 juin 2020 à 03:48
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_tickets`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200623161714', '2020-06-23 18:28:37', 1435),
('DoctrineMigrations\\Version20200623163857', '2020-06-23 18:39:02', 242),
('DoctrineMigrations\\Version20200623230859', '2020-06-24 01:09:12', 1437),
('DoctrineMigrations\\Version20200623234802', '2020-06-24 01:48:16', 227),
('DoctrineMigrations\\Version20200625000416', '2020-06-25 02:04:36', 705);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `technicien_id` int(11) DEFAULT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `priorite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clients_id` int(11) DEFAULT NULL,
  `etat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id`, `technicien_id`, `titre`, `status`, `priorite`, `date`, `lieu`, `clients_id`, `etat`) VALUES
(2, 29, 'Ticket1', 0, 'Faible', '2020-06-24 06:12:53', 'Rabat', 10, 1),
(4, 4, 'Ticket2', 1, 'Très Haute', '2020-06-24 06:25:56', 'Casa', 26, 1),
(6, NULL, 'Ticket 5', 0, 'Moyenne', '2020-06-24 17:24:26', 'Salé', 10, 1),
(7, NULL, 'Ticket 6', 0, 'Haute', '2020-06-24 18:19:49', 'Rabat', 27, 0),
(9, 14, 'TestTicket 1', 1, 'Faible', '2020-06-24 18:47:18', 'Casa', 9, 1),
(10, 7, 'Ticket 5', 0, 'Haute', '2020-06-25 01:59:25', 'Casa', 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `roles`, `password`, `nom`, `prenom`) VALUES
(1, 'nienow.alexys@nikolaus.net', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$BirjjOhjrlibz0dH7kCs8g$4R2iLJ1XTGyQwdAHiIHiY7xrymCRQY4XdIlpeUQaFkU', 'Flatley', 'Harmony'),
(2, 'strosin.amelia@gmail.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$EALn62Sz4nSCXTp5VRPTJw$m4J8DmmZE5n07vzIriH5LPvbT5NS9LEfkmAZ98iV0o0', 'Lehner', 'Enoch'),
(3, 'djohnston@russel.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$8zlYztQd+P8vgWPBLXioIg$6G+PHjOnrXgNworFCS7Mm4UsjqwNJyetWH0fGueVgw4', 'Schmidt', 'Jade'),
(4, 'uhuels@ullrich.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$c/unu91GpsPXhDdiqb5hXQ$6GBpNCQ0pP90SoQ63Bi5Xc30SomWfwTYnlYlAtz4gAA', 'Prosacco', 'Clarissa'),
(5, 'green.orland@labadie.info', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$zrDokV6OO1Z4AK0GnpJn3w$iZ9lOwNKutg7ETIc/1sVrlnZ2Qbt2awBOJEylaEDvdo', 'Beatty', 'Jaylin'),
(6, 'mkassulke@hotmail.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$2yOW5IMwQZ3kvdlxV7eOQg$uezge9cKyWuOXlbTCESJHL+0ZalPZInywUbWPWxXTow', 'Pouros', 'Reece'),
(7, 'kreiger.dorian@hauck.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$I92NStfcsu+yubIGZb4NTg$Thm8E1F3qNGTScfuPHW3HfUt4ulD9YPTEMmYNmk+y9Y', 'Strosin', 'Edna'),
(8, 'rowena77@gmail.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$AoQOcbcp4HLGngds6YV4eg$KbzV6up4DSMpr6k46/vt7c7N9aD+aeYZ0Zhk6cc0exs', 'Wehner', 'Kay'),
(9, 'oda87@gmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$+iJT7Q3+kINFrA3Jcmx5HA$C4LCzQthdMIJhEoqFzN2CXYtFwt/mszB6H4W2FhK/AE', 'Jast', 'Missouri'),
(10, 'glover.bonnie@franecki.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$wNsmu3Cd/pUCSxubBgDDSw$VVXFxEFm/gjBBrB2hvjob87VyUpKVMlTRhTD4tNnss0', 'Upton', 'Imogene'),
(11, 'bayer.vicente@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$WcY/z8fH6M6IRoujDomq1A$a1i61xVbdHQ+S1bwNS/xDHpujN0SUmLWOd7u/GKyvyc', 'Wisoky', 'Matilde'),
(12, 'rachelle.turner@jast.info', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$5K/5RhBVOlp6cZc++ITZ9w$hfnSsQBcVGKCNUcEY4bYtE+ndX2KnR79zRWfArd7sdY', 'D\'Amore', 'Grayce'),
(13, 'cboyle@yahoo.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$vXwwFM8yul3Ewh7q0Mdgdw$UchZv1LS87gMJFo3JzImDmrawzK01oytljIf0OfS1qU', 'Miller', 'Easton'),
(14, 'ashields@beahan.info', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$+zrFE8M2Qn6T/EBVRstzBA$G38XI5X77xf/WGQGe+I9KdSza3aw9pC8bRlwWQBvHT8', 'Luettgen', 'Lurline'),
(15, 'chelsea.conn@gmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$SysLJ7WX0uJos7JR7cF48g$R0LkNZz6YeY8Dgdzr0j3e+Nv26YdW9Y2uStXID/tUcA', 'Crona', 'Hillary'),
(16, 'katelyn.hettinger@hotmail.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$yp+MpBP8Vn9GLr3KqrJFGg$MkRCS04lWkNeEly/L15dVcXwF6HJAfbWhL0Tg7/RJCE', 'Ward', 'Gertrude'),
(17, 'sheridan95@yahoo.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$1IQbkgAMIQcjMWaN092axQ$EzNllv42ub68THXCYPGGuQvyo1xyvBCQEEVUYtxawWY', 'Veum', 'Reilly'),
(18, 'dimitri98@runolfsson.net', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$IaOx72KlH3p0tByTTymjbw$8O86IpCEKDyyPAJmHWsf7Fievj9jWMCAe/x9KHzgI08', 'Romaguera', 'Norberto'),
(19, 'mcdermott.uriel@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$v7eNt50lXp0po9X0UGpczA$q/hbD2GOaOUzrvFXfOY2ckB/lOHx0vw14CV4O53CQbE', 'Nader', 'Emmalee'),
(20, 'tmills@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$q+TsDBHIn0ns3uS8DdVJxQ$vRLNbCoJqINxo+INaf2t3B2dqIl0KXywoJD4SYuz+94', 'Lakin', 'Forest'),
(21, 'aubree.langosh@pfannerstill.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$rK5/HVTBcj1N/kA6x00+uA$qZ3KgilvzxJn5fZJbfAMGyuuaKKxw6O8RxnFYSCHusQ', 'Tillman', 'Sigurd'),
(22, 'katheryn40@yahoo.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$nXk+VyRuye4lwboh3jo0jw$w/e/P6BP6OgdPd3uEgDPHbT9Yj6iEDg2Cdpuqm7bZxE', 'Gerhold', 'Nova'),
(23, 'rosina92@brown.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$ohCOx2yx7H2++g0BtOMVHw$Xh5oTMcJ6MhgjHZU+zkR8egHKRbiyNm048mQ61RSsUM', 'Nienow', 'Addison'),
(24, 'ronaldo28@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$my2qSQ2L6BKmHrgpBAxdrQ$Oicti9yFIjMODOaqED0aoejenLfusfofgjNTXi6+edI', 'Wiza', 'Ayden'),
(25, 'stracke.myriam@gmail.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$AuGfxn5PyPZi4NF+UK5cIA$B9sctrcEJ45aXrLTKlJLHr2EvSbw24s1FhjV+w7ZstU', 'Carroll', 'Modesto'),
(26, 'willard52@lynch.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$Z5tDy4CuxDgK94aOvzAA2g$IUaprJ4UhqDlNFn4SdKGfh38+GpAhMfJurY8YXdCXZo', 'Reinger', 'Claudia'),
(27, 'sawayn.bruce@little.info', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$9CogihSQcdYSqy89gmjosA$agvqD+8IKtqXt8NU4SBnvYvde9Fcc90WX1jiOm4DvBs', 'Douglas', 'Marquis'),
(28, 'ykoss@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$XEPJvt7gRQ264EeKtTu64g$Co4MccV8WpNQ15sHjjnN2lFyJfpWNnmbR2tiKUW/4Rg', 'Stehr', 'Gianni'),
(29, 'leonard.miller@monahan.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$dkgz5opdB3KsPZKZCTkElQ$zra+Qct4AYhrR4HkXHWSRfOc01nYUFt/OIdWoQKwHvY', 'Rath', 'Ladarius'),
(30, 'lenora.armstrong@stehr.biz', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$grj3z/xTvuvWYxegogBEyw$yYTE1+QgqSyX9hoyueXQZV5x7VzLTDYAwjHDgu7A5cU', 'Medhurst', 'Dulce'),
(31, 'haskell03@hotmail.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$l6rVgjkDMvBnOPLxIRzwbg$RuflDL/cEKbxwUqiBX/YcT+MxWJrgTgBHZm9Zhm5Eo0', 'Kovacek', 'Bryana'),
(32, 'mcclure.yasmeen@yahoo.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$YJKm3yojcRnw3Rg/BMbUXw$J1YdiZJF8RfSwwxheVtE+AjV3IYmEIKBsSxxTCYbth4', 'Halvorson', 'Gail'),
(33, 'rempel.ulises@dach.org', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$34zNEC1/cUnzRxiBXjHu0g$mFMlo7I/iIz+/lJDPIMPnlI6AWuO1lszth0upjzFSMU', 'Dickinson', 'Brown'),
(34, 'fhills@reilly.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$PsgcJze6ibrknUsq5yz48g$7KLimfmy1glWBRxa4KMhydmO41s4rdWABIOoaWj/N3U', 'Schuster', 'Evangeline'),
(35, 'connie.thiel@gislason.biz', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$ylVWgFaEygCS5/QhArItzg$YQkknikDdvwK4GRI3bR7n4W8G5zoWlklDABIAM726P0', 'Graham', 'Romaine'),
(36, 'auer.bessie@little.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$VgyGqFIEttGqsPiJYaNkcw$atYpr96P/H+sjPLYecnqC0IMe9sxTrVszyZDM6UXAxk', 'Hessel', 'Pierce'),
(37, 'everardo.murphy@johns.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$RH+3FAx9pW5/t1FMr4uy+Q$1Tug1zfSFszo7aQelB52dhHYcuzvaR8VvcJl8/T3Mg4', 'Bashirian', 'Xander'),
(38, 'reyna.gaylord@hotmail.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$QTYzsx5NVNqtB3qN5FVRzw$QMnvls9iAIKXCAYmAADKveF5VC6KSakkYiQsSlnlGQY', 'Kshlerin', 'Frederik'),
(39, 'gina.hauck@hotmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$d8vT9p8dIQwqPcwITOhwJw$2mELsA3wTkszU/vwuOJpwRVbpIYvBMPNCsHju6f3TD0', 'Dietrich', 'Cordelia'),
(40, 'oma.lindgren@yahoo.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZecXs2RC6sfkPHdjJ3CAnA$BCGePIbP5xl6Filc/avO8106PZor1CLucqmVVRMzwjY', 'Yost', 'Mose'),
(41, 'vwitting@gmail.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$xKVW6tqMZEbVaSjzhC8RUQ$sa6m0pgnOyN7jZntvBvch0cU03wMqgpzC1AjoBN4tx4', 'Krajcik', 'Annie'),
(42, 'dleffler@yahoo.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$GZHawa/6sbfE/Q7VK2t06g$JyYXICnrsYU29JzZ8I1AF9bvkCHhw+SCKlBBSJQFp14', 'Brown', 'Orie'),
(43, 'tito04@gmail.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$0cTSOm4oM0491SADOS2GyA$70jhicz1ZWxizxXId/fI40JP/jwHfmrhPNRchWL5sNY', 'Hermiston', 'Axel'),
(44, 'tschaden@lemke.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$52zWl1azO0xD8v0UPwlFCA$7a/8T9t4eG1/Uk/5zHWmxsthjOfV13ulFlV5RSIwmZ0', 'Olson', 'Myrna'),
(45, 'henri59@schuppe.net', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$y8Qr4CboEuitCUflzveteA$jfYcjb2Ppu7Wxc7XpRin1ul1L/QeBuppsGiK05WE5ao', 'Rosenbaum', 'Enos'),
(46, 'vbernier@yahoo.com', '[\"ROLE_CLIENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$flonp6tHjdeunxTZBwehLg$ogyN+3G6QbP6Q2BQCRFxugy+EvfQ4eVD1NG2J+JbGKc', 'Watsica', 'Esmeralda'),
(47, 'ernesto74@bartoletti.net', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$fRXn/pukUuV4LUrQMMq6iA$1P94qAnW6VbRXwmSlfYeZ1LwH8jZRH/vrrWZoe9HkQ0', 'Baumbach', 'Edwin'),
(48, 'ferry.boris@waters.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$KekTfOKivl4/K3eRfXlKpQ$nMacRFqZgUYGvk+9sM27yqEX/KA+6OQbcNH7EduOkig', 'Brekke', 'Sunny'),
(49, 'annamarie85@gmail.com', '[\"ROLE_CHEF_PROJET\"]', '$argon2id$v=19$m=65536,t=4,p=1$A93ILOPtIAFBQfO8QN2tng$klYmkNyRw32y/0rQ1NbPh/gBh5Tg+phEgA+3o/pd8Ag', 'Breitenberg', 'Nettie'),
(50, 'mabel26@yahoo.com', '[\"ROLE_TECHNICIEN\"]', '$argon2id$v=19$m=65536,t=4,p=1$/MVDiMbFvBWcqdIU3hUOYA$mwLeDZNUeWNHgVx686PHL4e2HN09UKHAWaPogxAEjNM', 'Heller', 'Alessandra');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_97A0ADA313457256` (`technicien_id`),
  ADD KEY `IDX_97A0ADA3AB014612` (`clients_id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FK_97A0ADA313457256` FOREIGN KEY (`technicien_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_97A0ADA3AB014612` FOREIGN KEY (`clients_id`) REFERENCES `utilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
