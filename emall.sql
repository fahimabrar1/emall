-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2021 at 03:42 PM
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
  `user_email_fk` varchar(30) NOT NULL,
  `product_id_fk` varchar(10) DEFAULT NULL
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

--
-- Dumping data for table `child_category`
--

INSERT INTO `child_category` (`child_cat_id`, `name`, `sub_cat_id_fk`) VALUES
('1110', 'T-shirt', '0110'),
('1120', 'Shirt', '0110'),
('1130', 'Jacket', '0110'),
('1140', 'Pants', '0110'),
('1150', 'Panjabi', '0110'),
('1210', 'Kamiz', '0120'),
('1220', 'Kurti', '0120'),
('1230', 'Sweater', '0120'),
('1240', 'Saree', '0120'),
('1250', 'Pants/Jeans', '0120'),
('2110', 'Sandals', '0210'),
('2120', 'Flats', '0210'),
('2130', 'High heels', '0220'),
('2140', 'Sneakers', '0210'),
('2210', 'Casual Shoes', '0220'),
('2220', 'Sneakers', '0220'),
('2230', 'Men\'s Sandals', '0220'),
('2240', 'Loafers', '0220'),
('2250', 'Boots', '0220'),
('3110', 'Smartphone', '0310'),
('3120', 'Feature Phone', '0310'),
('3210', 'Laptop and Notebook', '0320'),
('3220', 'Mac book', '0320'),
('3230', 'Gaming Laptop', '0320'),
('3310', 'All-In-One', '0330'),
('3320', 'Gaming Desktop', '0330'),
('3410', 'DSLR', '0340'),
('3420', 'Security Camera', '0340'),
('3430', 'Car Camera', '0340'),
('3440', 'Compact Camera', '0340'),
('3510', 'Side by Side Ref', '0350'),
('3520', 'Top Freezer', '0350'),
('3530', 'Bottom Freezer', '0350'),
('3540', 'Wide Freezer', '0350'),
('3610', 'Smart TV', '0360'),
('3620', 'LED TV', '0360'),
('3630', 'Other', '0360'),
('4110', 'Digital Watches', '0410'),
('4120', 'Dual display watches', '0410'),
('4130', 'Sports Watches', '0410'),
('4210', 'Bracelet Watches', '0420'),
('4220', 'Elegant Watches', '0420'),
('4230', 'Sports Watches', '0420'),
('4310', 'Digital Watches', '0430'),
('5110', 'Face', '0510'),
('5120', 'Lips', '0510'),
('5130', 'Eye', '0510'),
('5210', 'Hair Dryer', '0520'),
('5220', 'Curling Irons', '0520'),
('5230', 'Makeup Brush', '0520'),
('5240', 'Nail Dryer', '0520'),
('5310', 'Shampoo', '0530'),
('5320', 'Hair treatment', '0530'),
('5330', 'Brushes and Combs', '0530'),
('5410', 'Women\'s Fragrances', '0540'),
('5420', 'Men\'s Fragrances', '0540'),
('5510', 'Face', '0550'),
('5520', 'Eye', '0550'),
('5530', 'Body', '0550'),
('5610', 'Shaving and grooming', '0560'),
('5620', 'Skin Care', '0560'),
('5630', 'Deodorants', '0560'),
('5640', 'Hair care', '0560'),
('7110', 'Ring', '0710'),
('7120', 'Bracelet', '0710'),
('7130', 'Bridal Set', '0710'),
('7160', 'Chain', '0710'),
('7170', 'Necklace ', '0710'),
('7180', 'Churi', '0710'),
('7210', 'Ring', '0720'),
('7220', 'Bracelet', '0720'),
('7230', 'Bridal Set', '0720'),
('7260', 'Chain', '0720'),
('7270', 'Necklace', '0720'),
('7280', 'Churi', '0720'),
('7310', 'Ring', '0730'),
('7320', 'Bracelet', '0730'),
('7370', 'Necklace', '0730'),
('8110', 'Bread', '0810'),
('8120', 'Cookies', '0810'),
('8210', 'Local Fruits', '0820'),
('8220', 'Imported Fruits', '0820'),
('8230', 'Local Vegetables', '0820'),
('8240', 'Imported Vegetables', '0820'),
('8310', 'Fresh Fish', '0830'),
('8320', 'Frozen Fish', '0830'),
('8330', 'Beef', '0830'),
('8340', 'Mutton', '0830'),
('8350', 'Chicken', '0830'),
('8410', 'Dairy', '0840'),
('8420', 'Frozen and Canned', '0840'),
('8430', 'Grains food', '0840'),
('8440', 'Snacks', '0840'),
('8450', 'Sauces and Spices', '0840'),
('8460', 'Chocolates', '0840'),
('8470', 'Beverage', '0840'),
('8480', 'Edible oil and ghee', '0840'),
('8490', 'Baking Needs', '0840'),
('8510', 'Home Decor', '0850'),
('8520', 'Tools Equipment', '0850'),
('8530', 'Gardening tools', '0850'),
('8540', 'Household Essential', '0850'),
('8550', 'Kitchen', '0850'),
('8560', 'Cleaning supplies', '0850'),
('8610', 'Shampoo and Haircare', '0860'),
('8620', 'Toothpaste', '0860'),
('8630', 'Facial Care', '0860'),
('8640', 'Bath and Body', '0860'),
('8650', 'Cosmetic', '0860'),
('8660', 'Skin care', '0860'),
('8670', 'Hair Dryer', '0860'),
('8710', 'Pet food', '0870'),
('8720', 'Pet Accessories', '0870'),
('8810', 'Man', '0880'),
('8820', 'Women', '0880'),
('8830', 'Kids', '0880'),
('9110', 'Stylish Backpacks', '0910'),
('9120', 'Shoulder Bags', '0910'),
('9130', 'Wallets', '0910'),
('9210', 'Men\'s Backpacks', '0920'),
('9220', 'Luggage', '0920'),
('9230', 'Wallets', '0920'),
('9240', 'Briefcase', '0920'),
('9310', 'Kids Bag', '0930'),
('9320', 'Passport Cover', '0930'),
('9340', 'Cosmetic Bags', '0930');

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
  `product_category` varchar(100) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `discount` int(10) NOT NULL,
  `shop_id_fk` varchar(10) NOT NULL,
  `date_added` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `description`, `price`, `product_category`, `image1`, `image2`, `image3`, `discount`, `shop_id_fk`, `date_added`) VALUES
