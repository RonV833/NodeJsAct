CREATE DATABASE  IF NOT EXISTS `project_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_data`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: project_data
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `food_category_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Concombre a la Menthe (Cucumber Salad with Mint Leaves)',20,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(2,'Lyonnaise Salad',30,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(3,'Onion Galette',40,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(4,'Cheese Souffle',50,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(5,'Coquilles Saint-Jacques (Great Scallops)',60,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(6,'Olive Tapenade',25,1,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(7,'Boeuf Bourguignon (Beef Stew)',50,2,'2021-12-13 11:19:09','2021-12-17 12:48:02'),(8,'Coq Au Vin (Red Wine Chicken Stew)',120,2,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(9,'Chicken Cordon Bleu',35,2,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(10,'Duck à l’Orange',35,2,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(11,'Roasted Chicken with Herb Jus',60,2,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(12,'Bouillabaisse',70,2,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(13,'French Coconut Pie',80,3,'2021-12-13 11:19:10','2021-12-17 12:48:02'),(14,'Passion Fruit and Lemon Meringue Tartlets',90,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(15,'Pear Tart',80,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(16,'Strawberry Fraisier Chiffon Cake',70,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(17,'Profiteroles',80,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(18,'Mousse Au Chocolat',90,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(19,'Cannelés de Bordeaux',150,3,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(20,'Quiche Lorraine',70,4,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(21,'Croque Monsieur',80,4,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(22,'Croque Madame',90,4,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(23,'Jambon - Beurre',150,4,'2021-12-13 11:19:11','2021-12-17 12:48:02'),(24,'Croissant',60,4,'2021-12-13 11:19:12','2021-12-17 12:48:02'),(25,'Red Wine (Mouton Cadet Bordeaux Rouge)',300,5,'2021-12-13 11:19:12','2021-12-17 12:48:02'),(26,'White Wine (Champagne)',400,5,'2021-12-13 11:19:12','2021-12-17 12:48:02'),(27,'Mimosa',500,5,'2021-12-13 11:19:12','2021-12-17 12:48:02'),(28,'chicken pasta',130,5,'2021-12-17 14:29:06','2021-12-17 14:29:06'),(29,'chicken pasta',120,4,'2021-12-17 14:29:45','2021-12-17 14:29:45'),(30,'spicy chicken',140,2,'2021-12-17 14:38:24','2021-12-17 14:38:24'),(31,'spicy chicken',140,2,'2021-12-17 14:39:07','2021-12-17 14:39:07'),(32,'chicken skin',500,1,'2021-12-17 14:41:04','2021-12-17 14:41:04'),(34,'noodles soup',300,4,'2021-12-17 14:44:55','2021-12-17 14:44:55'),(40,'chicken skin',150,1,'2021-12-17 15:09:02','2021-12-17 15:09:02'),(42,'tinolang isda',156,2,'2021-12-17 17:50:23','2021-12-17 17:50:23'),(43,'sarsiado',250,2,'2021-12-17 17:51:13','2021-12-17 17:51:13'),(44,'sarsiado',259,1,'2021-12-17 17:52:21','2021-12-17 17:52:21'),(45,'sarsiado',124,1,'2021-12-17 17:55:27','2021-12-17 17:55:27'),(46,'tinapang bangus',250,1,'2021-12-17 17:56:29','2021-12-17 17:56:29'),(47,'tinolang manok',245,1,'2021-12-17 17:59:13','2021-12-17 17:59:13'),(48,'sarsiado',1234,1,'2021-12-17 18:00:10','2021-12-17 18:00:10'),(49,'tinapang bangus',1340,4,'2021-12-17 18:02:20','2021-12-17 18:02:20');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `register_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'ron','hello','src@gmail.com','$2b$08$1jLR9Whjvbur0Gw94YCe.OP5bP9if5dfGNWESDONPmsIjKYNkYs1O','2021-12-17 12:50:42','2021-12-17 18:25:59');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-17 20:26:32
