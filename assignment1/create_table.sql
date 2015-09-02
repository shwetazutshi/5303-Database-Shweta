-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2015 at 09:14 PM
-- Server version: 5.6.26
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `szutshi`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `gender` enum('male','female') NOT NULL,
  `title` varchar(10) NOT NULL,
  `first` varchar(32) NOT NULL,
  `last` varchar(32) NOT NULL,
  `street` varchar(64) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `dob` int(10) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `picture` varchar(127) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`gender`, `title`, `first`, `last`, `street`, `city`, `state`, `zip`, `email`, `username`, `password`, `dob`, `phone`, `picture`) VALUES
('male', 'mr', 'craig', 'duncan', '6806 w belt line rd', 'toowoomba', 'northern territory', '63775', 'craig.duncan@example.com', 'bigpanda896', 'target', 718729417, '08-1171-8190', 'https://randomuser.me/api/portraits/med/men/86.jpg'),
('male', 'mr', 'daniel', 'ryan', '4847 white oak dr', 'rockhampton', 'western australia', '16124', 'daniel.ryan@example.com', 'lazyfish641', 'winner1', 1252372521, '06-9762-2515', 'https://randomuser.me/api/portraits/med/men/31.jpg'),
('female', 'mrs', 'deanna', 'montgomery', '1356 oak lawn ave', 'coffs harbour', 'queensland', '60260', 'deanna.montgomery@example.com', 'purpletiger519', 'aztnm', 1144005484, '09-9152-2266', 'https://randomuser.me/api/portraits/med/women/91.jpg'),
('male', 'mr', 'donald', 'hayes', '7363 pecan acres ln', 'australian capital territory', 'queensland', '43241', 'donald.hayes@example.com', 'crazyleopard329', 'conrad', 348008488, '07-6267-3320', 'https://randomuser.me/api/portraits/med/men/25.jpg'),
('female', 'ms', 'edith', 'craig', '9727 dogwood ave', 'hervey bay', 'queensland', '40169', 'edith.craig@example.com', 'brownleopard233', 'these', 1391424801, '05-5941-4167', 'https://randomuser.me/api/portraits/med/women/65.jpg'),
('male', 'mr', 'george', 'lucas', '6721 first street', 'geelong', 'australian capital territory', '28739', 'george.lucas@example.com', 'beautifulmouse169', 'scania', 660263742, '04-8887-3173', 'https://randomuser.me/api/portraits/med/men/65.jpg'),
('male', 'mr', 'herman', 'kim', '7308 white oak dr', 'nowra', 'victoria', '31302', 'herman.kim@example.com', 'purpleelephant296', 'oedipus', 385060399, '00-7355-5382', 'https://randomuser.me/api/portraits/med/men/13.jpg'),
('male', 'mr', 'julio', 'webb', '8480 fincher rd', 'townsville', 'tasmania', '98727', 'julio.webb@example.com', 'blackpeacock544', 'skyhawk', 324873686, '07-8070-5960', 'https://randomuser.me/api/portraits/med/men/89.jpg'),
('male', 'mr', 'kirk', 'payne', '4637 e pecan st', 'darwin', 'northern territory', '65006', 'kirk.payne@example.com', 'goldenkoala942', 'stinger', 819925017, '07-2230-8792', 'https://randomuser.me/api/portraits/med/men/40.jpg'),
('female', 'mrs', 'rose', 'mckinney', '5403 eason rd', 'warrnambool', 'queensland', '25324', 'rose.mckinney@example.com', 'lazybear607', 'qazwsx', 1065367840, '02-1238-3194', 'https://randomuser.me/api/portraits/med/women/88.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
