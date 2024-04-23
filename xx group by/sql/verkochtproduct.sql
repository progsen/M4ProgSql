-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Apr 23, 2024 at 07:12 AM
-- Server version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `m4prog`
--

-- --------------------------------------------------------

--
-- Table structure for table `verkochtproduct`
--

drop table if exists `verkochtproduct`;


CREATE TABLE `verkochtproduct` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` varchar(100) NOT NULL,
  `aantal` int(11) NOT NULL,
  `verkoopprijs` double NOT NULL,
  `transactiedatum` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `verkochtproductid_UNIQUE` (`id` ASC) VISIBLE
);

--
-- Dumping data for table `verkochtproduct`
--

INSERT INTO `verkochtproduct` ( `product`, `aantal`, `verkoopprijs`, `transactiedatum`) VALUES
( 'mario wonder', 1, 59.99, '2024-04-23'),
( 'mario wonder', 2, 59.99, '2024-04-21'),
( 'switch', 1, 259.99, '2024-03-23'),
( 'mario wonder', 2, 49.99, '2024-04-09'),
( 'mario wonder', 1, 49.99, '2024-04-09'),
( 'mario wonder', 1, 49.99, '2024-04-09'),
( 'mario wonder', 2, 49.99, '2024-04-09'),
( 'zelda TOTK', 1, 59.99, '2024-04-13'),
( 'zelda TOTK', 1, 59.99, '2024-04-13'),
( 'zelda TOTK', 2, 55.99, '2024-04-13'),
( 'switch', 1, 259.99, '2024-03-23'),
( 'switch', 1, 229.99, '2024-03-23'),
( 'switch', 2, 229.99, '2024-03-23'),
( 'zelda TOTK', 1, 59.99, '2024-04-13'),
( 'zelda TOTK', 3, 49.99, '2024-04-13'),
( 'mario wonder', 1, 59.99, '2024-04-03');
--
-- Indexes for dumped tables
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
