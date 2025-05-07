-- MySQL dump 10.13  Distrib 8.3.0, for macos14 (arm64)
--
-- Host: localhost    Database: EllesSneakerShop
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cap_table`
--

DROP TABLE IF EXISTS `cap_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cap_table` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int unsigned NOT NULL,
  `share_class_category_id` int unsigned NOT NULL,
  `investor_id` int unsigned NOT NULL,
  `diluted_shares` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_share_class_id` (`share_class_id`),
  KEY `fk_share_class_category_id` (`share_class_category_id`),
  KEY `fk_investor_id` (`investor_id`),
  CONSTRAINT `fk_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`),
  CONSTRAINT `fk_share_class_category_id` FOREIGN KEY (`share_class_category_id`) REFERENCES `share_class_categories` (`id`),
  CONSTRAINT `fk_share_class_id` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cap_table`
--

LOCK TABLES `cap_table` WRITE;
/*!40000 ALTER TABLE `cap_table` DISABLE KEYS */;
INSERT INTO `cap_table` VALUES (1,1,1,1,50.00),(2,1,2,1,10.00),(3,2,3,1,89.00),(4,2,4,2,12.00),(5,1,2,2,13.00),(6,2,3,3,15.00),(7,1,1,7,11.00),(8,2,4,2,18.00),(10,1,1,1,103.00),(11,1,1,1,123.00),(12,1,1,10,100.00),(13,1,1,11,100.00);
/*!40000 ALTER TABLE `cap_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investors`
--

DROP TABLE IF EXISTS `investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investors`
--

LOCK TABLES `investors` WRITE;
/*!40000 ALTER TABLE `investors` DISABLE KEYS */;
INSERT INTO `investors` VALUES (1,'FIRST ','INVESTOR','first.investor@gmail.com','ONE','2023-04-06 07:25:16'),(2,'SECOND','INVESTOR','second.investor@gmail.com','TWO','2023-04-12 07:25:16'),(3,'THIRD','INVESTOR','third.investor@gmail.com','THREE','2023-04-18 07:25:16'),(7,'FOURTH','INVESTOR','fourth.investor@gmail.com','FOUR','2023-04-18 07:25:16'),(10,'John','Doe','john.doe@example.com','Example Inc.',NULL),(11,'John','Doe','ilvana.burgic@example.com','Example Inc.',NULL);
/*!40000 ALTER TABLE `investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subscribed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

