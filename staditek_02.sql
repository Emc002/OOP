-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2022 at 02:20 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `staditek_02`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id_branch` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `open_hour` time NOT NULL,
  `close_hour` time NOT NULL,
  `phone` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cahsier`
--

CREATE TABLE `cahsier` (
  `id_cashier` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` enum('PRIA','WANITA') NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_trx`
--

CREATE TABLE `detail_trx` (
  `id_dtl` int(11) NOT NULL,
  `fk_id_hdr` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_trx`
--

INSERT INTO `detail_trx` (`id_dtl`, `fk_id_hdr`, `item_name`, `quantity`, `price`, `created_at`, `update_at`) VALUES
(1, 1, 'coca-cola', 1, 10000, '2022-11-28 02:00:53', NULL),
(2, 1, 'Potata fried', 4, 40000, '2022-11-28 02:00:53', NULL),
(3, 2, 'shampoo', 1, 20000, '2022-11-28 02:06:32', NULL),
(4, 2, 'tooth brush', 1, 30000, '2022-11-28 02:06:32', NULL),
(5, 2, 'soap', 5, 50000, '2022-11-28 02:06:32', NULL),
(6, 3, 'egg', 20, 25000, '2022-11-28 02:06:32', NULL),
(7, 3, 'butter', 1, 25000, '2022-11-28 02:06:32', NULL),
(8, 3, 'rice', 1, 50000, '2022-11-28 02:06:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `header_trx`
--

CREATE TABLE `header_trx` (
  `id_hdr` int(11) NOT NULL,
  `hdr_id_branch` int(11) NOT NULL,
  `hdr_id_cashier` int(11) NOT NULL,
  `date_time` date NOT NULL,
  `discount_total` double NOT NULL,
  `total` int(11) NOT NULL,
  `total_price` double NOT NULL,
  `payment` double NOT NULL,
  `change_01` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `header_trx`
--

INSERT INTO `header_trx` (`id_hdr`, `hdr_id_branch`, `hdr_id_cashier`, `date_time`, `discount_total`, `total`, `total_price`, `payment`, `change_01`, `created_at`, `update_at`) VALUES
(1, 1, 1, '2022-11-28', 10000, 2, 50000, 100000, 50000, '2022-11-28 07:50:43', NULL),
(2, 2, 2, '2022-11-29', 10000, 3, 100000, 200000, 110000, '2022-11-28 07:50:43', NULL),
(3, 3, 3, '2022-11-30', 20000, 3, 100000, 200000, 120000, '2022-11-28 07:50:43', NULL),
(4, 4, 2, '2022-11-28', 20000, 5, 200000, 250000, 50000, '2022-11-28 08:08:04', NULL),
(5, 4, 2, '2022-11-28', 20000, 5, 200000, 250000, 50000, '2022-11-28 08:10:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `name_item` varchar(100) NOT NULL,
  `price_item` double NOT NULL,
  `stock_item` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `uom` varchar(25) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id_branch`);

--
-- Indexes for table `cahsier`
--
ALTER TABLE `cahsier`
  ADD PRIMARY KEY (`id_cashier`);

--
-- Indexes for table `detail_trx`
--
ALTER TABLE `detail_trx`
  ADD PRIMARY KEY (`id_dtl`),
  ADD KEY `fk_hrd_dtl_trx` (`fk_id_hdr`);

--
-- Indexes for table `header_trx`
--
ALTER TABLE `header_trx`
  ADD PRIMARY KEY (`id_hdr`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id_branch` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cahsier`
--
ALTER TABLE `cahsier`
  MODIFY `id_cashier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_trx`
--
ALTER TABLE `detail_trx`
  MODIFY `id_dtl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `header_trx`
--
ALTER TABLE `header_trx`
  MODIFY `id_hdr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
