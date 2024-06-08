-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 11:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`) VALUES
(1, 1, 'hi', '2024-05-30 08:27:35'),
(2, 2, 'wech', '2024-05-30 08:28:26'),
(3, 2, 'ok', '2024-05-30 08:28:36'),
(4, 2, 'yrd', '2024-05-30 08:43:31'),
(5, 2, 'ok', '2024-05-30 09:09:51'),
(6, 1, 'wy', '2024-05-30 09:26:56'),
(7, 3, 'hey', '2024-05-30 09:40:40'),
(8, 1, 'wech', '2024-05-30 09:41:05'),
(9, 4, 'hey y\'all', '2024-05-30 09:42:32'),
(10, 1, 'o', '2024-05-30 09:42:53'),
(11, 1, 'ssss', '2024-05-30 09:43:50'),
(12, 1, 'ssss', '2024-05-30 09:43:52'),
(13, 4, 'nznj', '2024-05-30 09:44:58'),
(14, 4, 'bddjzd', '2024-05-30 09:45:02'),
(15, 4, 'look nice', '2024-05-30 09:51:06'),
(16, 5, 'ok', '2024-05-30 20:48:21'),
(17, 5, 'Hi', '2024-05-30 20:48:41'),
(18, 5, 'sss', '2024-05-30 20:51:00'),
(19, 1, 'sat', '2024-05-30 21:04:51'),
(20, 1, 'ok', '2024-05-30 21:05:16'),
(21, 5, 'alright', '2024-05-30 21:06:53'),
(22, 6, 'heeeeey', '2024-05-30 21:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'kamal kamal', 'kamal@email.com', '$2y$10$J5rBz8r473CjZ20BWm0DX.V8Bew5uCqf5FYqNKRaEuz64x0AFb.Ky'),
(2, 'ahlam nam', 'ahlam@email.com', '$2y$10$fCBl361BWc2hmv8Wp0e.muVlKCm9TjcBS08qart8jMIqjphFJinMa'),
(3, 'ahmed alami', 'ahmed@li.li', '$2y$10$nmVGvDlXfJsxHAPtBOER3e6J3JZfr1n/6YMwGppnG4DVTXuugjfrK'),
(4, 'jihane kamili', 'jihane@mail.com', '$2y$10$JWx8zSGGTQNJOdFNlwwg1OdW44bsl/MrZx6SGVvUqkKSWUHu7uCku'),
(5, 'john snow', 'snow@mail.com', '$2y$10$7Jhzpj2GZda8BrMhPsvNQ.Lxc5a9m4FLnoS5jw7UZwrC3mecpkkve'),
(6, 'justin we', 'we@me.me', '$2y$10$7omBmmU6pbycXogLN/gsnOWi0LLTIZ/5v5EBVzv/eP.rX0QAS4tFO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
