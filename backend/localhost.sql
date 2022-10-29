-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2022 at 01:07 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id19061420_capastone`
--
CREATE DATABASE IF NOT EXISTS `id19061420_capastone` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id19061420_capastone`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cnumber` varchar(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_accounts`
--

INSERT INTO `tbl_accounts` (`userid`, `name`, `age`, `address`, `email`, `cnumber`, `username`, `password`, `position`) VALUES
(12, 'JPP', 11, 'sfgsgse', 'lunaq@test.com', '14654464674', 'jp@gmail.com', 'jpqwer', 'admin'),
(17, 'JPP', 11, 'sfgsgse', 'lunaiq@test.com', '14654464674', 'dsgewsgwg', 'sadfsafa', 'dafafagf'),
(18, 'JPP', 11, 'sfgsgse', 'lunaiAq@test.com', '14654464674', 'dsgewsgwg', 'sadfsafa', 'dafafagf'),
(19, 'john Patrick Nora', 12, 'phase 2 mt.claire village', 'admin', '12331214', 'admin', 'admin', 'admin'),
(20, 'jp', 13, 'jdjdj', 'jdjdj', '611771', 'jdjdjd', 'mskdkdid', 'jdjdjd'),
(21, 'g7ff', 3, 'hnnn', 'uuii', 'hhjjk', 'dfgh', 'hnkk', 'jnb'),
(22, 'employee', 23, 'Peace Village phase 3', 'h.lluvia06@gmail.com', '12313', 'employee', 'employee', 'employee'),
(23, 'jo', 2, 'jziz8z9sakznzmz\njsjsjs', 'jwjsjd', '9467673737', 'usus', 'jsjsjs', 'jsusjs'),
(24, 'allen', 21, 'ssA', 'allenviel1209@gmail.com', '09089871740', 'srcvalo', 'Trick123', 'customer'),
(25, 'test', 21, 'test', 'test', '09123456789', 'test', 'test', 'customer'),
(26, 'ywusus', 234, 'ksksixoxd', '7eid8d', '9467688', 'usudud', 'isososos', 'customer'),
(27, 'hgde', 12, 'svs wb', 'vtxx', '18818', 'ddc', 'sveb', 'customer'),
(28, 'ugv', 12, 'jsjsjsjx', 'bbhh', '6598988', 'jwjsns', 'jjskss', 'customer'),
(29, 'sample', 21, 'sample', 'sample@gmail.com', '09123456789', 'sample', 'sample', 'Customer'),
(30, 'jpn', 123, 'Batangas', 'jpn', '09123456789', 'jpn', 'jpnjpn', 'Customer'),
(31, 'Lalisa', 24, 'Seoul, Korea', 'lalisamanobal@gmail.com', '09638527415', 'lalalalisa', 'lalisamanobal', 'Customer'),
(32, 'samplesample', 21, 'sample address', 'sample1@gmail.com ', '0912345678', 'sample1', 'sample', 'Customer'),
(33, 'Basagre ', 24, 'Peace Village Phase 3', 'mmbasagre1@student.fatima.edu.ph', '09617673147', 'Aian24', 'Aian24', 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients`
--

CREATE TABLE `tbl_clients` (
  `clientid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateadded` date NOT NULL,
  `addedby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_clients`
--

INSERT INTO `tbl_clients` (`clientid`, `name`, `address`, `contact`, `email`, `dateadded`, `addedby`) VALUES
(1, 'client', 'test address', '00000000000', 'm@gmail.com', '2022-06-03', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jartypes`
--

CREATE TABLE `tbl_jartypes` (
  `jartypeid` int(11) NOT NULL,
  `jartype` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `gallon` int(11) NOT NULL,
  `price` varchar(10) NOT NULL,
  `dateadded` date NOT NULL,
  `addedby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jartypes`
--

INSERT INTO `tbl_jartypes` (`jartypeid`, `jartype`, `image`, `gallon`, `price`, `dateadded`, `addedby`) VALUES
(1, 'Round', 'round.jpg', 5, '25', '0000-00-00', 'Admin'),
(3, 'slim', 'slim.jpg', 7, '25', '0000-00-00', 'Admin'),
(8, 'Bottle', 'BGlogin.jpeg', 1, '10', '0000-00-00', 'Admin'),
(9, 'gallons', 'BGlogin.jpeg', 1, '15', '0000-00-00', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `orderid` int(11) NOT NULL,
  `transactionnum` varchar(50) NOT NULL,
  `jartypeid` int(11) NOT NULL,
  `jartype` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `gallon` int(11) NOT NULL,
  `watertype` varchar(50) DEFAULT NULL,
  `delivery` varchar(50) DEFAULT NULL,
  `dateadded` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `clientid` varchar(50) NOT NULL,
  `address` mediumtext NOT NULL,
  `amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`orderid`, `transactionnum`, `jartypeid`, `jartype`, `price`, `quantity`, `gallon`, `watertype`, `delivery`, `dateadded`, `status`, `clientid`, `address`, `amount`) VALUES
(101, '20220926629A', 9, 'gallons', 15, 1, 1, 'mineral', 'Pickup', '2022-09-26', 'Delivered', 'asas', '', 40),
(102, '202209265F57', 1, 'Round', 25, 1, 1, 'mineral', 'Pickup', '2022-09-26', 'For Delivery', 'as', '', 40),
(103, '202209265F57', 9, 'gallons', 15, 1, 1, 'mineral', 'Pickup', '2022-09-26', 'For Delivery', 'as', '', 40),
(104, '20220926563E', 1, 'Round', 30, 1, 1, 'mineral', 'Delivery', '2022-09-26', 'Delivered', 'Ken', 'rtrt', 40),
(105, '20220926563E', 9, 'gallons', 20, 1, 1, 'mineral', 'Delivery', '2022-09-26', 'Delivered', 'Ken', 'rtrt', 40),
(106, '20220926CC83', 1, 'Round', 25, 1, 1, 'mineral', 'Delivery', '2022-09-26', 'Delivered', 'Ken', 'as', 45),
(107, '20220926CC83', 9, 'gallons', 15, 1, 1, 'mineral', 'Delivery', '2022-09-26', 'Delivered', 'Ken', 'as', 45),
(108, '20220926164E', 9, 'gallons', 15, 1, 7, 'mineral', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(109, '20220926164E', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(110, '20220926164E', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(111, '202209262E74', 9, 'gallons', 15, 1, 7, 'mineral', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', '', 50),
(112, '202209262E74', 9, 'gallons', 15, 1, 7, 'mineral', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(113, '202209262E74', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', '', 50),
(114, '202209262E74', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(115, '202209262E74', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', '', 50),
(116, '202209262E74', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(117, '20220926493C', 9, 'gallons', 15, 1, 7, 'mineral', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', 'Store Pick-Up', 50),
(118, '20220926493C', 9, 'gallons', 15, 1, 7, 'mineral', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(119, '20220926493C', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', 'Store Pick-Up', 50),
(120, '20220926493C', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(121, '20220926493C', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'Store Pick-Up', 'marie', 'Store Pick-Up', 50),
(122, '20220926493C', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-26', 'For Delivery', 'marie', '', 50),
(123, '20220926E470', 9, 'gallons', 15, 1, 7, 'mineral', 'Delivery', '2022-09-26', 'For Delivery', 'marie', 'test address', 55),
(124, '20220926E470', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Delivery', '2022-09-26', 'For Delivery', 'marie', 'test address', 55),
(125, '20220926E470', 3, 'slim', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-26', 'For Delivery', 'marie', 'test address', 55),
(126, '20220927FDF2', 9, 'gallons', 15, 1, 7, 'mineral', 'Delivery', '2022-09-27', 'Delivered', 'Marie Panes', 'test address', 55),
(127, '20220927FDF2', 8, 'Bottle', 10, 1, 7, 'alkaline', 'Delivery', '2022-09-27', 'Delivered', 'Marie Panes', 'test address', 55),
(128, '20220927FDF2', 3, 'slim', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-27', 'Delivered', 'Marie Panes', 'test address', 55),
(129, '20220927EF2D', 8, 'Bottle', 50, 5, 1, 'mineral', 'Delivery', '2022-09-27', 'For Delivery', 'Marie Panes', 'test addressss', 55),
(130, '202209302419', 1, 'Round', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-30', 'For Delivery', 'Je lo', '091iskamyas!', 55),
(131, '202209302419', 3, 'slim', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-30', 'For Delivery', 'Je lo', '091iskamyas!', 55),
(132, '20220930618B', 1, 'Round', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-30', 'Delivered', 'Basagre', 'Padilla st.', 55),
(133, '20220930618B', 3, 'slim', 25, 1, 7, 'alkaline', 'Delivery', '2022-09-30', 'Delivered', 'Basagre', 'Padilla st.', 55),
(134, '202209304E68', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', 'Store Pick-Up', 50),
(135, '202209304E68', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', 'Padilla st.', 50),
(136, '202209304E68', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', 'Store Pick-Up', 50),
(137, '202209304E68', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Basagre', 'Padilla st.', 50),
(138, '20220930E4C6', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Basagre', 'Store Pick-Up', 50),
(139, '20220930E4C6', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Basagre', 'Padilla st.', 50),
(140, '20220930E4C6', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Basagre', 'Store Pick-Up', 50),
(141, '20220930E4C6', 3, 'slim', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Basagre', 'Padilla st.', 50),
(142, '202209300A38', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Basagre', 'Store Pick-Up', 25),
(143, '202209300A38', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Basagre', '', 25),
(144, '202209304522', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Je lo', 'Store Pick-Up', 25),
(145, '202209304522', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Je lo', '', 25),
(146, '202209303112', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'kotiks', 'Store Pick-Up', 25),
(147, '202209303112', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'kotiks', '', 25),
(148, '20220930C74D', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', 'Store Pick-Up', 25),
(149, '20220930C74D', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', '', 25),
(150, '20220930F454', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Aian', 'Store Pick-Up', 25),
(151, '20220930F454', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Aian', '', 25),
(152, '202209302098', 1, 'Round', 25, 1, 5, 'mineral', 'Delivery', '2022-09-30', 'For Delivery', 'HoneyPot', '091 Sitio East Kamias', 30),
(153, '20220930F14A', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Gab', 'Store Pick-Up', 50),
(154, '20220930F14A', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Gab', '', 50),
(155, '20220930F14A', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Gab', 'Store Pick-Up', 50),
(156, '20220930F14A', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Gab', '', 50),
(157, '202209300C99', 3, 'slim', 25, 1, 1, 'alkaline', 'Delivery', '2022-09-30', 'For Delivery', 'HoneyPot', '091 Sitio East Kamias', 40),
(158, '2022093041D4', 3, 'slim', 25, 1, 1, 'alkaline', 'Delivery', '2022-09-30', 'For Delivery', 'HoneyPot', '091 Sitio East Kamias', 40),
(159, '20220930F1E7', 3, 'slim', 25, 1, 1, 'alkaline', 'Delivery', '2022-09-30', 'For Delivery', 'HoneyPot', '091 Sitio East Kamias', 40),
(160, '202209300C95', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Aian', 'Store Pick-Up', 50),
(161, '202209300C95', 1, 'Round', 25, 1, 7, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Aian', '', 50),
(162, '202209300C95', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Aian', 'Store Pick-Up', 50),
(163, '202209300C95', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Aian', '', 50),
(164, '2022093085FE', 8, 'Bottle', 50, 1, 1, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Marie Panes', 'Store Pick-Up', 65),
(165, '2022093085FE', 8, 'Bottle', 50, 1, 1, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Marie Panes', '', 65),
(166, '2022093085FE', 9, 'gallons', 15, 1, 1, 'alkaline', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Marie Panes', 'Store Pick-Up', 65),
(167, '2022093085FE', 9, 'gallons', 15, 1, 1, 'alkaline', 'Pickup', '2022-09-30', 'For Delivery', 'Marie Panes', '', 65),
(168, '202209309D3B', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Marie Panes', 'Store Pick-Up', 25),
(169, '202209309D3B', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Marie Panes', '', 25),
(170, '202209302CAC', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Marie Panes', 'Store Pick-Up', 25),
(171, '202209302CAC', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-09-30', 'For Delivery', 'Marie Panes', '', 25),
(172, '2022093024FD', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'Store Pick-Up', 'Basagre', 'Store Pick-Up', 25),
(173, '2022093024FD', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-09-30', 'Delivered', 'Basagre', '', 25),
(174, '20220930C620', 3, 'slim', 25, 1, 1, 'mineral', 'Pickup', '2022-09-30', 'Pending', 'Marie Panes', 'Store Pick Up', 35),
(175, '20220930C620', 8, 'Bottle', 10, 1, 1, 'mineral', 'Pickup', '2022-09-30', 'Pending', 'Marie Panes', 'Store Pick Up', 35),
(176, '20220930021B', 3, 'slim', 30, 1, 1, 'mineral', 'Delivery', '2022-09-30', 'Pending', 'Marie Panes', 'test address', 35),
(177, '20220930021B', 8, 'Bottle', 15, 1, 1, 'mineral', 'Delivery', '2022-09-30', 'Pending', 'Marie Panes', 'test address', 35),
(178, '20220930E0EF', 1, 'Round', 25, 1, 5, 'alkaline', 'Pickup', '2022-09-30', 'Pending', 'Je lo', 'Store Pick Up', 25),
(179, '20220930AD17', 1, 'Round', 30, 1, 1, 'mineral', 'Delivery', '2022-09-30', 'Pending', 'Jellyace', '091 Sitio East Kamias', 50),
(180, '20220930AD17', 9, 'gallons', 20, 1, 1, 'alkaline', 'Delivery', '2022-09-30', 'Pending', 'Jellyace', '091 Sitio East Kamias', 50),
(181, '20220930AD17', 8, 'Bottle', 15, 1, 1, 'mineral', 'Delivery', '2022-09-30', 'Pending', 'Jellyace', '091 Sitio East Kamias', 50),
(182, '202209304B1A', 10, 'water_refill', 15, 1, 2, 'alkaline', 'Pickup', '2022-09-30', 'Pending', 'Jellyace', 'Store Pick Up', 15),
(183, '20221001B65C', 1, 'Round', 30, 1, 3, 'mineral', 'Delivery', '2022-10-01', 'Pending', 'Marie Panes', 'Metro Royale Homes phase 3 burgos rodriguez', 45),
(184, '20221001B65C', 10, 'water_refill', 25, 1, 3, 'mineral', 'Delivery', '2022-10-01', 'Pending', 'Marie Panes', 'Metro Royale Homes phase 3 burgos rodriguez', 45),
(185, '20221010CBB6', 9, 'gallons', 15, 1, 5, 'alkaline', 'Pickup', '2022-10-10', 'Pending', 'jepi', 'Store Pick Up', 40),
(186, '20221010CBB6', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-10-10', 'Pending', 'jepi', 'Store Pick Up', 40),
(187, '20221019C6FE', 10, 'water_refill', 50, 1, 5, 'mineral', 'Pickup', '2022-10-19', 'Pending', 'jepi', 'Store Pick Up', 75),
(188, '20221019C6FE', 1, 'Round', 25, 1, 5, 'mineral', 'Pickup', '2022-10-19', 'Pending', 'jepi', 'Store Pick Up', 75),
(189, '20221019EFA2', 3, 'slim', 25, 1, 7, 'mineral', 'Pickup', '2022-10-19', 'Pending', 'jepi', 'Store Pick Up', 25),
(190, '20220926629t', 9, 'gallons', 20, 3, 1, 'BGlogin.jpeg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 15),
(191, '20220926629t', 1, 'Round', 20, 3, 1, 'round.jpg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 25),
(192, '20220926629t', 3, 'slim', 20, 3, 1, 'slim.jpg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 25),
(193, '20220926629t', 8, 'Bottle', 20, 3, 1, 'BGlogin.jpeg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 10),
(194, '20220926629t', 9, 'gallons', 20, 3, 1, 'BGlogin.jpeg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 15),
(195, '20220926629t', 1, 'Round', 20, 2, 1, 'round.jpg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 5),
(196, '20220926629t', 9, 'gallons', 20, 2, 1, 'BGlogin.jpeg', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 1),
(197, '202210191B76', 1, 'Round', 20, 2, 1, 'mineral', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 5),
(198, '2022101908B6', 1, 'Round', 2, 5, 1, 'mineral', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 10147),
(199, '2022101908B6', 3, 'slim', 2, 7, 1, 'mineral', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 10147),
(200, '2022101908B6', 8, 'Bottle', 3, 1, 1, 'mineral', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 10147),
(201, '2022101908B6', 9, 'gallons', 3, 1, 1, 'mineral', 'pickup', '2022-09-26', 'Pending', 'jejeaqo', 'biga', 10147),
(202, '202210190C76', 8, 'Bottle', 2, 1, 0, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(203, '20221019EFF1', 1, 'Round', 3, 5, 25, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(204, '20221019EFF1', 3, 'slim', 3, 7, 25, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(205, '20221019EFF1', 8, 'Bottle', 3, 1, 10, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(206, '20221019EFF1', 9, 'gallons', 3, 1, 15, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(207, '202210199C90', 1, 'Round', 3, 5, 25, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(208, '202210199C90', 3, 'slim', 5, 7, 25, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(209, '202210191E6A', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(210, '202210191E6A', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', 'jejeaqo', 'biga', 10147),
(211, '20221019EB07', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', '', '', 1212),
(212, '20221019EB07', 3, 'slim', 25, 7, 5, 'mineral', 'pickup', '2022-10-19', 'Pending', '', '', 1212),
(213, '20221019EB07', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', '', '', 1212),
(214, '20221019EB07', 9, 'gallons', 15, 1, 6, 'mineral', 'pickup', '2022-10-19', 'Pending', '', '', 1212),
(215, '20221019C4E4', 3, 'slim', 25, 7, 4, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 213132),
(216, '20221019C4E4', 8, 'Bottle', 10, 1, 1, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 213132),
(217, '202210194196', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 213132),
(218, '202210194196', 9, 'gallons', 15, 1, 4, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 213132),
(219, '20221019157D', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 215),
(220, '20221019157D', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 215),
(221, '20221019157D', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 215),
(222, '20221019157D', 9, 'gallons', 15, 1, 4, 'mineral', 'pickup', '2022-10-19', 'Pending', 'test', 'test', 215),
(223, '2022102091CC', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(224, '2022102091CC', 3, 'slim', 25, 7, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(225, '2022102091CC', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(226, '2022102091CC', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(227, '202210202E3D', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 25),
(228, '2022102070DD', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(229, '2022102070DD', 3, 'slim', 25, 7, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(230, '2022102070DD', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(231, '2022102070DD', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 225),
(232, '202210205E27', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 190),
(233, '202210205E27', 3, 'slim', 25, 7, 1, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 190),
(234, '202210205E27', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 190),
(235, '202210205E27', 9, 'gallons', 15, 1, 4, 'mineral', 'pickup', '2022-10-20', 'Pending', 'test', 'test', 190),
(236, '202210203576', 1, 'Round', 25, 5, 4, 'mineral', 'pickup', '2022-10-20', 'Delivered', 'sample', 'sample', 215),
(237, '202210203576', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-20', 'Delivered', 'sample', 'sample', 215),
(238, '202210203576', 8, 'Bottle', 10, 1, 2, 'mineral', 'pickup', '2022-10-20', 'Delivered', 'sample', 'sample', 215),
(239, '202210203576', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-20', 'Delivered', 'sample', 'sample', 215),
(240, '20221021AE0C', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 175),
(241, '20221021AE0C', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 175),
(242, '20221021AE0C', 8, 'Bottle', 10, 1, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 175),
(243, '20221021AE0C', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 175),
(244, '20221021BF2C', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 50),
(245, '2022102106DA', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 125),
(246, '2022102106DA', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 125),
(247, '2022102106DA', 8, 'Bottle', 10, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 125),
(248, '2022102106DA', 9, 'gallons', 15, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 125),
(249, '20221021A5B6', 9, 'gallons', 15, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 30),
(250, '20221021E7D4', 9, 'gallons', 15, 1, 4, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 60),
(251, '20221021A383', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 50),
(252, '2022102182B3', 9, 'gallons', 15, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 30),
(253, '20221021AB53', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 50),
(254, '20221021FA3B', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 50),
(255, '202210218B66', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 150),
(256, '202210218B66', 3, 'slim', 25, 7, 3, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 150),
(257, '202210211A6E', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 150),
(258, '202210211A6E', 3, 'slim', 25, 7, 3, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 150),
(259, '202210214163', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 50),
(260, '202210215711', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 50),
(261, '202210215E77', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 275),
(262, '202210215E77', 3, 'slim', 25, 7, 4, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 275),
(263, '202210215E77', 8, 'Bottle', 10, 1, 5, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(264, '202210215E77', 9, 'gallons', 15, 1, 5, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(265, '2022102192BB', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(266, '2022102192BB', 3, 'slim', 25, 7, 4, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(267, '2022102192BB', 8, 'Bottle', 10, 1, 5, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(268, '2022102192BB', 9, 'gallons', 15, 1, 5, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 275),
(269, '2022102194BD', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 150),
(270, '2022102194BD', 3, 'slim', 25, 7, 4, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 150),
(301, '202210218900', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 180),
(302, '202210218900', 3, 'slim', 25, 7, 1, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 180),
(303, '202210218900', 8, 'Bottle', 10, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 180),
(304, '202210218900', 9, 'gallons', 15, 1, 4, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 180),
(305, '20221021C58A', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'Lalisa', 'Seoul, Korea', 75),
(306, '20221021C58A', 3, 'slim', 25, 7, 1, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'Lalisa', 'Seoul, Korea', 75),
(307, '20221021C58A', 8, 'Bottle', 10, 1, 1, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'Lalisa', 'Seoul, Korea', 75),
(308, '20221021C58A', 9, 'gallons', 15, 1, 1, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'Lalisa', 'Seoul, Korea', 75),
(309, '20221021DFD2', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 140),
(310, '20221021DFD2', 3, 'slim', 25, 7, 1, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 140),
(311, '20221021DFD2', 8, 'Bottle', 10, 1, 2, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 140),
(312, '20221021DFD2', 9, 'gallons', 15, 1, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'jpn', 'Batangas', 140),
(313, '20221021828F', 1, 'Round', 25, 5, 10, 'mineral', 'pickup', '2022-10-21', 'Delivered', 'test', 'test', 250),
(314, '20221021B037', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 75),
(315, '202210210245', 1, 'Round', 25, 5, 3, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 225),
(316, '202210210245', 3, 'slim', 25, 7, 5, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 225),
(317, '202210210245', 8, 'Bottle', 10, 1, 1, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 225),
(318, '202210210245', 9, 'gallons', 15, 1, 1, 'mineral', 'pickup', '2022-10-21', 'Pending', 'test', 'test', 225),
(319, '20221022AE05', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'samplesample', 'sample address', 140),
(320, '20221022AE05', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-22', 'Pending', 'samplesample', 'sample address', 140),
(321, '20221022AE05', 8, 'Bottle', 10, 1, 1, 'mineral', 'pickup', '2022-10-22', 'Pending', 'samplesample', 'sample address', 140),
(322, '20221022AE05', 9, 'gallons', 15, 1, 2, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'samplesample', 'sample address', 140),
(323, '2022102242BC', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'samplesample', 'sample address', 25),
(324, '20221022865F', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-22', 'Pending', 'Basagre ', 'Peace Village Phase 3', 75),
(325, '20221022865F', 3, 'slim', 25, 7, 1, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'Basagre ', 'Peace Village Phase 3', 75),
(326, '20221022865F', 8, 'Bottle', 10, 1, 1, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'Basagre ', 'Peace Village Phase 3', 75),
(327, '20221022865F', 9, 'gallons', 15, 1, 1, 'mineral', 'pickup', '2022-10-22', 'Pending', 'Basagre ', 'Peace Village Phase 3', 75),
(328, '2022102218CB', 1, 'Round', 25, 5, 2, 'mineral', 'pickup', '2022-10-22', 'Pending', 'test', 'test', 120),
(329, '2022102218CB', 3, 'slim', 25, 7, 2, 'mineral', 'pickup', '2022-10-22', 'Pending', 'test', 'test', 120),
(330, '2022102218CB', 8, 'Bottle', 10, 1, 2, 'mineral', 'pickup', '2022-10-22', 'Pending', 'test', 'test', 120),
(331, '20221022C89E', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-22', 'Pending', 'Basagre ', 'Peace Village Phase 3', 25),
(332, '202210224A59', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-22', 'Delivered', 'sample', 'sample', 25),
(333, '20221022845F', 1, 'Round', 25, 5, 1, 'mineral', 'pickup', '2022-10-22', 'Pending', 'sample', 'sample', 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productcategory`
--

CREATE TABLE `tbl_productcategory` (
  `id` int(11) NOT NULL,
  `categoryname` int(11) NOT NULL,
  `addedby` int(11) NOT NULL,
  `addeddate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  ADD PRIMARY KEY (`clientid`);

--
-- Indexes for table `tbl_jartypes`
--
ALTER TABLE `tbl_jartypes`
  ADD PRIMARY KEY (`jartypeid`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  MODIFY `clientid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_jartypes`
--
ALTER TABLE `tbl_jartypes`
  MODIFY `jartypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `tbl_productcategory`
--
ALTER TABLE `tbl_productcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
