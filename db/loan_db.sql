-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2024 at 11:21 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `counter_tab`
--

CREATE TABLE `counter_tab` (
  `sn` int(11) NOT NULL,
  `counter_id` varchar(255) NOT NULL,
  `counter_description` varchar(255) NOT NULL,
  `counter_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counter_tab`
--

INSERT INTO `counter_tab` (`sn`, `counter_id`, `counter_description`, `counter_value`) VALUES
(1, 'USER', 'count number of users', 4),
(2, 'TRANS', 'count number of transactions', 4);

-- --------------------------------------------------------

--
-- Table structure for table `loan_request_transaction`
--

CREATE TABLE `loan_request_transaction` (
  `sn` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `month` int(11) NOT NULL,
  `loan_balance` float NOT NULL,
  `sub_payment` float NOT NULL,
  `interest` float NOT NULL,
  `total_repayment` float NOT NULL,
  `transaction_date` datetime NOT NULL,
  `system_used` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loan_request_transaction`
--

INSERT INTO `loan_request_transaction` (`sn`, `transaction_id`, `month`, `loan_balance`, `sub_payment`, `interest`, `total_repayment`, `transaction_date`, `system_used`, `ip_address`) VALUES
(1, 'TRANS20240217062420001', 1, 600000, 100000, 9000, 109000, '2024-02-17 18:24:20', 'FortuneTECH', '127.0.0.1'),
(2, 'TRANS20240217062420001', 2, 500000, 100000, 7500, 107500, '2024-02-17 18:24:20', 'FortuneTECH', '127.0.0.1'),
(3, 'TRANS20240217062420001', 3, 400000, 100000, 6000, 106000, '2024-02-17 18:24:20', 'FortuneTECH', '127.0.0.1'),
(4, 'TRANS20240217062420001', 4, 300000, 100000, 4500, 104500, '2024-02-17 18:24:21', 'FortuneTECH', '127.0.0.1'),
(5, 'TRANS20240217062420001', 5, 200000, 100000, 3000, 103000, '2024-02-17 18:24:21', 'FortuneTECH', '127.0.0.1'),
(6, 'TRANS20240217062420001', 6, 100000, 100000, 1500, 101500, '2024-02-17 18:24:21', 'FortuneTECH', '127.0.0.1'),
(7, 'TRANS20240217064137002', 1, 600000, 100000, 9000, 109000, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(8, 'TRANS20240217064137002', 2, 500000, 100000, 7500, 107500, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(9, 'TRANS20240217064137002', 3, 400000, 100000, 6000, 106000, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(10, 'TRANS20240217064137002', 4, 300000, 100000, 4500, 104500, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(11, 'TRANS20240217064137002', 5, 200000, 100000, 3000, 103000, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(12, 'TRANS20240217064137002', 6, 100000, 100000, 1500, 101500, '2024-02-17 18:41:37', 'FortuneTECH', '127.0.0.1'),
(13, 'TRANS20240218085858003', 1, 600000, 120000, 9000, 129000, '2024-02-18 14:58:58', 'FortuneTECH', '127.0.0.1'),
(14, 'TRANS20240218085858003', 2, 480000, 120000, 7200, 127200, '2024-02-18 14:58:58', 'FortuneTECH', '127.0.0.1'),
(15, 'TRANS20240218085858003', 3, 360000, 120000, 5400, 125400, '2024-02-18 14:58:58', 'FortuneTECH', '127.0.0.1'),
(16, 'TRANS20240218085858003', 4, 240000, 120000, 3600, 123600, '2024-02-18 14:58:58', 'FortuneTECH', '127.0.0.1'),
(17, 'TRANS20240218085858003', 5, 120000, 120000, 1800, 121800, '2024-02-18 14:58:58', 'FortuneTECH', '127.0.0.1'),
(18, 'TRANS20240218103641004', 1, 600000, 150000, 9000, 159000, '2024-02-18 16:36:41', 'FortuneTECH', '127.0.0.1'),
(19, 'TRANS20240218103641004', 2, 450000, 150000, 6750, 156750, '2024-02-18 16:36:41', 'FortuneTECH', '127.0.0.1'),
(20, 'TRANS20240218103641004', 3, 300000, 150000, 4500, 154500, '2024-02-18 16:36:41', 'FortuneTECH', '127.0.0.1'),
(21, 'TRANS20240218103641004', 4, 150000, 150000, 2250, 152250, '2024-02-18 16:36:41', 'FortuneTECH', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `users_tab`
--

CREATE TABLE `users_tab` (
  `sn` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `transaction_id` varchar(245) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `loan_amount` float NOT NULL,
  `loan_duration` float NOT NULL,
  `loan_rate` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_tab`
--

INSERT INTO `users_tab` (`sn`, `user_id`, `transaction_id`, `fullname`, `loan_amount`, `loan_duration`, `loan_rate`, `created_at`, `updated_at`) VALUES
(1, 'USER20240217062420001', 'TRANS20240217062420001', 'FORTUNE', 600000, 6, 1.5, '2024-02-17 18:24:20', '2024-02-17 17:24:20'),
(2, 'USER20240217064137002', 'TRANS20240217064137002', 'OPEYEMI', 600000, 6, 1.5, '2024-02-17 18:41:37', '2024-02-17 17:41:37'),
(3, 'USER20240218085858003', 'TRANS20240218085858003', 'OPEYEMI', 600000, 5, 1.5, '2024-02-18 14:58:58', '2024-02-18 19:58:58'),
(4, 'USER20240218103641004', 'TRANS20240218103641004', 'AFOLABI', 600000, 4, 1.5, '2024-02-18 16:36:41', '2024-02-18 21:36:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counter_tab`
--
ALTER TABLE `counter_tab`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `loan_request_transaction`
--
ALTER TABLE `loan_request_transaction`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `users_tab`
--
ALTER TABLE `users_tab`
  ADD PRIMARY KEY (`sn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counter_tab`
--
ALTER TABLE `counter_tab`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loan_request_transaction`
--
ALTER TABLE `loan_request_transaction`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users_tab`
--
ALTER TABLE `users_tab`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
