-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2021 at 08:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emall`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` varchar(10) NOT NULL,
  `total` int(11) NOT NULL,
  `user_email_fk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
('bags090', 'Bags'),
('beauty050', 'Beauty Shop'),
('cloth010', 'Clothing'),
('elect030', 'Electronics '),
('foot020', 'Foot Wear'),
('jewel070', 'Jewelry Shop'),
('super080', 'Super Shop'),
('watch040', 'Watches');

-- --------------------------------------------------------

--
-- Table structure for table `child_category`
--

CREATE TABLE `child_category` (
  `child_cat_id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sub_cat_id_fk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `color_id` varchar(10) NOT NULL,
  `value` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `order_address` varchar(100) NOT NULL,
  `state` varchar(15) NOT NULL,
  `user_email_fk` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_attribute`
--

CREATE TABLE `order_attribute` (
  `date` date NOT NULL,
  `product_id_fk` varchar(10) NOT NULL,
  `shop_id_fk` varchar(10) NOT NULL,
  `cart_id_fk` varchar(10) NOT NULL,
  `order_id_fk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `product_category` varchar(10) NOT NULL,
  `image1` blob NOT NULL,
  `image2` blob NOT NULL,
  `image3` blob NOT NULL,
  `discount` int(11) NOT NULL,
  `shop_id_fk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id_fk` varchar(10) NOT NULL,
  `color_id_fk` varchar(10) NOT NULL,
  `size_id_fk` varchar(10) NOT NULL,
  `child_cat_id_fk` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `shop_id` varchar(10) NOT NULL,
  `shop_name` varchar(20) NOT NULL,
  `category_id_fk` varchar(10) NOT NULL,
  `logo` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop_parent`
--

CREATE TABLE `shop_parent` (
  `email` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `NID` int(16) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `number` int(11) NOT NULL,
  `password` varchar(16) NOT NULL,
  `type` varchar(10) NOT NULL,
  `shop_id_fk` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `size_id` varchar(10) NOT NULL,
  `value` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_cat_id` varchar(10) NOT NULL,
  `category_id_fk` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_cat_id`, `category_id_fk`, `name`) VALUES
('0110', 'cloth010', 'Men\'s Clothing'),
('0120', 'cloth010', 'Women\'s Clothing'),
('0210', 'foot020', 'Women\'s Footwear'),
('0220', 'foot020', 'Men\'s Footwear'),
('0310', 'elect030', 'Phones'),
('0320', 'elect030', 'Laptop'),
('0330', 'elect030', 'Desktop'),
('0340', 'elect030', 'Camera'),
('0350', 'elect030', 'Refrigerator'),
('0360', 'elect030', 'TV'),
('0410', 'watch040', 'Men\'s Watch'),
('0420', 'watch040', 'Women\'s Watch'),
('0430', 'watch040', 'Kid\'s Watch'),
('0510', 'beauty050', 'Makeup'),
('0520', 'beauty050', 'Beauty Tools'),
('0530', 'beauty050', 'Hair Care'),
('0540', 'beauty050', 'Fragrance'),
('0550', 'beauty050', 'Skin Care'),
('0560', 'beauty050', 'Men\'s Product'),
('0710', 'jewel070', 'Gold'),
('0720', 'jewel070', 'Silver'),
('0730', 'jewel070', 'Diamond'),
('0810', 'super080', 'Indulge'),
('0820', 'super080', 'Fruit and Vegetable'),
('0830', 'super080', 'Fish and Meat'),
('0840', 'super080', 'Food and Grocery'),
('0850', 'super080', 'Households Essential'),
('0860', 'super080', 'Personal Care'),
('0870', 'super080', 'Pet Care'),
('0880', 'super080', 'Fashion'),
('0910', 'bags090', 'Women\'s Bags'),
('0920', 'bags090', 'Men\'s Bags'),
('0930', 'bags090', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_email_fk` (`user_email_fk`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `child_category`
--
ALTER TABLE `child_category`
  ADD PRIMARY KEY (`child_cat_id`),
  ADD KEY `sub_cat_id_fk` (`sub_cat_id_fk`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_email_fk` (`user_email_fk`);

--
-- Indexes for table `order_attribute`
--
ALTER TABLE `order_attribute`
  ADD KEY `cart_id_fk` (`cart_id_fk`),
  ADD KEY `order_id_fk` (`order_id_fk`),
  ADD KEY `product_id_fk` (`product_id_fk`),
  ADD KEY `shop_id_fk` (`shop_id_fk`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `shop_id_fk` (`shop_id_fk`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD KEY `product_attribute_ibfk_1` (`color_id_fk`),
  ADD KEY `size_id_fk` (`size_id_fk`),
  ADD KEY `product_id_fk` (`product_id_fk`),
  ADD KEY `child_cat_id_fk` (`child_cat_id_fk`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`shop_id`),
  ADD KEY `category_id_fk` (`category_id_fk`);

--
-- Indexes for table `shop_parent`
--
ALTER TABLE `shop_parent`
  ADD PRIMARY KEY (`email`),
  ADD KEY `shop_id_fk` (`shop_id_fk`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_cat_id`),
  ADD KEY `catagory_id_fk` (`category_id_fk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_email_fk`) REFERENCES `user` (`email`);

--
-- Constraints for table `child_category`
--
ALTER TABLE `child_category`
  ADD CONSTRAINT `child_category_ibfk_1` FOREIGN KEY (`sub_cat_id_fk`) REFERENCES `sub_category` (`sub_cat_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_email_fk`) REFERENCES `user` (`email`);

--
-- Constraints for table `order_attribute`
--
ALTER TABLE `order_attribute`
  ADD CONSTRAINT `order_attribute_ibfk_1` FOREIGN KEY (`cart_id_fk`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `order_attribute_ibfk_2` FOREIGN KEY (`order_id_fk`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_attribute_ibfk_3` FOREIGN KEY (`product_id_fk`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `order_attribute_ibfk_4` FOREIGN KEY (`shop_id_fk`) REFERENCES `shop` (`shop_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`shop_id_fk`) REFERENCES `shop` (`shop_id`);

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`color_id_fk`) REFERENCES `color` (`color_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`size_id_fk`) REFERENCES `size` (`size_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `product_attribute_ibfk_3` FOREIGN KEY (`product_id_fk`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `product_attribute_ibfk_4` FOREIGN KEY (`child_cat_id_fk`) REFERENCES `child_category` (`child_cat_id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`category_id_fk`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `shop_parent`
--
ALTER TABLE `shop_parent`
  ADD CONSTRAINT `shop_parent_ibfk_1` FOREIGN KEY (`shop_id_fk`) REFERENCES `shop` (`shop_id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`category_id_fk`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