('a1', 'panjabi', 'Soft cotton panjabi', 1700, 'Clothing', '/images/a1.jpg', '', '', 0, 'shop2', '2021-08-16'),
('a2', 'Salwar Kameez', 'white and orange shaded cotton Salwar Kameez', 2300, 'Clothing', '/image/a2.jpg', '', '', 300, 'shop2', '2021-08-16'),
('a3', 'Panjani kameez set', 'White colored cotton cloths ', 6000, 'Clothing', '/image/a3.jpg', '', '', 500, 'shop2', '2021-08-16'),
('ap1', 'Macbook pro', 'MacBook Pro 13″· 13.3-inch Retina display· Apple M1 chip. Also available with. Intel Core i5 or i7 processor', 109000, 'Electronics', '/image/ap1.jpeg', '', '', 0, 'shop10', '2021-07-25'),
('ap2', 'Macbook Air', 'Macbook Air 13 M1 2021- 8GB|256GB|7-Core GPU', 105900, 'Electronics', '/image/ap2.jpeg', '', '', 0, 'shop10', '2021-07-25'),
('ap3', 'iPhone 12', '64GB,12MP+12MP,Front(Dual):12MPiOS 14.1, upgradable Li-Ion 2815 mAh, Non-removable', 117000, 'Electronics', '/image/ap3.jpg', '', '', 0, 'shop10', '2021-07-25'),
('ap4', 'Smart Watch', 'Apple Watch SE (MYDN2LL/A) GPS 40mm Sport Band (Gold, Aluminum, Pink Sand)', 30000, 'Electronics', '/image/ap4.jpg', '', '', 0, 'shop10', '2021-07-25'),
('ap5', 'iPhone 11', '128GB,12MP+12MP, Front(Dual): 12MPiOS 14.1, upgradable Li-Ion 2815 mAh, Non-removable', 93000, 'Electronics', '/image/ap5.jpeg', '', '', 0, 'shop10', '2021-07-25'),
('apx1', 'Air Boost Sneakers', 'Olive color, air boost durable unisex sneakers  ', 2400, 'Footwear', '/image/apx1.jpeg', '', '', 0, 'shop5', '2021-07-30'),
('apx2', 'Hills', 'Pink color 3-inch hills for women', 2800, 'Footwear', '/image/apx2.jpeg', '', '', 0, 'shop5', '2021-07-30'),
('apx3', 'Shoes', 'Original black leather shoes foe men', 3500, 'Footwear', '/image/apx3.jpeg', '/image/apx4.jpg', '', 100, 'shop5', '2021-07-30'),
('b1', 'Shoe', 'durable unique shoes ', 2900, 'Footwear', '/images/b1.jpg', '', '', 0, 'shop4', '2021-08-04'),
('b2', 'Kid\'s shoe', 'multi colored shoes for kids', 1450, 'Footwear', '/images/b2.jpg', '/images/b3.jpg', '', 0, 'shop4', '2021-08-04'),
('sa1', 'Saree', 'soft cotton black and white saree', 2000, 'Clothing', '/images/sa1.jpg', '', '', 0, 'shop3', '2021-08-04'),
('sa2', 'Men\'s Panjabi', 'Soft cotton full black Panjabi for men', 2000, 'Clothing', '/image/sa2.jpg', '', '', 0, 'shop3', '2021-08-04'),
('sa3', 'Kameez', 'Soft cotton black Kameez', 1700, 'Clothing', '/image/sa3.jpg', '', '', 0, 'shop3', '2021-08-04'),
('ti1', 'Belt watch', 'Brown belted watch for men', 4000, 'Watches', '/image/ti1.jpg', '', '', 0, 'shop7', '2021-08-06'),
('ti2', 'Chain watch', 'golden chained watch', 7500, 'Watches', '/image/ti2.jpg', '', '', 0, 'shop7', '2021-08-06'),
('ti3', 'Women unique watch', 'Unique women hand watch', 8500, 'Watches', '/image/ti3.jpeg', '', '', 0, 'shop7', '2021-08-06'),
('ti4', 'Olive belt watch', 'Multi colored belt watch for both men and women', 5500, 'Watches', '/image/ti4.jpeg', '', '', 0, 'shop7', '2021-08-06'),
('tim1', 'Men\'s Watch', 'Brown belt unique watch', 15000, 'Watches', '/image/tim1.jpeg', '', '', 0, 'shop6', '2021-07-28'),
('tim2', 'Chain Watch', 'Golden chai, black center hand watch', 18000, 'Watches', '/image/tim2.jpeg', '', '', 0, 'shop6', '2021-07-28'),
('tim3', 'Belt watch', 'multi colored belt unisex watch', 8000, 'Watches', '/image/tim3.jpeg', '', '', 0, 'shop6', '2021-07-28'),
('w1', 'Micro Oven', 'Microwave, grill & combination, 3 combination cooking options, 1200 Watts, 20 L', 30000, 'Electronics', '/image/w1.jpg', '', '', 5000, 'shop9', '2021-08-16'),
('w2', 'Refrigerator', '50ltr bottom freezer. ', 50000, 'Electronics', '/image/w2.jpg', '', '', 5000, 'shop9', '2021-08-16'),
('w3', 'Air Conditioner', '5275 Watts,(1.5 ton) AC', 45000, 'Electronics', '/image/w3.jpg', '', '', 3000, 'shop9', '2021-08-16'),
('w5', 'Motorbike', '125cc, Walton runner', 150000, 'Vehicle', '/image/w5.jpg', '', '', 0, 'shop9', '2021-08-16'),
('whi1', 'Refrigerator', '80ltr Wide french door refrigerator', 100000, 'Electronics', '/image/whi1.jpeg', '', '', 2000, 'shop8', '2021-07-30'),
('whi2', 'Microwave Oven', 'Whirlpool Magic cook 30 BC 30 L Convection Microwave Oven, multifunction, stainless steel cavity', 25000, 'Electronics', '/image/whi2.jpeg', '', '', 0, 'shop8', '2021-07-30'),
('whi3', 'Air conditioner', '5300 WATTS(1800BTU/hr), 2ton AC', 85000, 'Electronics', '/image/whi3.jpeg', '', '', 2000, 'shop8', '2021-08-09'),
('Y1', 'polo T-shirt', '100% cotton. breathable meterial.', 500, 'Clothing', '/images/y1.jpg', '', '', 0, 'shop1', '2021-08-09'),
('Y2', 'Yellow Saree', 'Yellow georgette saree .', 6500, 'Clothing', '/images/y2.jpg', '', '', 0, 'shop1', '2021-08-09');

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
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`shop_id`, `shop_name`, `category_id_fk`, `logo`) VALUES
('shop1', 'Yellow', 'cat2', '/logos/shop1.jpg'),
('shop10', 'iphone', 'cat2', '/logo/shop10.jpg'),
('shop2', 'Anjans', 'cat2', '/logos/shop2.jpg'),
('shop3', 'Sadakalo', 'cat2', '/logos/shop3.jpg'),
('shop4', 'Bata', 'cat2', '/logos/shop4.jpg'),
('shop5', 'Apex', 'cat2', '/logos/shop5.jpg'),
('shop6', 'Time Zone', 'cat2', '/logos/shop6.jpg'),
('shop7', 'Titan', 'cat2', '/logos/shop7.jpg'),
('shop8', 'Whirpool', 'cat2', '/logos/shop8.jpg'),
('shop9', 'Walton', 'cat2', '/logos/shop9.jpg');

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
  `password` varchar(200) NOT NULL,
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
  `category_id_fk` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL
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
  ADD KEY `user_email_fk` (`user_email_fk`),
  ADD KEY `product_id_fk` (`product_id_fk`);

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
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_email_fk`) REFERENCES `user` (`email`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id_fk`) REFERENCES `product` (`product_id`);

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