LOCK TABLES `newsletter_subscribers` WRITE;
/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
INSERT INTO `newsletter_subscribers` VALUES (1,'aa@aa.aa',NULL,'2024-04-10 02:15:46'),(2,'ilvana@gmail.com',NULL,'2024-04-10 02:16:24'),(7,'vedad@gmail.com',NULL,'2024-04-10 03:40:22'),(11,'edad@gmail.com',NULL,'2024-04-10 03:40:48'),(14,'meliha@gmail.com',NULL,'2024-04-10 03:41:32'),(15,'iburgic3@gmail.com',NULL,'2024-04-11 15:05:13'),(30,'gagaa@gmail.com',NULL,'2024-04-25 00:13:04'),(31,'ib@gmail.com',NULL,'2024-04-25 09:58:34'),(32,'hhaah@gmail.com',NULL,'2024-04-25 09:59:08'),(33,'nanaan@gmail.com',NULL,'2024-05-07 11:43:23'),(34,'user@example.com',NULL,'2024-05-09 18:25:15'),(38,'amela@gmail.com',NULL,'2024-06-02 16:30:39'),(39,'lala@gmail.com',NULL,'2024-06-02 17:41:36'),(41,'jaja@jaja.com',NULL,'2024-06-02 17:59:20'),(42,'jaja@jajga.com',NULL,'2024-06-02 18:16:20'),(43,'haha@gmail.com',NULL,'2024-06-02 18:43:53'),(44,'haha@example.com',NULL,'2024-06-02 18:58:28'),(45,'bvc@example.com',NULL,'2024-06-02 19:28:13'),(47,'bvc@gmail.com',NULL,'2024-06-02 19:28:19'),(48,'lalalalal@gmail.com',NULL,'2024-06-03 18:24:32'),(49,'bgfds@gmail.com',NULL,'2024-06-03 20:26:21'),(50,'dalila@gmail.com',NULL,'2024-06-05 20:40:55');
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price_at_time_of_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_items_ibfk_1` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (15,26,13,269.99,'2024-04-23 18:09:01');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','delivered') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,3,0.00,'pending','2024-04-10 03:22:56','2024-04-10 03:22:56'),(13,7,0.00,'pending','2024-04-10 03:28:02','2024-04-10 03:28:02'),(14,7,0.00,'pending','2024-04-10 03:28:47','2024-04-10 03:28:47'),(15,8,0.00,'pending','2024-04-10 03:29:13','2024-04-10 03:29:13'),(16,9,0.00,'pending','2024-04-10 03:33:08','2024-04-10 03:33:08'),(17,10,0.00,'pending','2024-04-10 03:42:20','2024-04-10 03:42:20'),(18,11,0.00,'pending','2024-04-10 03:42:59','2024-04-10 03:42:59'),(19,12,0.00,'pending','2024-04-10 03:54:44','2024-04-10 03:54:44'),(20,14,0.00,'pending','2024-04-21 19:44:39','2024-04-21 19:44:39'),(21,15,0.00,'pending','2024-04-21 19:45:06','2024-04-21 19:45:06'),(22,16,0.00,'pending','2024-04-21 19:46:01','2024-04-21 19:46:01'),(23,13,0.00,'pending','2024-04-22 19:17:21','2024-04-22 19:17:21'),(24,13,0.00,'pending','2024-04-23 11:00:01','2024-04-23 11:00:01'),(25,17,0.00,'pending','2024-04-23 17:22:28','2024-04-23 17:22:28'),(26,18,0.00,'pending','2024-04-23 18:09:01','2024-04-23 18:09:01'),(27,19,0.00,'pending','2024-04-24 09:14:51','2024-04-24 09:14:51'),(28,20,0.00,'pending','2024-04-24 16:52:34','2024-04-24 16:52:34'),(29,21,0.00,'pending','2024-04-24 17:08:45','2024-04-24 17:08:45'),(30,21,0.00,'pending','2024-04-24 17:09:07','2024-04-24 17:09:07'),(31,22,0.00,'pending','2024-04-24 22:20:08','2024-04-24 22:20:08'),(32,23,0.00,'pending','2024-04-24 22:21:26','2024-04-24 22:21:26'),(33,24,0.00,'pending','2024-04-24 22:22:10','2024-04-24 22:22:10'),(34,22,0.00,'pending','2024-04-24 22:22:37','2024-04-24 22:22:37'),(35,21,0.00,'pending','2024-04-24 22:51:08','2024-04-24 22:51:08'),(36,25,0.00,'pending','2024-04-25 00:16:14','2024-04-25 00:16:14'),(37,26,0.00,'pending','2024-04-25 00:17:38','2024-04-25 00:17:38'),(38,27,0.00,'pending','2024-04-25 00:18:36','2024-04-25 00:18:36'),(39,28,0.00,'pending','2024-05-07 11:12:54','2024-05-07 11:12:54'),(40,29,0.00,'pending','2024-05-07 11:17:30','2024-05-07 11:17:30'),(41,30,0.00,'pending','2024-05-07 11:28:16','2024-05-07 11:28:16'),(42,31,0.00,'pending','2024-05-07 11:37:40','2024-05-07 11:37:40'),(43,32,0.00,'pending','2024-05-07 11:41:18','2024-05-07 11:41:18'),(44,33,0.00,'pending','2024-05-07 11:41:51','2024-05-07 11:41:51'),(45,34,0.00,'pending','2024-05-07 11:48:40','2024-05-07 11:48:40'),(46,35,0.00,'pending','2024-05-07 11:49:24','2024-05-07 11:49:24'),(47,36,0.00,'pending','2024-05-07 11:49:54','2024-05-07 11:49:54'),(48,37,0.00,'pending','2024-05-08 13:31:19','2024-05-08 13:31:19'),(49,38,0.00,'pending','2024-05-08 13:31:50','2024-05-08 13:31:50'),(50,38,0.00,'pending','2024-05-08 13:32:13','2024-05-08 13:32:13'),(51,30,0.00,'pending','2024-05-08 13:33:04','2024-05-08 13:33:04'),(52,13,314.98,'pending','2024-05-11 22:38:31','2024-05-11 22:38:31'),(53,42,314.98,'pending','2024-05-11 22:40:07','2024-05-11 22:40:07'),(54,43,0.00,'pending','2024-05-11 22:40:38','2024-05-11 22:40:38'),(55,40,154.99,'pending','2024-06-02 16:27:50','2024-06-02 16:27:50'),(56,44,0.00,'pending','2024-06-02 17:41:14','2024-06-02 17:41:14'),(57,44,0.00,'pending','2024-06-02 17:57:32','2024-06-02 17:57:32'),(58,1,0.00,'pending','2024-06-02 17:58:26','2024-06-02 17:58:26'),(59,44,0.00,'pending','2024-06-02 18:16:09','2024-06-02 18:16:09'),(60,1,0.00,'pending','2024-06-02 18:22:15','2024-06-02 18:22:15'),(61,1,0.00,'pending','2024-06-02 18:22:28','2024-06-02 18:22:28'),(62,1,100.00,'pending','2024-06-02 18:24:29','2024-06-02 18:24:29'),(63,1,100.00,'pending','2024-06-02 18:25:59','2024-06-02 18:25:59'),(64,1,100.00,'pending','2024-06-02 18:26:45','2024-06-02 18:26:45'),(65,1,0.00,'pending','2024-06-02 18:27:06','2024-06-02 18:27:06'),(66,6,0.00,'pending','2024-06-02 18:29:22','2024-06-02 18:29:22'),(67,1,225.99,'pending','2024-06-02 18:29:56','2024-06-02 18:29:56'),(68,1,225.99,'pending','2024-06-02 18:42:14','2024-06-02 18:42:14'),(69,1,225.99,'pending','2024-06-02 18:58:18','2024-06-02 18:58:18'),(70,1,225.99,'pending','2024-06-02 19:28:34','2024-06-02 19:28:34'),(71,1,225.99,'pending','2024-06-03 18:24:15','2024-06-03 18:24:15'),(72,13,229.99,'pending','2024-06-03 20:26:03','2024-06-03 20:26:03'),(73,47,162.99,'pending','2024-06-06 13:37:33','2024-06-06 13:37:33');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (13,'NIKE Air Max 95','Their iconic design draws inspiration from Japanese bullet trains, while refreshed colors and sharp details keep their look modern and fresh. Full-length Nike Air cushioning lets you move in first-class comfort. Mesh and synthetic materials on the upper maintain a fluid look, adding comfort and durability. Originally designed to provide good running performance, the full-length Nike Air unit perfectly unites maximum comfort and sporty style. The foam midsole is elastic and light. The rubber sole provides excellent grip and durability to these sneakers.','Nike','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CK7/CK7070-001/images/thumbs_900/CK7070-001_900_900px.jpg','269.99'),(14,'NIKE Dunk','Nike Dunk Low children\'s lifestyle sneakers are an indispensable part of your style. This basketball icon from the mid-80s returns with an extremely durable construction and original colors. Genuine and synthetic leather uppers are durable and deliver a classic feel. The full-length rubber outsole provides durable traction and features a pattern similar to the original. With ankle padding and a grippy rubber sole, this is a nail-biter.','Nike','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ2/FQ2431-001/images/thumbs_900/FQ2431-001_900_900px.jpg','184.99'),(22,'NIKE Air Force 1 \'07','The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.','Nike','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FZ0/FZ0549-600/images/thumbs_900/FZ0549-600_900_900px.jpg','229.00'),(23,'Nike Air Force 1 \'07','The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.','NIKE','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FQ4/FQ4296-100/images/thumbs_900/FQ4296-100_900_900px.jpg','259.00'),(24,'Nike Air Force 1 \'07','The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.\n\nClassic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.','NIKE','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/DV0/DV0788-001/images/thumbs_900/DV0788-001_900_900px.jpg','229.00'),(25,'Nike Air Force 1 \'07','The Nike Air Force 1 \'07 is a men\'s lifestyle sneaker that is comfortable, durable and a timeless classic - and for good reason.Classic \'80s construction is paired with contrasting colors for style that follows whether you\'re on the court or on the go. Stitched overlays on the leather upper add durability and heritage style. Originally designed for professional basketball players, these sneakers feature Nike Air cushioning that adds lightweight, all-day comfort. The low-cut silhouette adds a clean, streamlined look.','NIKE','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/CW2/CW2288-111/images/thumbs_900/CW2288-111_900_900px.jpg','229.00'),(35,'wfgfdsa','sdfgfd','NIKE','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB2/FB2877-301/images/thumbs_900/FB2877-301_1_900_900px.jpg.webp','$$111'),(36,'234312423','2343234','NIKE','https://www.buzzsneakers.ba/files/thumbs/files/images/slike-proizvoda/media/FB2/FB2877-301/images/thumbs_900/FB2877-301_2_900_900px.jpg.webp','$$234323');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_class_categories`
--

