-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2023 at 07:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `sts_db`
CREATE DATABASE sts_db;
USE sts_db;
--

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` bigint(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `name`, `contact`, `status`, `delete_flag`, `created_at`, `updated_at`) VALUES
(1, '20230124-0001', 'John Smith', '09123564789', 1, 0, '2023-01-24 10:10:01', NULL),
(2, '20230124-0002', 'Mark Cooper', '0956421389', 1, 0, '2023-01-24 10:13:34', NULL),
(3, '20230124-0003', 'Samantha Lou', '09231546789', 1, 0, '2023-01-24 10:13:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` bigint(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `code`, `name`, `description`, `price`, `status`, `delete_flag`, `created_at`, `updated_at`) VALUES
(1, '123456', 'Product 101', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu pulvinar mauris, quis volutpat libero.', 355.19, 1, 0, '2023-01-24 09:31:41', '2023-01-24 09:51:47'),
(2, '1235462', 'Product 102', 'Mauris euismod, nisl nec pretium scelerisque, mauris magna mollis metus, vitae suscipit quam lorem id mauris.', 275.87, 1, 0, '2023-01-24 09:46:38', NULL),
(3, '879564', 'Product 103', 'Nunc ut velit et lacus porttitor aliquet ac in mi. Morbi nec tempor odio, eget dignissim mi. Nam a lorem gravida metus lacinia congue sed eget lectus.', 1001.89, 1, 0, '2023-01-24 09:47:35', NULL),
(4, '1', 'test', 'test', 123.00, 1, 1, '2023-01-24 09:53:18', '2023-01-24 09:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(30) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `client_id` bigint(30) DEFAULT NULL,
  `notes` text NOT NULL,
  `total` float(12,2) NOT NULL DEFAULT 0.00,
  `tendered` float(12,2) NOT NULL DEFAULT 0.00,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(30) DEFAULT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_code`, `client_id`, `notes`, `total`, `tendered`, `is_guest`, `user_id`, `delete_flag`, `created_at`, `updated_at`) VALUES
(1, '2023012400001', NULL, '', 355.19, 500.00, 1, 1, 0, '2023-01-24 13:46:15', '2023-01-24 14:33:07'),
(2, '2023012400002', NULL, '', 275.87, 300.00, 1, 1, 0, '2023-01-24 13:47:56', NULL),
(3, '2023012400003', 2, '', 986.25, 1000.00, 0, 1, 0, '2023-01-24 13:49:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` bigint(30) NOT NULL,
  `sales_id` bigint(30) NOT NULL,
  `product_id` bigint(30) NOT NULL,
  `price` float(12,2) NOT NULL DEFAULT 0.00,
  `quantity` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `sales_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 1, 355.19, 1),
(2, 2, 2, 275.87, 1),
(5, 3, 2, 275.87, 1),
(6, 3, 1, 355.19, 2);

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
(1, 'name', 'Sales Tracker System - PHP'),
(6, 'short_name', 'STS - PHP'),
(11, 'logo', 'uploads/logo.png?v=1674522890'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png?v=1674522844'),
(17, 'phone', '456-987-1231'),
(18, 'mobile', '09123456987 / 094563212222 '),
(19, 'email', 'info@musicschool.com'),
(20, 'address', 'Here St, Down There City, Anywhere Here, 2306 -updated');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='2';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', '', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-05-16 14:17:49'),
(2, 'John', 'D', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatars/2.png?v=1653715045', NULL, 2, '2022-05-28 13:17:24', '2022-05-28 13:17:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_client_id_fk` (`client_id`),
  ADD KEY `sales_user_id_fk` (`user_id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_item_sale_id_fk` (`sales_id`),
  ADD KEY `sales_item_product_id_fk` (`product_id`);

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
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `sales_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `sales_item_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `sales_item_sale_id_fk` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;
