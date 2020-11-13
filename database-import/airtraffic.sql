-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 12 nov. 2020 à 15:39
-- Version du serveur :  8.0.22
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `airtraffic`
--
CREATE DATABASE IF NOT EXISTS `airtraffic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `airtraffic`;

-- --------------------------------------------------------

--
-- Structure de la table `airlines`
--

CREATE TABLE `airlines` (
  `carrier` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(27) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `airports`
--

CREATE TABLE `airports` (
  `faa` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(51) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lat` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lon` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alt` int DEFAULT NULL,
  `tz` int DEFAULT NULL,
  `dst` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tzone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `flights`
--

CREATE TABLE `flights` (
  `year` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `day` int DEFAULT NULL,
  `dep_time` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sched_dep_time` int DEFAULT NULL,
  `dep_delay` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `arr_time` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sched_arr_time` int DEFAULT NULL,
  `arr_delay` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `carrier` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `flight` int DEFAULT NULL,
  `tailnum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `origin` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dest` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `air_time` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `hour` int DEFAULT NULL,
  `minute` int DEFAULT NULL,
  `time_hour` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `planes`
--

CREATE TABLE `planes` (
  `tailnum` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `manufacturer` varchar(29) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `model` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `engines` int DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `speed` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `engine` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `weather`
--

CREATE TABLE `weather` (
  `origin` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `hour` int NOT NULL,
  `temp` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dewp` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `humid` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wind_dir` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wind_speed` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wind_gust` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `precip` float DEFAULT NULL,
  `pressure` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `visib` float DEFAULT NULL,
  `time_hour` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`carrier`);

--
-- Index pour la table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`faa`);

--
-- Index pour la table `flights`
--
ALTER TABLE `flights`
  ADD KEY `flights_airlines` (`carrier`),
  ADD KEY `flights_planes` (`tailnum`),
  ADD KEY `flights_weather_dest` (`dest`),
  ADD KEY `flights_weather_origin` (`origin`);

--
-- Index pour la table `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`tailnum`);

--
-- Index pour la table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`year`,`month`,`day`,`hour`,`origin`),
  ADD KEY `weather_airports` (`origin`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_airlines` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  ADD CONSTRAINT `flights_airport_dest` FOREIGN KEY (`dest`) REFERENCES `airports` (`faa`),
  ADD CONSTRAINT `flights_airport_origin` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`),
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  ADD CONSTRAINT `flights_planes` FOREIGN KEY (`tailnum`) REFERENCES `planes` (`tailnum`);

--
-- Contraintes pour la table `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `weather_airports` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- To do after you initialized datas 
--

INSERT INTO airports (faa,name,lat, lon, alt, tz, dst, tzone) VALUES ('BQN', 'Rafael Hernandez Airport', 18.495, -67.12944, 72, -4, 'N', 'America/Puerto_Rico');
INSERT INTO airports (faa,name,lat, lon, alt, tz, dst, tzone) VALUES ('PSE', 'Mercedita Airport', 18.00833, -66.56303, 9, -4, 'N', 'America/Puerto_Rico');
INSERT INTO airports (faa,name,lat, lon, alt, tz, dst, tzone) VALUES ('SJU', 'San Juan Luis Munoz Airport', 18.4380555556, -66.00444444, 3, -4, 'N', 'America/Puerto_Rico');
INSERT INTO airports (faa,name,lat, lon, alt, tz, dst, tzone) VALUES ('STT', 'Cyril E. King Airport', 18.3369444444, -64.9730555556, 7, -4, 'N', 'America/St_Thomas');

INSERT INTO planes (tailnum)
SELECT DISTINCT flights.tailnum
FROM flights LEFT JOIN planes ON flights.tailnum = planes.tailnum 
WHERE flights.tailnum IS NOT null AND planes.tailnum IS null;

UPDATE flights SET tailnum = CASE tailnum WHEN '' THEN NULL ELSE tailnum END;