DROP TABLE IF EXISTS `share_class_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_class_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `share_class_id` int unsigned NOT NULL,
  `description` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_share_class` (`share_class_id`),
  CONSTRAINT `fk_share_class` FOREIGN KEY (`share_class_id`) REFERENCES `share_classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_class_categories`
--

LOCK TABLES `share_class_categories` WRITE;
/*!40000 ALTER TABLE `share_class_categories` DISABLE KEYS */;
INSERT INTO `share_class_categories` VALUES (1,1,'CATEGORY_1'),(2,1,'CATEGORY_2'),(3,2,'CATEGORY_3'),(4,2,'CATEGORY_4');
/*!40000 ALTER TABLE `share_class_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share_classes`
--

DROP TABLE IF EXISTS `share_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share_classes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equity_main_currency` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,6) DEFAULT NULL,
  `authorized_assets` decimal(20,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share_classes`
--

LOCK TABLES `share_classes` WRITE;
/*!40000 ALTER TABLE `share_classes` DISABLE KEYS */;
INSERT INTO `share_classes` VALUES (1,'FIRST_CLASS','USD',12.000000,500000000000.000),(2,'SECOND_CLASS','USD',29.000000,100000000000.000);
/*!40000 ALTER TABLE `share_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user@example.com','password123','2025-05-07 17:54:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-07 21:02:21
