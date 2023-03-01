-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2021 at 08:41 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hprms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admission_history`
--

CREATE TABLE `admission_history` (
  `id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `room_id` int(30) DEFAULT NULL,
  `date_admitted` datetime NOT NULL,
  `date_discharged` datetime DEFAULT NULL,
  `status` text NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admission_history`
--

INSERT INTO `admission_history` (`id`, `patient_id`, `room_id`, `date_admitted`, `date_discharged`, `status`, `date_created`, `date_updated`) VALUES
(4, 1, 1, '2021-12-29 15:00:00', '2021-12-31 15:20:00', '1', '2021-12-30 14:49:29', '2021-12-30 15:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_list`
--

CREATE TABLE `doctor_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `specialization` text NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_added` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_list`
--

INSERT INTO `doctor_list` (`id`, `fullname`, `specialization`, `email`, `contact`, `delete_flag`, `date_created`, `date_added`) VALUES
(1, 'Dr. John D Smith', 'Physical medicine and rehabilitation', 'jsmith@sample.com', '09123456789', 0, '2021-12-30 09:32:30', NULL),
(2, 'MD. Claire C Blake', 'Pediatrics, Surgery', 'cblake@sample.com', '09123789456', 0, '2021-12-30 09:33:38', NULL),
(3, 'Dr. Mark D Cooper', 'Sample only', 'mcooper@sample.com', '09456987123', 1, '2021-12-30 09:34:29', '2021-12-30 09:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `patient_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`patient_id`, `meta_field`, `meta_value`) VALUES
(1, 'firstname', 'Mark'),
(1, 'middlename', 'D'),
(1, 'lastname', 'Cooper'),
(1, 'suffix', 'II'),
(1, 'gender', 'Male'),
(1, 'dob', '1997-06-23'),
(1, 'email', 'mcooper@sample.com'),
(1, 'contact', '09123456789'),
(1, 'address', 'Over There Street, Here City, Anywhere, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `patient_history`
--

CREATE TABLE `patient_history` (
  `id` int(30) NOT NULL,
  `patient_id` int(30) NOT NULL,
  `illness` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `treatment` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `doctor_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_history`
--

INSERT INTO `patient_history` (`id`, `patient_id`, `illness`, `diagnosis`, `treatment`, `remarks`, `doctor_id`, `date_created`, `date_updated`) VALUES
(2, 1, 'Sample Illness Information', 'This is a sample diagnosis only', 'This the sample information of the treatment', 'Sample remarks', 1, '2021-12-30 13:27:27', NULL),
(4, 1, 'Sample Illness 102', 'Illness Diagnosis 102', 'Sample Treatment 102', 'Sample remarks', 2, '2021-12-30 13:55:21', '2021-12-30 13:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `patient_list`
--

CREATE TABLE `patient_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `fullname` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_list`
--

INSERT INTO `patient_list` (`id`, `code`, `fullname`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'PA-2021120001', 'COOPER II MARK D', 0, 0, '2021-12-30 12:00:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_list`
--

CREATE TABLE `room_list` (
  `id` int(30) NOT NULL,
  `room_type_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `capacity` int(5) NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_list`
--

INSERT INTO `room_list` (`id`, `room_type_id`, `name`, `description`, `capacity`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 3, 'Room-201', 'Sample Ward Room Good for 6 Patient', 6, 0, '2021-12-30 10:33:24', '2021-12-30 10:34:36'),
(2, 1, 'Room-301', 'Sample Single Bed Room', 1, 0, '2021-12-30 10:33:46', NULL),
(3, 2, 'Room-302', 'Sample 2 Bed Room', 2, 0, '2021-12-30 10:34:06', NULL),
(4, 4, 'Room-202', 'Sample Ward Good 12 Patents', 12, 0, '2021-12-30 10:35:01', NULL),
(5, 4, 'Room-303', 'Sample Deleted Room', 101, 1, '2021-12-30 10:35:19', '2021-12-30 10:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `room_type_list`
--

CREATE TABLE `room_type_list` (
  `id` int(30) NOT NULL,
  `room` text NOT NULL,
  `description` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_type_list`
--

INSERT INTO `room_type_list` (`id`, `room`, `description`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Single Room', 'Private Room with Single Patient Bed.', 0, '2021-12-30 10:05:45', NULL),
(2, '2 Bed Room', 'Private Room with 2 Bed Room.', 0, '2021-12-30 10:10:56', NULL),
(3, 'Ward 6', 'Ward Room With 6 Beds', 0, '2021-12-30 10:11:54', NULL),
(4, 'Ward 12', 'Ward Room with 12 Bed Space', 0, '2021-12-30 10:12:38', NULL),
(5, 'ward 32', 'Sample Deleted Room Type', 1, '2021-12-30 10:19:17', '2021-12-30 10:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Hospital Patient Records Management System - PHP'),
(6, 'short_name', 'HPRMS - PHP'),
(11, 'logo', 'uploads/logo-1640827546.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1640827546.png'),
(15, 'content', 'Array'),
(16, 'email', 'info@xyzhostpital.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(3, 'Claire', NULL, 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-3.png?v=1639467985', NULL, 2, 1, '2021-12-14 15:46:25', '2021-12-14 15:46:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admission_history`
--
ALTER TABLE `admission_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `doctor_list`
--
ALTER TABLE `doctor_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patient_history`
--
ALTER TABLE `patient_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `patient_list`
--
ALTER TABLE `patient_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_list`
--
ALTER TABLE `room_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indexes for table `room_type_list`
--
ALTER TABLE `room_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admission_history`
--
ALTER TABLE `admission_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_list`
--
ALTER TABLE `doctor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_history`
--
ALTER TABLE `patient_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient_list`
--
ALTER TABLE `patient_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_list`
--
ALTER TABLE `room_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `room_type_list`
--
ALTER TABLE `room_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admission_history`
--
ALTER TABLE `admission_history`
  ADD CONSTRAINT `admission_history_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `admission_history_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD CONSTRAINT `patient_details_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_history`
--
ALTER TABLE `patient_history`
  ADD CONSTRAINT `patient_history_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_history_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_list`
--
ALTER TABLE `room_list`
  ADD CONSTRAINT `room_list_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
