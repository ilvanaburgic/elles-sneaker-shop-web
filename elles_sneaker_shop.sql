-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 13, 2025 at 09:10 PM
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `brand`, `image`, `price`, `color`, `gender`) VALUES
(13, 'NIKE Air Max 95', 'Their iconic design draws inspiration from Japanese bullet trains, while refreshed colors and sharp details keep their look modern and fresh. Full-length Nike Air cushioning lets you move in first-class comfort. Mesh and synthetic materials on the upper maintain a fluid look, adding comfort and durability. Originally designed to provide good running performance, the full-length Nike Air unit perfectly unites maximum comfort and sporty style. The foam midsole is elastic and light. The rubber sole provides excellent grip and durability to these sneakers.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CK7/CK7070-001/images/thumbs_900/CK7070-001_900_900px.jpg', '269.99', 'Black', 'Males'),
(14, 'NIKE Dunk', 'Nike Dunk Low children\'s lifestyle sneakers are an indispensable part of your style. This basketball icon from the mid-80s returns with an extremely durable construction and original colors. Genuine and synthetic leather uppers are durable and deliver a classic feel. The full-length rubber outsole provides durable traction and features a pattern similar to the original. With ankle padding and a grippy rubber sole, this is a nail-biter.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ2/FQ2431-001/images/thumbs_900/FQ2431-001_900_900px.jpg', '184.99', 'Black', 'Males'),
(22, 'NIKE Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FZ0/FZ0549-600/images/thumbs_900/FZ0549-600_900_900px.jpg', '229.00', 'Green', 'Unisex'),
(23, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ4/FQ4296-100/images/thumbs_900/FQ4296-100_900_900px.jpg', '259.00', 'Blue', 'Unisex'),
(24, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0788-001/images/thumbs_900/DV0788-001_900_900px.jpg', '229.00', 'Black', 'Males'),
(25, 'Nike Air Force 1 \'07', 'The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CW2/CW2288-111/images/thumbs_900/CW2288-111_900_900px.jpg', '229.00', 'White', 'Unisex'),
(35, 'Air Max', 'The Nike Air Max is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB2/FB2877-301/images/thumbs_900/FB2877-301_1_900_900px.jpg.webp', '111.00', 'Green', 'Males'),
(36, 'Air Force', 'The Nike Force is a lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FJ4/FJ4146-105/images/thumbs_900/FJ4146-105_900_900px.jpg.webp', '234.00', 'Orange', 'Unisex'),
(37, 'Adidas Gazelle', 'The Adidas Gazelle provides unmatched comfort, with its Boost cushioning technology offering incredible energy return. This running shoe is designed to keep you comfortable all day while providing support and style.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/JH9/JH9666/images/thumbs_900/JH9666_900_900px.jpg.webp', '180.00', 'Pink', 'Females'),
(38, 'Puma Palermo', 'The Puma Palermo combines a retro running look with modern elements, creating a sporty style that stands out from the crowd. With lightweight cushioning and a sleek design, it\'s perfect for both sports and casual wear.', 'Puma', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/401/401679-02/images/thumbs_900/401679-02_900_900px.jpg.webp', '119.99', 'Red', 'Females'),
(39, 'Adidas Samba', 'The Adidas Samba offers next-level comfort and responsiveness, featuring Boost technology for enhanced energy return. With a breathable upper and sleek design, it\'s perfect for both running and daily wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IE9/IE9182/images/thumbs_900/IE9182_900_900px.jpg.webp', '180.00', 'Blue', 'Unisex'),
(40, 'Puma RS-X', 'The Puma RS-X is a bold, oversized sneaker that makes a statement with its futuristic design. The RS-X features bold color blocking and an innovative cushioning system, perfect for everyday wear.', 'Puma', 'https://www.sportvision.ba/files/thumbs/files/images/slike_proizvoda/media/398/398203-01/images/thumbs_350/398203-01_350_350px.jpg', '110.00', 'White', 'Females'),
(41, 'Adidas Special', 'The Adidas Special is a high-performance sneaker with a modern twist, featuring responsive Boost cushioning and a sleek, minimalist design. It’s built for comfort and style, making it perfect for everyday wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/IF6/IF6561/images/thumbs_900/IF6561_900_900px.jpg.webp', '98.00', 'Pink', 'Females'),
(56, 'Nike Full Force', 'The Nike Full Force provides unmatched comfort, with its Boost cushioning technology offering incredible energy return. This running shoe is designed to keep you comfortable all day while providing support and style.', 'Nike', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB1/FB1362-103/images/thumbs_900/FB1362-103_900_900px.jpg.webp', '48.00', 'Yellow', 'Males'),
(57, 'Puma Karmen', 'The Puma Karmen combines a fancy look with modern elements, creating a casual style that stands out from the crowd. With lightweight cushioning and a sleek design, it\'s perfect for both night-outs  and casual wear.', 'Puma', 'https://www.sportvision.ba/files/thumbs/files/images/slike_proizvoda/media/397/397461-12/images/thumbs_600/397461-12_600_600px.jpg', '119.99', 'White', 'Females'),
(60, 'Adidas Special', 'The Adidas Special is a high-performance sneaker with a modern twist, featuring responsive Boost cushioning and a sleek, minimalist design. It’s built for comfort and style, making it perfect for everyday wear.', 'Adidas', 'https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/JH5/JH5438/images/thumbs_900/JH5438_900_900px.jpg.webp', '130.00', 'Green', 'Males');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
