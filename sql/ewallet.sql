-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2021 at 04:13 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `token_fcms`
--

CREATE TABLE `token_fcms` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `token_fcms`
--

INSERT INTO `token_fcms` (`id`, `token`, `userId`, `createdAt`, `updatedAt`) VALUES
(9, 'fbMwwfDuSc6CjzYKp7ujMI:APA91bGHOFkJgdeh6aydbVxww717BfQ0hmP8t3vf9ewE0ANalEj8n-F_PABKGD3zkLgeu1RSzGPJUN7gnds8deMi_iqO1T6Yxxp0-xzpHNC5mFXlZ1CgWM1ZPdlaInETF5wdi9BHpa5u', 4, '2021-12-08 04:25:42', '2021-12-08 04:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `noRef` varchar(255) DEFAULT NULL,
  `deductedBalance` int(11) DEFAULT NULL,
  `topupBalance` int(11) NOT NULL,
  `transactionFee` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `phoneRecipient` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `userId`, `noRef`, `deductedBalance`, `topupBalance`, `transactionFee`, `description`, `phoneRecipient`, `createdAt`, `updatedAt`) VALUES
(4, 1, '1637722749256', 100000, 0, 1000, 'Beli voucher spotify', '', '2021-11-24 02:59:09', '2021-11-24 02:59:09'),
(5, 1, '1637733402380', NULL, 500000, NULL, 'Top Up Balance to Account', '', '2021-11-24 05:56:42', '2021-11-24 05:56:42'),
(6, 1, '1637733528583', NULL, 500000, NULL, 'Top Up Balance to Account', '', '2021-11-24 05:58:48', '2021-11-24 05:58:48'),
(7, 1, '1637733561559', NULL, 500000, NULL, 'Top Up Balance to Account', '', '2021-11-24 05:59:21', '2021-11-24 05:59:21'),
(8, 1, '1637733807093', 0, 500000, NULL, 'Top Up Balance to Account', '', '2021-11-24 06:03:27', '2021-11-24 06:03:27'),
(9, 2, '1638674568331', 0, 200000, NULL, 'Top Up Balance to Account', '', '2021-12-05 03:22:48', '2021-12-05 03:22:48'),
(10, 1, '1638836852155', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 00:27:32', '2021-12-07 00:27:32'),
(11, 1, '1638837332675', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 00:35:32', '2021-12-07 00:35:32'),
(12, 2, '1638837701538', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 00:41:41', '2021-12-07 00:41:41'),
(13, 2, '1638837799626', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 00:43:19', '2021-12-07 00:43:19'),
(14, 2, '1638838056918', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 00:47:36', '2021-12-07 00:47:36'),
(15, 1, '1638840938580', 0, 0, 0, 'transfer balance', '081271408776', '2021-12-07 01:35:38', '2021-12-07 01:35:38'),
(16, 1, '1638841179053', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 01:39:39', '2021-12-07 01:39:39'),
(17, 1, '1638841444371', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 01:44:04', '2021-12-07 01:44:04'),
(18, 1, '1638841467992', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 01:44:27', '2021-12-07 01:44:27'),
(19, 1, '1638842771081', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 02:06:11', '2021-12-07 02:06:11'),
(20, 2, '1638842940732', 100000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:09:00', '2021-12-07 02:09:00'),
(21, 2, '1638843069466', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:11:09', '2021-12-07 02:11:09'),
(22, 2, '1638843188176', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:13:08', '2021-12-07 02:13:08'),
(23, 2, '1638843272390', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:14:32', '2021-12-07 02:14:32'),
(24, 2, '1638843328931', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:15:28', '2021-12-07 02:15:28'),
(25, 2, '1638843376670', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:16:16', '2021-12-07 02:16:16'),
(26, 2, '1638843460270', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 02:17:40', '2021-12-07 02:17:40'),
(27, 1, '1638843976873', 100000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 02:26:16', '2021-12-07 02:26:16'),
(28, 2, '1638847721657', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 03:28:41', '2021-12-07 03:28:41'),
(29, 1, '1638864130038', 50000, 0, 0, 'transfer balance', '081271408776', '2021-12-07 08:02:10', '2021-12-07 08:02:10'),
(30, 2, '1638864211109', 50000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 08:03:31', '2021-12-07 08:03:31'),
(31, 2, '1638864615688', 80000, 0, 0, 'transfer balance', '081242435667', '2021-12-07 08:10:15', '2021-12-07 08:10:15'),
(32, 1, '1638864671229', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 08:11:11', '2021-12-07 08:11:11'),
(33, 1, '1638864787483', 0, 50000, NULL, 'Top Up Balance to Account', '', '2021-12-07 08:13:07', '2021-12-07 08:13:07'),
(34, 1, '1638926296360', 100000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:18:16', '2021-12-08 01:18:16'),
(35, 3, '1638927483555', 0, 100000, NULL, 'Top Up Balance to Account', '', '2021-12-08 01:38:03', '2021-12-08 01:38:03'),
(36, 1, '1638927578539', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 01:39:38', '2021-12-08 01:39:38'),
(37, 1, '1638927614995', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 01:40:15', '2021-12-08 01:40:15'),
(38, 1, '1638927711556', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 01:41:51', '2021-12-08 01:41:51'),
(39, 1, '1638928130689', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 01:48:50', '2021-12-08 01:48:50'),
(40, 1, '1638928195139', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 01:49:55', '2021-12-08 01:49:55'),
(41, 1, '1638928388479', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:53:08', '2021-12-08 01:53:08'),
(42, 1, '1638928596738', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:56:36', '2021-12-08 01:56:36'),
(43, 1, '1638928643106', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:57:23', '2021-12-08 01:57:23'),
(44, 1, '1638928684891', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:58:04', '2021-12-08 01:58:04'),
(45, 1, '1638928747091', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 01:59:07', '2021-12-08 01:59:07'),
(46, 1, '1638928886402', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 02:01:26', '2021-12-08 02:01:26'),
(47, 1, '1638928956715', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 02:02:36', '2021-12-08 02:02:36'),
(48, 1, '1638931591294', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 02:46:31', '2021-12-08 02:46:31'),
(49, 1, '1638933796380', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 03:23:16', '2021-12-08 03:23:16'),
(50, 3, '1638933829390', 0, 20000, NULL, 'Top Up Balance to Account', '', '2021-12-08 03:23:49', '2021-12-08 03:23:49'),
(51, 1, '1638933907087', 20000, 0, 0, 'transfer balance', '085609304506', '2021-12-08 03:25:07', '2021-12-08 03:25:07'),
(52, 2, '1638936838624', 0, 20000, NULL, 'Top Up Balance to Account', '', '2021-12-08 04:13:58', '2021-12-08 04:13:58'),
(53, 2, '1638936964435', 0, 20000, NULL, 'Top Up Balance to Account', '', '2021-12-08 04:16:04', '2021-12-08 04:16:04'),
(54, 1, '1638937268154', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:21:08', '2021-12-08 04:21:08'),
(55, 1, '1638937297186', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:21:37', '2021-12-08 04:21:37'),
(56, 1, '1638937356635', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:22:36', '2021-12-08 04:22:36'),
(57, 1, '1638937403195', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:23:23', '2021-12-08 04:23:23'),
(58, 1, '1638937473080', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:24:33', '2021-12-08 04:24:33'),
(59, 1, '1638937559424', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:25:59', '2021-12-08 04:25:59'),
(60, 3, '1638937640566', 0, 20000, NULL, 'Top Up Balance to Account', '', '2021-12-08 04:27:20', '2021-12-08 04:27:20'),
(61, 4, '1638937922972', 0, 20000, NULL, 'Top Up Balance to Account', '', '2021-12-08 04:32:03', '2021-12-08 04:32:03'),
(62, 1, '1638938015791', 20000, 0, 0, 'transfer balance', '081233334444', '2021-12-08 04:33:35', '2021-12-08 04:33:35'),
(63, 4, '1638938212267', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:36:52', '2021-12-08 04:36:52'),
(64, 4, '1638938236804', 20000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:37:16', '2021-12-08 04:37:16'),
(65, 1, '1638938433740', 20000, 0, 0, 'transfer balance', '081233334444', '2021-12-08 04:40:33', '2021-12-08 04:40:33'),
(66, 4, '1638938472818', 10000, 0, 0, 'transfer balance', '081271408776', '2021-12-08 04:41:12', '2021-12-08 04:41:12'),
(67, 4, '1638938603149', 10000, 0, 0, 'transfer balance', '081242435667', '2021-12-08 04:43:23', '2021-12-08 04:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `images` varchar(200) NOT NULL,
  `phone_number` varchar(25) NOT NULL,
  `balance` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `images`, `phone_number`, `balance`, `createdAt`, `updatedAt`) VALUES
(1, 'Jon Dummy', 'dummy1@mail.com', '$2b$10$dT/pwEJX38F2j15DkZX3he1aAkdOV1hkLMMc5hHBbj.2JKBORr8t2', '/upload/1638863765307.jpg', '081242435667', 2530000, '2021-11-18 05:23:52', '2021-12-08 04:43:23'),
(2, 'John Hawk', 'dummy2@mail.com', '$2b$10$q5J4l3VD5h0XXBvqlsPiGuQC2/dmHnr5wiQk6ffKBB5cdyMY7hb5.', '/upload/1638925518851.jpg', '081271408776', 770000, '2021-12-04 03:57:26', '2021-12-08 04:41:12'),
(3, 'John Rey', 'johnrey@mail.com', '$2b$10$VOt5lRTd21GULWJ1kvvcW.7rNaHw4bpMGEgMmhCjISWBaRCxLmPYS', '', '085609304506', 300000, '2021-12-08 01:35:43', '2021-12-08 04:27:20'),
(4, 'John Tor', 'titor@mail.com', '$2b$10$NjTnMeU1V56zTTS8bwqS4.kS1ujnsRTAr1iGjV2w8gAYLcp3poW2m', '/upload/1638938109322.jpg', '081233334444', 0, '2021-12-08 04:30:00', '2021-12-08 04:43:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `token_fcms`
--
ALTER TABLE `token_fcms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `token_fcms`
--
ALTER TABLE `token_fcms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `token_fcms`
--
ALTER TABLE `token_fcms`
  ADD CONSTRAINT `token_fcms_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
