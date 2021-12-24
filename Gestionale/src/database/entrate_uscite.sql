-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Dic 24, 2021 alle 19:17
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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `entrate`
--

INSERT INTO `entrate` (`id`, `tipo_entrata`, `data`, `valore`) VALUES
(1, 'stipendio', '2020-07-25', 601),
(2, 'stipendio', '2020-08-25', 1426),
(5, 'RGi welfare', '2020-09-22', 200),
(6, 'Stipendio', '2020-09-25', 1419),
(9, 'Stipendio Ottobre', '2020-10-26', 1429),
(10, 'Parte Beppe regalo Caro', '2020-10-26', 10),
(17, 'Stipendio Dicembre', '2020-12-25', 1485),
(15, 'Stipendio novembre', '2020-11-25', 1504),
(16, 'Tredicesima', '2020-12-10', 492),
(18, 'stipendio', '2021-01-25', 1346),
(19, 'Stipendio', '2021-02-25', 1329),
(20, 'stipendio marzo', '2021-03-25', 1349),
(21, 'stipendio', '2021-04-25', 1387),
(22, 'ricarica nespresso', '2021-04-27', 100),
(23, 'stipendio', '2021-05-25', 1349),
(24, 'buoni walfare', '2021-06-05', 200),
(25, 'stipendio', '2021-06-25', 1554),
(27, 'stipendio', '2021-07-25', 1409),
(28, 'vendica cuffie', '2021-07-22', 75),
(29, 'Stipendio', '2021-08-25', 1412),
(30, 'Bonifico vale', '2021-09-07', 40),
(31, 'Stipendio', '2021-08-25', 1412),
(32, 'Stipendio', '2021-09-25', 2037),
(33, 'Stipendio', '2021-10-25', 1408),
(34, 'Stipendio', '2021-11-25', 1446),
(35, 'Regalo rico e vale', '2021-12-02', 25),
(36, 'Stipendio', '2021-12-24', 1406),
(37, 'tredicesima', '2021-12-15', 1209);

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
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

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
(38, 'Pizza dominos + fanta + apetize', '2020-10-25', 12.45),
(39, 'Deca pantaloni bici', '2020-11-02', 29.99),
(40, 'Regalo patty + creal\'s queen', '2020-10-31', 16.5),
(42, '5 tubi nespresso vaniglia', '2020-11-07', 23.5),
(43, 'Spesa fresco marmellate + cereali', '2020-11-11', 7.97),
(44, 'Taglio capelli + ricarica telefonica', '2020-11-14', 32),
(45, 'Satisfactory', '2020-11-14', 29.9),
(46, 'regalo rico cuffie logitech', '2020-11-27', 40.99),
(47, 'Kit decalcificazione nespresso', '2020-12-07', 9),
(48, 'Red dead online', '2020-12-13', 4.99),
(49, 'RIcarica telefonica', '2020-12-14', 10),
(50, 'regalo caro natale', '2020-12-15', 59),
(51, 'benzina moto', '2020-12-15', 17.05),
(52, 'Regalo Mamma e papà', '2020-12-25', 128),
(53, 'Ricarica tim', '2021-01-15', 10),
(54, '2 brioches', '2021-01-15', 2),
(55, 'Ricarica tim ', '2021-01-13', 10),
(56, 'Parrucchiere', '2021-01-23', 22),
(57, 'Caffé berlica', '2021-01-24', 4.5),
(58, 'Sushi', '2021-02-07', 28.5),
(59, 'Cena patty', '2021-02-08', 10),
(60, 'Ricarica telefonica + bici', '2021-02-13', 20),
(61, 'Rosa + pranzo', '2021-02-14', 40),
(62, 'Cena lory', '2021-02-21', 11),
(63, 'Pranzo', '2021-02-27', 33),
(64, 'Geato', '2021-02-28', 3),
(65, 'Domenica mollica tellia mochi', '2021-03-07', 15),
(66, 'ricarica tim', '2021-03-13', 15),
(67, 'benzina ', '2021-03-13', 18.51),
(68, 'torta lory', '2021-03-13', 16),
(69, 'gofreria', '2021-03-14', 11),
(70, 'Brioches + cena patty', '2021-03-16', 40.7),
(71, 'bordo leroy merlin', '2021-03-26', 3.15),
(72, 'tastiera logitech ergo', '2021-03-31', 101.49),
(73, 'Tappetino titanwolf', '2021-03-30', 26.85),
(74, 'Fascette', '2021-03-30', 9.99),
(75, 'Struttura scrivania', '2021-03-07', 359.99),
(76, 'Ricarica brioches  mochi mac boon poke gomme borsa bici ', '2021-04-28', 92.4),
(77, 'Attrezzi bici deca', '2021-05-03', 14.77),
(78, 'Bombolette leroy', '2021-05-03', 23.88),
(79, 'nespresso', '2021-04-27', 95.9),
(80, 'Torta lory + parcheggio', '2021-05-16', 10),
(81, 'pizzium caro', '2021-05-16', 25),
(82, 'Attrezzi deca ', '2021-05-07', 25.98),
(83, 'Bombolette leroy', '2021-05-10', 17.97),
(84, 'Deca', '2021-05-11', 4.99),
(85, 'gelato poormanger gelato', '2021-05-23', 21.5),
(86, 'cena caro grigliata gelato', '2021-06-03', 26.5),
(87, 'deca scarpette vestiario', '2021-06-01', 194.95),
(88, 'deca', '2021-05-25', 14.95),
(89, 'ricarica cell', '2021-05-19', 10),
(90, 'radiografie', '2021-05-13', 132),
(91, 'sacra san michele poke cena', '2021-06-06', 34.2),
(92, 'drink + caro + poke tiramisù', '2021-06-19', 44.4),
(93, 'aspiratore bosch + sacchetti + parafanghi bici', '2021-06-09', 243.27),
(94, 'benzina ceresole', '2021-06-19', 19.96),
(95, 'ricarica + deca', '2021-06-17', 28.18),
(96, 'poke rico ', '2021-06-27', 13.9),
(97, 'giannitti', '2021-06-26', 22),
(98, 'pub denise', '2021-07-03', 33),
(99, 'pub', '2021-07-07', 29.5),
(100, 'deca + pub', '2021-07-12', 43.48),
(101, 'benzina + ricarica', '2021-07-13', 30.8),
(102, 'torta + pokè', '2021-07-17', 40),
(103, 'cocktail', '2021-07-24', 10),
(104, 'ape + sushi', '2021-07-25', 58),
(105, 'sgrassante catena', '2021-07-24', 13.8),
(106, 'pub cumple', '2021-06-29', 153.5),
(107, 'Capelli', '2021-09-07', 22),
(108, 'Old wild west + colazione', '2021-09-11', 34),
(109, 'Du cesari lory', '2021-09-14', 28.25),
(110, 'Gelato', '2021-09-19', 16.5),
(111, 'Ricarica cell', '2021-09-16', 10),
(112, 'Mc maggiora', '2021-09-07', 14.5),
(113, 'benzina', '2021-09-06', 21.93),
(114, 'Vacanza Sicilia', '2021-08-25', 1200),
(115, 'Cena origami', '2021-10-12', 40),
(116, 'Ricarica + brioches', '2021-10-13', 13),
(117, 'Rock burger + regalo pat', '2021-10-30', 36),
(118, 'Casa bolo', '2021-10-23', 242),
(119, 'Italo bolo', '2021-10-23', 177.6),
(120, 'Benzina', '2021-10-19', 20.63),
(121, 'Dentista', '2021-09-28', 1502),
(131, 'Giapponese Rico e vale', '2021-12-02', 25),
(130, 'Pranzo colleghi', '2021-12-01', 16.9),
(125, 'Cena beppe + regalo beppe', '2021-11-21', 27.5),
(126, 'Cheers caro superga', '2021-12-05', 10),
(127, 'Kebab', '2021-12-06', 8),
(128, 'Dentista', '2021-11-30', 802),
(132, 'Cena berberé caro', '2021-12-11', 29.5),
(133, 'Spiderman lory denise caro', '2021-12-12', 11.9),
(134, 'Burger king serata cinema caro lory', '2021-12-16', 19.4),
(135, 'Pranzo natale colleghi corso', '2021-12-18', 30),
(136, 'Merenda rico beppe', '2021-12-19', 3.3),
(137, 'Ape bekery caffe amici', '2021-12-19', 10),
(138, 'Riparazioni bici', '2021-12-23', 288);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
