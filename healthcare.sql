-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: healthcare
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `id_condition` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `condicion` varchar(64) NOT NULL,
  `symptoms` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deadly` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (1,'Condition A','Symptom A','Description A',0),(2,'Condition B','Symptom B','Description B',1),(3,'Condition C','Symptom C','Description C',0),(4,'Condition D','Symptom D','Description D',1),(5,'Condition E','Symptom E','Description E',0),(6,'Condition F','Symptom F','Description F',1);
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conspiraciones`
--

DROP TABLE IF EXISTS `conspiraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conspiraciones` (
  `id_consp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id_consp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conspiraciones`
--

LOCK TABLES `conspiraciones` WRITE;
/*!40000 ALTER TABLE `conspiraciones` DISABLE KEYS */;
INSERT INTO `conspiraciones` VALUES (1,'Cheamtrails','Humo Avion'),(2,'No-Covid','No covid'),(3,'Iluminatis','Todo es 33');
/*!40000 ALTER TABLE `conspiraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnoses` (
  `id_diagnosis` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `diagnosis` text NOT NULL,
  `datetime` datetime NOT NULL,
  `id_doctor` int(10) unsigned DEFAULT NULL,
  `id_user` int(10) unsigned DEFAULT NULL,
  `id_condition` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_diagnosis`),
  KEY `id_doctor` (`id_doctor`),
  KEY `id_user` (`id_user`),
  KEY `id_condition` (`id_condition`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id_doctor`),
  CONSTRAINT `diagnoses_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `diagnoses_ibfk_3` FOREIGN KEY (`id_condition`) REFERENCES `conditions` (`id_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,'Cagarrinas','2023-05-03 13:00:00',1,1,1),(2,'Cancer','2023-05-03 13:00:00',1,1,1),(3,'Fimosis','2023-05-03 13:00:00',1,1,1),(4,'Gripe alonistican','2023-05-03 13:00:00',1,1,1);
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id_doctor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `doctor` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Dr. John Doe'),(2,'Dr. Jane Doe');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `id_medicine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `medicine` varchar(192) DEFAULT NULL,
  `cost` decimal(9,2) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_medicine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Medicine A',10.00,20.00),(2,'Medicine B',20.00,30.00),(3,'Medicine C',30.00,40.00),(4,'Medicine D',40.00,50.00);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `num_medicina`
--

DROP TABLE IF EXISTS `num_medicina`;
/*!50001 DROP VIEW IF EXISTS `num_medicina`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `num_medicina` AS SELECT
 1 AS `id_diagnosis`,
  1 AS `cantidad_medicinas` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatments` (
  `id_treatment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_diagnosis` bigint(20) unsigned DEFAULT NULL,
  `id_medicine` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_treatment`),
  KEY `id_diagnosis` (`id_diagnosis`),
  KEY `id_medicine` (`id_medicine`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`id_diagnosis`) REFERENCES `diagnoses` (`id_diagnosis`),
  CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`id_medicine`) REFERENCES `medicines` (`id_medicine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `treatments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consp`
--

DROP TABLE IF EXISTS `user_consp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consp` (
  `id_user_consp` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_consp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user_consp`),
  KEY `id_user` (`id_user`),
  KEY `id_consp` (`id_consp`),
  CONSTRAINT `user_consp_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `user_consp_ibfk_2` FOREIGN KEY (`id_consp`) REFERENCES `conspiraciones` (`id_consp`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consp`
--

LOCK TABLES `user_consp` WRITE;
/*!40000 ALTER TABLE `user_consp` DISABLE KEYS */;
INSERT INTO `user_consp` VALUES (6,1,2),(8,1,3);
/*!40000 ALTER TABLE `user_consp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `password_hash_md5` varchar(128) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user1','password1','password_hash_md5_1','John','Doe','johndoe@example.com','1990-01-01'),(2,'user2','password2','password_hash_md5_2','Jane','Doe','janedoe@example.com','1990-01-02'),(3,'user3','password3','password_hash_md5_3','Bob','Smith','bobsmith@example.com','1990-01-03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `num_medicina`
--

/*!50001 DROP VIEW IF EXISTS `num_medicina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `num_medicina` AS select `treatments`.`id_diagnosis` AS `id_diagnosis`,count(`treatments`.`id_medicine`) AS `cantidad_medicinas` from `treatments` group by `treatments`.`id_diagnosis` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 10:33:10
