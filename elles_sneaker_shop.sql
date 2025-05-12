-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 12, 2025 at 05:40 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EllesSneakerShop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cap_table`
--

CREATE TABLE `cap_table` (
  `id` int UNSIGNED NOT NULL,
  `share_class_id` int UNSIGNED NOT NULL,
  `share_class_category_id` int UNSIGNED NOT NULL,
  `investor_id` int UNSIGNED NOT NULL,
  `diluted_shares` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cap_table`
--

INSERT INTO `cap_table` (`id`, `share_class_id`, `share_class_category_id`, `investor_id`, `diluted_shares`) VALUES
(1, 1, 1, 1, 50.00),
(2, 1, 2, 1, 10.00),
(3, 2, 3, 1, 89.00),
(4, 2, 4, 2, 12.00),
(5, 1, 2, 2, 13.00),
(6, 2, 3, 3, 15.00),
(7, 1, 1, 7, 11.00),
(8, 2, 4, 2, 18.00),
(10, 1, 1, 1, 103.00),
(11, 1, 1, 1, 123.00),
(12, 1, 1, 10, 100.00),
(13, 1, 1, 11, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investors`
--

INSERT INTO `investors` (`id`, `first_name`, `last_name`, `email`, `company`, `created_at`) VALUES
(1, 'FIRST ', 'INVESTOR', 'first.investor@gmail.com', 'ONE', '2023-04-06 07:25:16'),
(2, 'SECOND', 'INVESTOR', 'second.investor@gmail.com', 'TWO', '2023-04-12 07:25:16'),
(3, 'THIRD', 'INVESTOR', 'third.investor@gmail.com', 'THREE', '2023-04-18 07:25:16'),
(7, 'FOURTH', 'INVESTOR', 'fourth.investor@gmail.com', 'FOUR', '2023-04-18 07:25:16'),
(10, 'John', 'Doe', 'john.doe@example.com', 'Example Inc.', NULL),
(11, 'John', 'Doe', 'ilvana.burgic@example.com', 'Example Inc.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subscribed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `name`, `subscribed_at`) VALUES
(1, 'aa@aa.aa', NULL, '2024-04-10 02:15:46'),
(2, 'ilvana@gmail.com', NULL, '2024-04-10 02:16:24'),
(7, 'vedad@gmail.com', NULL, '2024-04-10 03:40:22'),
(11, 'edad@gmail.com', NULL, '2024-04-10 03:40:48'),
(14, 'meliha@gmail.com', NULL, '2024-04-10 03:41:32'),
(15, 'iburgic3@gmail.com', NULL, '2024-04-11 15:05:13'),
(30, 'gagaa@gmail.com', NULL, '2024-04-25 00:13:04'),
(31, 'ib@gmail.com', NULL, '2024-04-25 09:58:34'),
(32, 'hhaah@gmail.com', NULL, '2024-04-25 09:59:08'),
(33, 'nanaan@gmail.com', NULL, '2024-05-07 11:43:23'),
(34, 'user@example.com', NULL, '2024-05-09 18:25:15'),
(38, 'amela@gmail.com', NULL, '2024-06-02 16:30:39'),
(39, 'lala@gmail.com', NULL, '2024-06-02 17:41:36'),
(41, 'jaja@jaja.com', NULL, '2024-06-02 17:59:20'),
(42, 'jaja@jajga.com', NULL, '2024-06-02 18:16:20'),
(43, 'haha@gmail.com', NULL, '2024-06-02 18:43:53'),
(44, 'haha@example.com', NULL, '2024-06-02 18:58:28'),
(45, 'bvc@example.com', NULL, '2024-06-02 19:28:13'),
(47, 'bvc@gmail.com', NULL, '2024-06-02 19:28:19'),
(48, 'lalalalal@gmail.com', NULL, '2024-06-03 18:24:32'),
(49, 'bgfds@gmail.com', NULL, '2024-06-03 20:26:21'),
(50, 'dalila@gmail.com', NULL, '2024-06-05 20:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','delivered') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(6, 3, 0.00, 'pending', '2024-04-10 03:22:56', '2024-04-10 03:22:56'),
(13, 7, 0.00, 'pending', '2024-04-10 03:28:02', '2024-04-10 03:28:02'),
(14, 7, 0.00, 'pending', '2024-04-10 03:28:47', '2024-04-10 03:28:47'),
(15, 8, 0.00, 'pending', '2024-04-10 03:29:13', '2024-04-10 03:29:13'),
(16, 9, 0.00, 'pending', '2024-04-10 03:33:08', '2024-04-10 03:33:08'),
(17, 10, 0.00, 'pending', '2024-04-10 03:42:20', '2024-04-10 03:42:20'),
(18, 11, 0.00, 'pending', '2024-04-10 03:42:59', '2024-04-10 03:42:59'),
(19, 12, 0.00, 'pending', '2024-04-10 03:54:44', '2024-04-10 03:54:44'),
(20, 14, 0.00, 'pending', '2024-04-21 19:44:39', '2024-04-21 19:44:39'),
(21, 15, 0.00, 'pending', '2024-04-21 19:45:06', '2024-04-21 19:45:06'),
(22, 16, 0.00, 'pending', '2024-04-21 19:46:01', '2024-04-21 19:46:01'),
(23, 13, 0.00, 'pending', '2024-04-22 19:17:21', '2024-04-22 19:17:21'),
(24, 13, 0.00, 'pending', '2024-04-23 11:00:01', '2024-04-23 11:00:01'),
(25, 17, 0.00, 'pending', '2024-04-23 17:22:28', '2024-04-23 17:22:28'),
(26, 18, 0.00, 'pending', '2024-04-23 18:09:01', '2024-04-23 18:09:01'),
(27, 19, 0.00, 'pending', '2024-04-24 09:14:51', '2024-04-24 09:14:51'),
(28, 20, 0.00, 'pending', '2024-04-24 16:52:34', '2024-04-24 16:52:34'),
(29, 21, 0.00, 'pending', '2024-04-24 17:08:45', '2024-04-24 17:08:45'),
(30, 21, 0.00, 'pending', '2024-04-24 17:09:07', '2024-04-24 17:09:07'),
(31, 22, 0.00, 'pending', '2024-04-24 22:20:08', '2024-04-24 22:20:08'),
(32, 23, 0.00, 'pending', '2024-04-24 22:21:26', '2024-04-24 22:21:26'),
(33, 24, 0.00, 'pending', '2024-04-24 22:22:10', '2024-04-24 22:22:10'),
(34, 22, 0.00, 'pending', '2024-04-24 22:22:37', '2024-04-24 22:22:37'),
(35, 21, 0.00, 'pending', '2024-04-24 22:51:08', '2024-04-24 22:51:08'),
(36, 25, 0.00, 'pending', '2024-04-25 00:16:14', '2024-04-25 00:16:14'),
(37, 26, 0.00, 'pending', '2024-04-25 00:17:38', '2024-04-25 00:17:38'),
(38, 27, 0.00, 'pending', '2024-04-25 00:18:36', '2024-04-25 00:18:36'),
(39, 28, 0.00, 'pending', '2024-05-07 11:12:54', '2024-05-07 11:12:54'),
(40, 29, 0.00, 'pending', '2024-05-07 11:17:30', '2024-05-07 11:17:30'),
(41, 30, 0.00, 'pending', '2024-05-07 11:28:16', '2024-05-07 11:28:16'),
(42, 31, 0.00, 'pending', '2024-05-07 11:37:40', '2024-05-07 11:37:40'),
(43, 32, 0.00, 'pending', '2024-05-07 11:41:18', '2024-05-07 11:41:18'),
(44, 33, 0.00, 'pending', '2024-05-07 11:41:51', '2024-05-07 11:41:51'),
(45, 34, 0.00, 'pending', '2024-05-07 11:48:40', '2024-05-07 11:48:40'),
(46, 35, 0.00, 'pending', '2024-05-07 11:49:24', '2024-05-07 11:49:24'),
(47, 36, 0.00, 'pending', '2024-05-07 11:49:54', '2024-05-07 11:49:54'),
(48, 37, 0.00, 'pending', '2024-05-08 13:31:19', '2024-05-08 13:31:19'),
(49, 38, 0.00, 'pending', '2024-05-08 13:31:50', '2024-05-08 13:31:50'),
(50, 38, 0.00, 'pending', '2024-05-08 13:32:13', '2024-05-08 13:32:13'),
(51, 30, 0.00, 'pending', '2024-05-08 13:33:04', '2024-05-08 13:33:04'),
(52, 13, 314.98, 'pending', '2024-05-11 22:38:31', '2024-05-11 22:38:31'),
(53, 42, 314.98, 'pending', '2024-05-11 22:40:07', '2024-05-11 22:40:07'),
(54, 43, 0.00, 'pending', '2024-05-11 22:40:38', '2024-05-11 22:40:38'),
(55, 40, 154.99, 'pending', '2024-06-02 16:27:50', '2024-06-02 16:27:50'),
(56, 44, 0.00, 'pending', '2024-06-02 17:41:14', '2024-06-02 17:41:14'),
(57, 44, 0.00, 'pending', '2024-06-02 17:57:32', '2024-06-02 17:57:32'),
(58, 1, 0.00, 'pending', '2024-06-02 17:58:26', '2024-06-02 17:58:26'),
(59, 44, 0.00, 'pending', '2024-06-02 18:16:09', '2024-06-02 18:16:09'),
(60, 1, 0.00, 'pending', '2024-06-02 18:22:15', '2024-06-02 18:22:15'),
(61, 1, 0.00, 'pending', '2024-06-02 18:22:28', '2024-06-02 18:22:28'),
(62, 1, 100.00, 'pending', '2024-06-02 18:24:29', '2024-06-02 18:24:29'),
(63, 1, 100.00, 'pending', '2024-06-02 18:25:59', '2024-06-02 18:25:59'),
(64, 1, 100.00, 'pending', '2024-06-02 18:26:45', '2024-06-02 18:26:45'),
(65, 1, 0.00, 'pending', '2024-06-02 18:27:06', '2024-06-02 18:27:06'),
(66, 6, 0.00, 'pending', '2024-06-02 18:29:22', '2024-06-02 18:29:22'),
(67, 1, 225.99, 'pending', '2024-06-02 18:29:56', '2024-06-02 18:29:56'),
(68, 1, 225.99, 'pending', '2024-06-02 18:42:14', '2024-06-02 18:42:14'),
(69, 1, 225.99, 'pending', '2024-06-02 18:58:18', '2024-06-02 18:58:18'),
(70, 1, 225.99, 'pending', '2024-06-02 19:28:34', '2024-06-02 19:28:34'),
(71, 1, 225.99, 'pending', '2024-06-03 18:24:15', '2024-06-03 18:24:15'),
(72, 13, 229.99, 'pending', '2024-06-03 20:26:03', '2024-06-03 20:26:03'),
(73, 47, 162.99, 'pending', '2024-06-06 13:37:33', '2024-06-06 13:37:33');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price_at_time_of_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price_at_time_of_order`, `created_at`) VALUES
(15, 26, 13, 269.99, '2024-04-23 18:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `brand`, `image`, `price`, `color`) VALUES
(13, 'NIKE Air Max 95', 'Their iconic design draws inspiration from Japanese bullet trains, while refreshed colors and sharp details keep their look modern and fresh. Full-length Nike Air cushioning lets you move in first-class comfort. Mesh and synthetic materials on the upper maintain a fluid look, adding comfort and durability. Originally designed to provide good running performance, the full-length Nike Air unit perfectly unites maximum comfort and sporty style. The foam midsole is elastic and light. The rubber sole provides excellent grip and durability to these sneakers.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CK7/CK7070-001/images/thumbs_900/CK7070-001_900_900px.jpg', '269.99', 'Black'),
(14, 'NIKE Dunk', 'Nike Dunk Low children\'s lifestyle sneakers are an indispensable part of your style. This basketball icon from the mid-80s returns with an extremely durable construction and original colors. Genuine and synthetic leather uppers are durable and deliver a classic feel. The full-length rubber outsole provides durable traction and features a pattern similar to the original. With ankle padding and a grippy rubber sole, this is a nail-biter.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ2/FQ2431-001/images/thumbs_900/FQ2431-001_900_900px.jpg', '184.99', 'Black'),
(22, 'NIKE Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FZ0/FZ0549-600/images/thumbs_900/FZ0549-600_900_900px.jpg', '229.00', 'Green'),
(23, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ4/FQ4296-100/images/thumbs_900/FQ4296-100_900_900px.jpg', '259.00', 'Blue'),
(24, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0788-001/images/thumbs_900/DV0788-001_900_900px.jpg', '229.00', 'Black'),
(25, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CW2/CW2288-111/images/thumbs_900/CW2288-111_900_900px.jpg', '229.00', 'White'),
(35, 'Air Max', 'The Nike Air Max is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB2/FB2877-301/images/thumbs_900/FB2877-301_1_900_900px.jpg.webp', '111.00', 'Green'),
(36, 'Air Force', 'The Nike Force is a lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4146-105/images/thumbs_900/FJ4146-105_900_900px.jpg.webp', '234.00', 'Orange'),
(37, 'Adidas Gazelle', 'The Adidas Gazelle provides unmatched comfort, with its Boost cushioning technology offering incredible energy return. This running shoe is designed to keep you comfortable all day while providing support and style.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/JH9/JH9666/images/thumbs_900/JH9666_900_900px.jpg.webp', '180.00', 'Pink'),
(38, 'Puma Palermo', 'The Puma Palermo combines a retro running look with modern elements, creating a sporty style that stands out from the crowd. With lightweight cushioning and a sleek design, it\'s perfect for both sports and casual wear.', 'Puma', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/401/401679-02/images/thumbs_900/401679-02_900_900px.jpg.webp', '119.99', 'Red'),
(39, 'Adidas Samba', 'The Adidas Samba offers next-level comfort and responsiveness, featuring Boost technology for enhanced energy return. With a breathable upper and sleek design, it\'s perfect for both running and daily wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IE9/IE9182/images/thumbs_900/IE9182_900_900px.jpg.webp', '180.00', 'Blue'),
(40, 'Puma RS-X', 'The Puma RS-X is a bold, oversized sneaker that makes a statement with its futuristic design. The RS-X features bold color blocking and an innovative cushioning system, perfect for everyday wear.', 'Puma', 'https://www.sportvision.ba/files/thumbs/files/images/slike_proizvoda/media/398/398203-01/images/thumbs_350/398203-01_350_350px.jpg', '110.00', 'White'),
(41, 'Adidas Special', 'The Adidas Special is a high-performance sneaker with a modern twist, featuring responsive Boost cushioning and a sleek, minimalist design. It’s built for comfort and style, making it perfect for everyday wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF6/IF6561/images/thumbs_900/IF6561_900_900px.jpg.webp', '130.00', 'Pink'),
(56, 'Nike Full Force', 'The Nike Full Force provides unmatched comfort, with its Boost cushioning technology offering incredible energy return. This running shoe is designed to keep you comfortable all day while providing support and style.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB1/FB1362-103/images/thumbs_900/FB1362-103_900_900px.jpg.webp', '180.00', 'Yellow'),
(57, 'Puma Karmen', 'The Puma Karmen combines a fancy look with modern elements, creating a casual style that stands out from the crowd. With lightweight cushioning and a sleek design, it\'s perfect for both night-outs  and casual wear.', 'Puma', 'https://www.sportvision.ba/files/thumbs/files/images/slike_proizvoda/media/397/397461-12/images/thumbs_600/397461-12_600_600px.jpg', '119.99', 'White'),
(60, 'Adidas Special', 'The Adidas Special is a high-performance sneaker with a modern twist, featuring responsive Boost cushioning and a sleek, minimalist design. It’s built for comfort and style, making it perfect for everyday wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/JH5/JH5438/images/thumbs_900/JH5438_900_900px.jpg.webp', '130.00', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `share_classes`
--

CREATE TABLE `share_classes` (
  `id` int UNSIGNED NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equity_main_currency` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  `authorized_assets` decimal(20,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `share_classes`
--

INSERT INTO `share_classes` (`id`, `description`, `equity_main_currency`, `price`, `authorized_assets`) VALUES
(1, 'FIRST_CLASS', 'USD', 12.000000, 500000000000.000),
(2, 'SECOND_CLASS', 'USD', 29.000000, 100000000000.000);

-- --------------------------------------------------------

--
-- Table structure for table `share_class_categories`
--

CREATE TABLE `share_class_categories` (
  `id` int UNSIGNED NOT NULL,
  `share_class_id` int UNSIGNED NOT NULL,
  `description` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `share_class_categories`
--

INSERT INTO `share_class_categories` (`id`, `share_class_id`, `description`) VALUES
(1, 1, 'CATEGORY_1'),
(2, 1, 'CATEGORY_2'),
(3, 2, 'CATEGORY_3'),
(4, 2, 'CATEGORY_4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, NULL, 'user@example.com', 'password123', '2025-05-07 17:54:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cap_table`
--
ALTER TABLE `cap_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_share_class_id` (`share_class_id`),
  ADD KEY `fk_share_class_category_id` (`share_class_category_id`),
  ADD KEY `fk_investor_id` (`investor_id`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_items_ibfk_1` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_classes`
--
ALTER TABLE `share_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_class_categories`
--
ALTER TABLE `share_class_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_share_class` (`share_class_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cap_table`
--
ALTER TABLE `cap_table`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `share_classes`
--
ALTER TABLE `share_classes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `share_class_categories`
--
ALTER TABLE `share_class_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cap_table`
--
ALTER TABLE `cap_table`
  ADD CONSTRAINT `fk_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`),
  ADD CONSTRAINT `fk_share_class_category_id` FOREIGN KEY (`share_class_category_id`) REFERENCES `share_class_categories` (`id`),
  ADD CONSTRAINT `fk_share_class_id` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `share_class_categories`
--
ALTER TABLE `share_class_categories`
  ADD CONSTRAINT `fk_share_class` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
