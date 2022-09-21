-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 21, 2022 at 05:50 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodics`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `varient_id` int(10) NOT NULL,
  `variation` text COLLATE utf8_unicode_ci,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `shipping_cost` double(20,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci,
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double(20,2) NOT NULL DEFAULT '0.00',
  `code` mediumtext COLLATE utf8_unicode_ci,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT '0',
  `delivery_viewed` int(1) NOT NULL DEFAULT '1',
  `payment_status_viewed` int(1) DEFAULT '1',
  `commission_calculated` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `seller_id`, `shipping_address`, `delivery_status`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'Demo address', 'pending', NULL, NULL, NULL, NULL, 0.00, NULL, 1663580719, 0, 1, 1, 0, '2022-09-19 04:15:19', '2022-09-19 04:15:19'),
(2, 1, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663580762, 0, 1, 1, 0, '2022-09-19 04:16:02', '2022-09-19 04:16:02'),
(3, 1, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663581256, 0, 1, 1, 0, '2022-09-19 04:24:16', '2022-09-19 04:24:16'),
(4, 1, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663581507, 0, 1, 1, 0, '2022-09-19 04:28:27', '2022-09-19 04:28:27'),
(5, 1, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663735769, 0, 1, 1, 0, '2022-09-20 23:19:29', '2022-09-20 23:19:29'),
(6, 1, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663735808, 0, 1, 1, 0, '2022-09-20 23:20:08', '2022-09-20 23:20:08'),
(7, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736658, 0, 1, 1, 0, '2022-09-20 23:34:18', '2022-09-20 23:34:18'),
(8, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736762, 0, 1, 1, 0, '2022-09-20 23:36:02', '2022-09-20 23:36:02'),
(9, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736786, 0, 1, 1, 0, '2022-09-20 23:36:26', '2022-09-20 23:36:26'),
(10, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736832, 0, 1, 1, 0, '2022-09-20 23:37:12', '2022-09-20 23:37:12'),
(11, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736895, 0, 1, 1, 0, '2022-09-20 23:38:15', '2022-09-20 23:38:15'),
(12, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736925, 0, 1, 1, 0, '2022-09-20 23:38:45', '2022-09-20 23:38:45'),
(13, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663736968, 0, 1, 1, 0, '2022-09-20 23:39:28', '2022-09-20 23:39:28'),
(14, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663737191, 0, 1, 1, 0, '2022-09-20 23:43:11', '2022-09-20 23:43:11'),
(15, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663737249, 0, 1, 1, 0, '2022-09-20 23:44:09', '2022-09-20 23:44:09'),
(16, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663737307, 0, 1, 1, 0, '2022-09-20 23:45:07', '2022-09-20 23:45:07'),
(17, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663737406, 0, 1, 1, 0, '2022-09-20 23:46:46', '2022-09-20 23:46:46'),
(18, 2, NULL, NULL, 'Demo address', 'pending', NULL, '1', NULL, NULL, 0.00, NULL, 1663737424, 0, 1, 1, 0, '2022-09-20 23:47:04', '2022-09-20 23:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` double(20,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-19 04:16:02', '2022-09-19 04:16:02'),
(2, 3, 0, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-19 04:24:16', '2022-09-19 04:24:16'),
(3, 4, 0, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-19 04:28:28', '2022-09-19 04:28:28'),
(4, 6, 1, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-20 23:20:08', '2022-09-20 23:20:08'),
(5, 6, 1, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-20 23:20:08', '2022-09-20 23:20:08'),
(6, 7, 1, 1, '10', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-20 23:34:19', '2022-09-20 23:34:19'),
(7, 7, 1, 2, '20', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-20 23:34:19', '2022-09-20 23:34:19'),
(8, 18, 1, 1, '20', 130.00, 0.00, 0.00, 1, '1', 'pending', NULL, NULL, NULL, '2022-09-20 23:47:04', '2022-09-20 23:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `photos` text,
  `thumbnail_img` text,
  `description` longtext,
  `unit_price` double(20,2) DEFAULT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT '1',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = On, 0 = Off',
  `unit` varchar(20) NOT NULL,
  `min_qty` int(11) NOT NULL DEFAULT '1',
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(20) DEFAULT NULL,
  `shipping_cost` double(20,2) NOT NULL,
  `meta_title` mediumtext,
  `meta_description` longtext,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `user_id`, `photos`, `thumbnail_img`, `description`, `unit_price`, `purchase_price`, `published`, `cash_on_delivery`, `unit`, `min_qty`, `discount`, `discount_type`, `shipping_cost`, `meta_title`, `meta_description`, `tax`, `tax_type`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'burger', 1, '', '', 'burger', 100.00, 80.00, 1, 1, '-5', 1, NULL, NULL, 0.00, 'burger', 'burger', NULL, NULL, '2022-09-16 10:45:32', '2022-09-20 23:47:04', 1, 1),
(2, 'Pizza Burger', 1, NULL, NULL, NULL, NULL, 100.00, 1, 1, '19', 1, NULL, NULL, 0.00, 'Pizza Burger', '', NULL, NULL, '2022-09-19 23:51:57', '2022-09-20 23:34:19', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
CREATE TABLE IF NOT EXISTS `product_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `variant` varchar(200) NOT NULL,
  `price` double(20,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `added_unit` int(10) NOT NULL,
  `reminder` tinyint(1) NOT NULL,
  `image` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `updated_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `user_id`, `variant`, `price`, `quantity`, `added_unit`, `reminder`, `image`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 'Beef', 50.00, 3990, 2000, 1, '', '2022-09-16 10:46:35', '2022-09-21 04:54:44', 1, 1),
(2, 1, 1, 'Cheese', 50.00, 4000, 2000, 1, '', '2022-09-16 10:47:44', '2022-09-21 04:54:48', 1, 1),
(3, 1, 1, 'Onion', 50.00, 5000, 2000, 1, '', '2022-09-16 10:48:18', '2022-09-21 04:54:57', 1, 1),
(4, 2, 1, 'chees', 50.00, 20, 40, 0, NULL, '2022-09-20 08:38:26', '2022-09-21 05:17:35', 0, 0),
(5, 2, 1, 'chicken', 50.00, 40, 40, 1, NULL, '2022-09-20 08:39:57', '2022-09-21 05:27:52', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_loggedin` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT '0.00',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `name`, `email`, `is_loggedin`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(1, 'seller', 'Mr. Seller', 'seller@foodics.local', 1, '2022-09-19 05:30:08', NULL, NULL, '$2y$10$4QJwbDHsdWVnDW8ua2ZoquOatLuofean5t5uXylK3Cdh4XWC3UxgK', NULL, '', NULL, 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, NULL, NULL, NULL, '2022-09-19 05:23:33', '2022-09-19 01:08:43'),
(2, 'customer', 'demo', 'vivekjain.dev@gmail.com', 0, '2022-09-19 11:41:34', NULL, NULL, '$2y$10$4QJwbDHsdWVnDW8ua2ZoquOatLuofean5t5uXylK3Cdh4XWC3UxgK', NULL, NULL, NULL, 'Demo address', 'INDIA', 'DM', '641642', '91457986', 0.00, 0, NULL, NULL, 0, '2022-09-19 11:48:47', '2022-09-21 05:03:57');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
