-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2024 at 12:20 PM
-- Server version: 10.6.4-MariaDB-log
-- PHP Version: 8.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football_players_phincon`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `club_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`club_id`, `club_name`, `club_location`) VALUES
(1, 'Liverpool FC', 'Liverpool, England'),
(2, 'Manchester United', 'Manchester, England'),
(3, 'AS Roma', 'Rome, Italy'),
(4, 'Inter Miami', 'Florida, USA'),
(5, 'Al-Nassr', 'Riyadh, Saudi Arabia'),
(6, 'FC Barcelona', 'Catalonia, Spain'),
(7, 'Manchester City', 'Manchester, England'),
(8, 'Chelsea', 'London, England'),
(9, 'Bournemouth', 'London, England');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `club_id` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`player_id`, `player_name`, `club_id`, `is_deleted`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Mohamed Salah', '1', 0, NULL, NULL, NULL),
(2, 'Virgil Van Dijk', '1', 0, NULL, NULL, NULL),
(3, 'Antony Spin', '2', 0, NULL, NULL, NULL),
(4, 'Marcus Rashford', '2', 0, NULL, NULL, NULL),
(5, 'Radja Nainggolan', '2', 0, NULL, NULL, NULL),
(6, 'Lionel Messi', '4', 0, NULL, NULL, NULL),
(7, 'Cristiano Ronaldo', '5', 1, NULL, '2024-02-01 09:19:53', '2024-02-01 09:19:53'),
(8, 'Sadio Mane', '6', 0, NULL, NULL, NULL),
(9, 'Robert Lewandowski', '2', 0, NULL, NULL, NULL),
(10, 'Mario Balotelli', '3', 1, NULL, '2024-02-01 09:18:37', '2024-02-01 09:18:37'),
(11, 'Erling Haaland', '7', 0, NULL, NULL, NULL),
(12, 'Raheem Sterling', '8', 0, '2024-02-01 08:36:31', '2024-02-01 08:54:17', NULL),
(13, 'Ilkay Gundogan', '4', 0, '2024-02-01 08:58:26', '2024-02-01 09:18:26', NULL),
(14, 'Thomas Muller', '8', 0, '2024-02-01 09:20:50', '2024-02-01 09:22:21', NULL),
(15, 'Johnny Evans', '2', 0, '2024-02-02 04:19:07', '2024-02-02 04:19:07', NULL),
(16, 'Trent', '1', 0, '2024-02-02 04:19:57', '2024-02-02 04:19:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `player_position_relation`
--

CREATE TABLE `player_position_relation` (
  `pp_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_position_relation`
--

INSERT INTO `player_position_relation` (`pp_id`, `player_id`, `position_id`) VALUES
(3, 2, 3),
(4, 3, 10),
(5, 4, 8),
(6, 4, 9),
(7, 5, 5),
(9, 5, 7),
(10, 7, 8),
(11, 7, 9),
(13, 8, 8),
(15, 9, 9),
(16, 9, 10),
(17, 10, 5),
(18, 10, 9),
(19, 1, 9),
(21, 11, 9),
(23, 12, 10),
(24, 12, 8),
(25, 12, 13),
(27, 13, 6),
(28, 13, 7),
(29, 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`position_id`, `position_name`) VALUES
(1, 'Goalkeeper'),
(2, 'Right Back'),
(3, 'Center Back'),
(4, 'Left Back'),
(5, 'Defensive Midfielder'),
(6, 'Central Midfielder'),
(7, 'Attacking Midfielder'),
(8, 'Left Wing'),
(9, 'Striker'),
(10, 'Right Wing');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL DEFAULT 'public',
  `createdAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  `otp_code` char(6) DEFAULT NULL,
  `otp_exp` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_role`, `createdAt`, `updatedAt`, `deletedAt`, `otp_code`, `otp_exp`) VALUES
(3, 'Donnie', 'donniy@gmail.com', '$2b$10$Ml/3hYJ6KKHjA.gpApXgye3dIn4vEnCMroOnnXpHxr0g8Zkget6rK', 'public', '2024-02-02 10:23:17', '2024-02-02 10:23:17', NULL, '308213', '2024-02-02 10:27:59'),
(4, 'John', 'donniy2@gmail.com', '$2b$10$Hh.83nqSaJvnzdxYkplH/efuT1v6.VJwAQWBtW0zRNMO/akRwmI1K', 'public', '2024-02-02 09:12:58', '2024-02-02 09:12:58', NULL, NULL, NULL),
(5, 'Jambul', 'hilman_faghmi@gmail.com', '$2b$10$0Ucz8U1lgXkji5VJVd8nV.2KZ5sxELl4yauxx2xn8x4lsU6cR3X9m', 'public', '2024-02-02 09:06:28', '2024-02-02 09:06:28', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_position_relation`
--
ALTER TABLE `player_position_relation`
  ADD PRIMARY KEY (`pp_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `player_position_relation`
--
ALTER TABLE `player_position_relation`
  MODIFY `pp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
