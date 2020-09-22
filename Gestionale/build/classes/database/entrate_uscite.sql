-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Set 12, 2020 alle 00:23
-- Versione del server: 5.7.26
-- Versione PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `entrate/uscite`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `entrate`
--

DROP TABLE IF EXISTS `entrate`;
CREATE TABLE IF NOT EXISTS `entrate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_entrata` varchar(256) NOT NULL,
  `data` varchar(256) NOT NULL,
  `valore` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `entrate`
--

INSERT INTO `entrate` (`id`, `tipo_entrata`, `data`, `valore`) VALUES
(1, 'stipendio', '2020-07-25', 601),
(2, 'stipendio', '2020-08-25', 1426);

-- --------------------------------------------------------

--
-- Struttura della tabella `uscite`
--

DROP TABLE IF EXISTS `uscite`;
CREATE TABLE IF NOT EXISTS `uscite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voce_spesa` varchar(256) NOT NULL,
  `data` varchar(256) NOT NULL,
  `prezzo` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `uscite`
--

INSERT INTO `uscite` (`id`, `voce_spesa`, `data`, `prezzo`) VALUES
(1, 'Spesa Fresco: 2 insalate, 3 yogurt, torta e snickers', '2020-08-25', 14.73),
(2, 'Pizza Don Ciccio', '2020-08-28', 8.5),
(3, 'Burger King', '2020-08-17', 21.5),
(8, 'Uscita sabato sera', '2020-08-30', 10),
(9, 'Leroy Merlin: 2 pezzi di legno per riga seghetto alternativo e 4 morsetti ', '2020-09-05', 16.15),
(10, 'Leroy Merlin: viti', '2020-09-06', 4.05),
(11, 'Pizza: 3', '2020-09-06', 23),
(12, 'Cocktail sabato sera', '2020-09-05', 11),
(13, 'Uscita amici corso ', '2020-09-11', 11);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;