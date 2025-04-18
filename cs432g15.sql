-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2025 at 12:22 PM
-- Server version: 8.0.41-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs432g15`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccessPermission`
--

CREATE TABLE `AccessPermission` (
  `permission_id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  `resource` varchar(100) NOT NULL,
  `action` enum('Read','Write','Delete','manage') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AccessPermission`
--

INSERT INTO `AccessPermission` (`permission_id`, `role`, `resource`, `action`) VALUES
(1, 'Admin', 'Member', 'Delete'),
(2, 'Security', 'Gate', 'Read'),
(3, 'security', 'gates', 'manage'),
(4, 'security', 'gates', 'manage'),
(5, 'security', 'gates', 'manage'),
(6, 'security', 'gates', 'manage');

-- --------------------------------------------------------

--
-- Table structure for table `Alerts`
--

CREATE TABLE `Alerts` (
  `alert_id` int NOT NULL,
  `description` text NOT NULL,
  `severity` enum('Low','Medium','High') DEFAULT 'Medium',
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Alerts`
--

INSERT INTO `Alerts` (`alert_id`, `description`, `severity`, `timestamp`) VALUES
(1, 'Unauthorized access attempt at Main Gate', 'High', '2025-04-14 16:11:07'),
(2, 'Fire alarm triggered in Building A', 'Medium', '2025-04-14 16:11:07'),
(3, 'Unauthorized vehicle in parking area', 'High', '2025-04-15 05:11:09'),
(4, 'Unauthorized vehicle in parking area', 'High', '2025-04-16 02:11:31'),
(5, 'Unauthorized vehicle in parking area', 'High', '2025-04-16 02:23:58'),
(6, 'Unauthorized vehicle in parking area', 'High', '2025-04-16 02:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `CollageMember`
--

CREATE TABLE `CollageMember` (
  `member_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_joined` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `CollageMember`
--

INSERT INTO `CollageMember` (`member_id`, `name`, `email`, `date_joined`, `status`) VALUES
(1, 'Alice Johnson', 'alice@example.com', '2025-01-15', 'Active'),
(2, 'Bob Smith', 'bob@example.com', '2025-02-20', 'Active'),
(3, 'John Doe4', 'john4@example.com', '2025-04-14', 'Active'),
(4, 'Nandkishor kumar', 'kishor008@gmail.com', '2025-04-15', 'Active'),
(10, 'John Doe5', 'john5@example.com', '2025-04-16', 'Active'),
(11, 'John Doe6', 'john6@example.com', '2025-04-16', 'Active'),
(12, 'John Doe7', 'john7@example.com', '2025-04-16', 'Active'),
(13, 'John Doe8', 'john8@example.com', '2025-04-16', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `EntryLog`
--

CREATE TABLE `EntryLog` (
  `entry_id` int NOT NULL,
  `visitor_id` int NOT NULL,
  `gate_id` int NOT NULL,
  `entry_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `EntryLog`
--

INSERT INTO `EntryLog` (`entry_id`, `visitor_id`, `gate_id`, `entry_time`) VALUES
(1, 1, 1, '2025-04-14 16:11:07'),
(2, 2, 1, '2025-04-14 16:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `ExitLog`
--

CREATE TABLE `ExitLog` (
  `exit_id` int NOT NULL,
  `visitor_id` int NOT NULL,
  `gate_id` int NOT NULL,
  `exit_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ExitLog`
--

INSERT INTO `ExitLog` (`exit_id`, `visitor_id`, `gate_id`, `exit_time`) VALUES
(1, 1, 1, '2025-04-14 16:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `Gate`
--

CREATE TABLE `Gate` (
  `gate_id` int NOT NULL,
  `location` varchar(100) NOT NULL,
  `status` enum('Open','Closed') DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Gate`
--

INSERT INTO `Gate` (`gate_id`, `location`, `status`) VALUES
(1, 'Main Entrance', 'Open'),
(2, 'Back Gate', 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `ParkingLog`
--

CREATE TABLE `ParkingLog` (
  `log_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  `entry_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `exit_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ParkingLog`
--

INSERT INTO `ParkingLog` (`log_id`, `vehicle_id`, `entry_time`, `exit_time`) VALUES
(1, 1, '2025-04-15 08:30:00', '2025-04-15 17:00:00'),
(2, 2, '2025-04-14 16:11:07', NULL),
(3, 1, '2025-04-15 05:18:31', NULL),
(4, 1, '2025-04-16 02:44:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Portfolio`
--

CREATE TABLE `Portfolio` (
  `portfolio_id` int NOT NULL,
  `member_id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '15',
  `bio` text,
  `skills` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Portfolio`
--

INSERT INTO `Portfolio` (`portfolio_id`, `member_id`, `project_id`, `bio`, `skills`) VALUES
(1, 1, 15, 'Web Developer with 5 years of experience', '[\"Node.js\", \"SQL\", \"React\"]'),
(2, 2, 15, 'Security Specialist', '[\"Network Security\", \"Risk Assessment\"]'),
(3, 1, 15, 'Experienced web developer', '[\"JavaScript\", \"Node.js\", \"SQL\"]'),
(4, 1, 15, 'Experienced web developer', '[\"JavaScript\", \"Node.js\", \"SQL\"]'),
(5, 1, 15, 'Experienced web developer', '[\"JavaScript\", \"Node.js\", \"SQL\"]'),
(6, 2, 15, 'Experienced web developer', '[\"JavaScript\", \"Node.js\", \"SQL\", \"html\", \"css\"]');

-- --------------------------------------------------------

--
-- Table structure for table `SecurityStaff`
--

CREATE TABLE `SecurityStaff` (
  `staff_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `SecurityStaff`
--

INSERT INTO `SecurityStaff` (`staff_id`, `name`, `role`, `contact_number`) VALUES
(1, 'Mike Brown', 'Security Officer', '+91-9876543210'),
(2, 'Sarah Wilson', 'Supervisor', '+91-8765432109'),
(3, 'John Security', 'patrol', '+91-9876543210'),
(4, 'John Security', 'patrol', '+91-9876543210'),
(5, 'John Security', 'patrol', '+91-9876543210'),
(6, 'John Security', 'patrol', '+91-9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE `Vehicle` (
  `vehicle_id` int NOT NULL,
  `license_plate` varchar(20) NOT NULL,
  `member_id` int NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `registration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`vehicle_id`, `license_plate`, `member_id`, `vehicle_type`, `brand`, `model`, `color`, `registration_date`) VALUES
(1, 'MH12AB1234', 1, 'Car', 'Toyota', 'Corolla', 'Blue', '2025-03-01'),
(2, 'DL34CD5678', 2, 'Bike', 'Honda', 'Activa', 'Black', '2025-03-05'),
(4, 'MH12AB5678', 1, 'Car', 'Toyota', 'Corolla', 'Blue', NULL),
(6, 'MH12AB5671', 1, 'Car', 'Toyota', 'Corolla', 'Blue', NULL),
(8, 'MH12AB5677', 1, 'Car', 'Toyota', 'Corolla', 'Blue', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Visitor`
--

CREATE TABLE `Visitor` (
  `visitor_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `entry_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `exit_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Visitor`
--

INSERT INTO `Visitor` (`visitor_id`, `name`, `purpose`, `entry_time`, `exit_time`) VALUES
(1, 'John Doe', 'Meeting', '2025-04-15 09:00:00', '2025-04-15 10:30:00'),
(2, 'Jane Smith', 'Delivery', '2025-04-14 16:08:26', NULL),
(3, 'Alice Johnson1', 'Client Meeting', '2025-04-16 02:22:03', NULL),
(4, 'Manas kalal', 'Client Meeting', '2025-04-16 02:45:27', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccessPermission`
--
ALTER TABLE `AccessPermission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `Alerts`
--
ALTER TABLE `Alerts`
  ADD PRIMARY KEY (`alert_id`);

--
-- Indexes for table `CollageMember`
--
ALTER TABLE `CollageMember`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `EntryLog`
--
ALTER TABLE `EntryLog`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `gate_id` (`gate_id`);

--
-- Indexes for table `ExitLog`
--
ALTER TABLE `ExitLog`
  ADD PRIMARY KEY (`exit_id`),
  ADD KEY `visitor_id` (`visitor_id`),
  ADD KEY `gate_id` (`gate_id`);

--
-- Indexes for table `Gate`
--
ALTER TABLE `Gate`
  ADD PRIMARY KEY (`gate_id`);

--
-- Indexes for table `ParkingLog`
--
ALTER TABLE `ParkingLog`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD PRIMARY KEY (`portfolio_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `SecurityStaff`
--
ALTER TABLE `SecurityStaff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `license_plate` (`license_plate`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `Visitor`
--
ALTER TABLE `Visitor`
  ADD PRIMARY KEY (`visitor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AccessPermission`
--
ALTER TABLE `AccessPermission`
  MODIFY `permission_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Alerts`
--
ALTER TABLE `Alerts`
  MODIFY `alert_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `CollageMember`
--
ALTER TABLE `CollageMember`
  MODIFY `member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `EntryLog`
--
ALTER TABLE `EntryLog`
  MODIFY `entry_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ExitLog`
--
ALTER TABLE `ExitLog`
  MODIFY `exit_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Gate`
--
ALTER TABLE `Gate`
  MODIFY `gate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ParkingLog`
--
ALTER TABLE `ParkingLog`
  MODIFY `log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Portfolio`
--
ALTER TABLE `Portfolio`
  MODIFY `portfolio_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `SecurityStaff`
--
ALTER TABLE `SecurityStaff`
  MODIFY `staff_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Vehicle`
--
ALTER TABLE `Vehicle`
  MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Visitor`
--
ALTER TABLE `Visitor`
  MODIFY `visitor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EntryLog`
--
ALTER TABLE `EntryLog`
  ADD CONSTRAINT `EntryLog_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `Visitor` (`visitor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `EntryLog_ibfk_2` FOREIGN KEY (`gate_id`) REFERENCES `Gate` (`gate_id`) ON DELETE CASCADE;

--
-- Constraints for table `ExitLog`
--
ALTER TABLE `ExitLog`
  ADD CONSTRAINT `ExitLog_ibfk_1` FOREIGN KEY (`visitor_id`) REFERENCES `Visitor` (`visitor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ExitLog_ibfk_2` FOREIGN KEY (`gate_id`) REFERENCES `Gate` (`gate_id`) ON DELETE CASCADE;

--
-- Constraints for table `ParkingLog`
--
ALTER TABLE `ParkingLog`
  ADD CONSTRAINT `ParkingLog_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `Vehicle` (`vehicle_id`) ON DELETE CASCADE;

--
-- Constraints for table `Portfolio`
--
ALTER TABLE `Portfolio`
  ADD CONSTRAINT `Portfolio_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `CollageMember` (`member_id`) ON DELETE CASCADE;

--
-- Constraints for table `Vehicle`
--
ALTER TABLE `Vehicle`
  ADD CONSTRAINT `Vehicle_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `CollageMember` (`member_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
