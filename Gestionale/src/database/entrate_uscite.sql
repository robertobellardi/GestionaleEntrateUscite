-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Ott 28, 2020 alle 21:46
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `entrate`
--

INSERT INTO `entrate` (`id`, `tipo_entrata`, `data`, `valore`) VALUES
(1, 'stipendio', '2020-07-25', 601),
(2, 'stipendio', '2020-08-25', 1426),
(5, 'RGi welfare', '2020-09-22', 200),
(6, 'Stipendio', '2020-09-25', 1419),
(9, 'Stipendio Ottobre', '2020-10-26', 1429),
(10, 'Parte Beppe regalo Caro', '2020-10-26', 10);

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
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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
(13, 'Uscita amici corso ', '2020-09-11', 11),
(14, 'SPesa sushi e yougurt', '2020-09-12', 9.49),
(15, 'kebab', '2020-09-13', 15),
(16, 'Pastiglie freno', '2020-09-14', 13.98),
(17, 'Cena Urban street food Lory Denise e Caro', '2020-09-15', 28.75),
(18, 'Multa ', '2020-09-18', 46.59),
(19, '2 piatti kebab + 2 coce zero', '2020-09-19', 17),
(20, 'Gelato romana', '2020-09-19', 3),
(21, '2 barre di ferro Leroy merlin', '2020-09-20', 11.1),
(22, 'Rifilatore Makita + set 15 frese', '2020-09-22', 275.44),
(23, 'Costo spedizione rifilatore makita', '2020-09-22', 14.48),
(24, 'Caffè + voce ', '2020-09-26', 10),
(25, 'Pieno Y', '2020-09-26', 50),
(26, '2 Toast + birra + gelato', '2020-09-27', 18.4),
(27, 'Taglio capelli + pub Denise', '2020-10-03', 40),
(29, 'Melograni', '2020-10-12', 6.95),
(30, 'Regalo Vale laurea', '2020-10-09', 50),
(31, 'Mister Fish pranzo', '2020-10-08', 27),
(32, 'Regalo Caro active 2 40mm', '2020-10-13', 229),
(33, 'RIcarica telefono Tim', '2020-10-13', 10),
(34, 'Borsa Givi + benzina moto', '2020-10-16', 64.6),
(35, 'Cena taverna di ludwing amici corso', '2020-10-16', 40),
(36, 'Birre', '2020-10-17', 25),
(37, 'Pub Denise 3 birre(casa) + 2 birra + 1 patatina + 1 mix', '2020-10-24', 34),
(38, 'Pizza dominos + fanta + apetize', '2020-10-25', 12.45);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
