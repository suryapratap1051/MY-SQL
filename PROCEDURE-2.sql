-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2021 at 08:51 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learn_vern`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`) VALUES
(1, 'Meet', 'meet@mail.com'),
(2, 'Shubham', 'shubham@mail.com'),
(3, 'Jigar', 'jigar@mail.com'),
(4, 'Kishan', 'kishan@mail.com'),
(5, 'Mukul', 'mukul@mail.com'),
(6, 'Shraddha', 'shraddha@mail.com'),
(7, 'Deval', 'deval@mail.com'),
(8, 'Alpesh', 'alpesh@mail.com'),
(9, 'Jignesh', 'jignesh@mail.com'),
(10, 'Keval', 'keval@mail.com'),
(11, 'Maulik', 'maulik@mail.com'),
(12, 'Richa', 'richa@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `m1` int(11) NOT NULL,
  `m2` int(11) NOT NULL,
  `m3` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `name`, `m1`, `m2`, `m3`, `total`) VALUES
(1, 'Meet', 50, 20, 30, 60),
(2, 'Parth', 60, 70, 20, 150),
(3, 'Shubham', 100, 200, 100, 400);

--
-- Triggers `marks`
--
DELIMITER $$
CREATE TRIGGER `marks_trigger` BEFORE INSERT ON `marks` FOR EACH ROW BEGIN SET 
new.total = new.m1+new.m2+new.m3;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `amount` double(8,2) NOT NULL,
  `cust_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `amount`, `cust_id`) VALUES
(7, '2021-02-10', 500.00, 1),
(8, '2021-02-01', 1000.00, 2),
(9, '2021-01-10', 750.00, NULL),
(10, '2021-03-12', 1500.00, 8),
(11, '2021-03-26', 1750.00, 5),
(12, '2021-02-03', 19500.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(10) UNSIGNED NOT NULL,
  `prod_code` char(4) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 99999.99
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_code`, `name`, `quantity`, `price`) VALUES
(101, 'MARK', 'Blue Marker', 500, '10.55'),
(102, 'MARK', 'RED MARKER', 1500, '8.33'),
(103, 'PENC', 'Pencil 2B', 1458, '5.25'),
(104, 'MARK', 'Black Marker', 300, '15.00'),
(105, 'PENC', 'Pencil 2H', 2540, '7.80'),
(106, 'PENC', 'Pencil HB', 0, '99999.99'),
(107, 'PEN', 'Ink Pen', 25, '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `fname` varchar(33) NOT NULL,
  `lname` varchar(33) NOT NULL,
  `class` varchar(11) NOT NULL,
  `age` int(10) UNSIGNED NOT NULL,
  `marks` float(2,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `class`, `age`, `marks`) VALUES
(1, 'Meet', 'Shah', 'CE', 22, 0.99),
(2, 'Smit', 'Shah', 'EE', 22, 0.99),
(3, 'Shubham', 'Gupta', 'EC', 25, 0.99),
(4, 'Keval', 'Gajjar', 'CE', 35, 0.99),
(5, 'Jigar', 'Darji', 'EE', 22, 0.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class` (`class`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
