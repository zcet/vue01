-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2026 at 11:06 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstName`, `lastName`, `phone`, `username`, `password`) VALUES
(00000001, 'สมชาย', 'ใจดี', '0812345678', 'somchai', 'pass1234'),
(00000002, 'วิภา', 'สุขสันต์', '0898765432', 'wipa', 'wipa2025'),
(00000003, 'John', 'Doe', '0991122334', 'johnd', 'securepwd'),
(00000004, 'เอก', 'เอกเอก', '000-000-0000', 'mm', '$2y$10$njGkhHhJ5VSXv'),
(00000005, 'aSDFGHJ', 'SFGJ', '542343453', 'GFSDGFD', '$2y$10$1laJj4P7913i8M8aArRDAOFj8d44JnlwKAy28hOIEEn6DAkAyCfq2'),
(00000006, 'มานะ', 'เด็กดี', '038756921', 'mana', '1234'),
(00000007, 'มานี', 'ใจดี', '038756901', 'manees', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `full_name`, `department`, `salary`, `active`, `image`, `created_at`) VALUES
(0000000001, 'สมชาย ใจดี', 'เทคโนโลยี', '35000.00', 1, '1771149435_download (1).jpg', '2026-01-18 10:24:11'),
(0000000002, 'สมหญิง ดีงาม', 'เทคโนโลยี', '28000.00', 1, '1771149426_images.png', '2026-01-18 10:24:11'),
(0000000003, 'อนันต์ สุขใจ', 'บุคคล', '25000.00', 0, '1771149418_download (1).jpg', '2026-01-18 10:24:11'),
(0000000004, 'สุดา พรมดี', 'ทรัพยากรบุคคล', '32000.00', 1, '1771149406_images.png', '2026-01-18 10:24:11'),
(0000000005, 'ศิรปภา', 'เทคโนโลยี', '20000.00', 1, '1771149395_download (1).jpg', '2026-01-25 09:46:44'),
(0000000006, 'ddds', 'sdsds', '969696.00', 1, '1771149005_images.png', '2026-01-25 10:34:56'),
(0000000007, 'aaa', 'it', '900000.00', 0, '1771148984_download (1).jpg', '2026-01-25 12:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `image`, `stock`, `created_at`) VALUES
(00000000004, 'เสื้อยืดคอกลม', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', '199.00', '1771143980_ChatGPT Image Feb 15, 2026, 09_09_06 AM.png', 50, '2026-01-25 11:48:08'),
(00000000005, 'กางเกงยีนส์', 'กางเกงยีนส์ทรงกระบอก สีฟ้าอ่อน', '799.00', 'jeans.jpg', 30, '2026-01-25 11:48:08'),
(00000000006, 'รองเท้าผ้าใบ', 'รองเท้าผ้าใบสีขาว ใส่ได้ทุกโอกาส', '1299.00', 'sneakers.jpg', 30, '2026-01-25 11:48:08'),
(00000000007, 'hoodie', 'hoodie', '1300.00', '1771144582_S__15974404-removebg-preview.png', 100, '2026-02-15 08:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) UNSIGNED ZEROFILL NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `first_name`, `last_name`, `phone`, `email`) VALUES
(00000000001, 'John', 'Doe', '0812345678', 'john.doe@example.com'),
(00000000002, 'Jane', 'Smith', '0819876543', 'jane.smith@example.com'),
(00000000003, 'Michael', 'Brown', '0823456789', 'michael.brown@example.com'),
(00000000004, 'Emily', 'Johnson', '0834567890', 'emily.johnson@example.com'),
(00000000005, 'Chris', 'Williams', '0845678901', 'chris.williams@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`) VALUES
(1, 'เครื่องเขียน'),
(2, 'เครื่องใช้ไฟฟ้า'),
(3, 'เสื้อกันหนาว'),
(4, 'กางเกงขายาว');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
