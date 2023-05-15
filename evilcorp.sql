-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: evilcorp
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
  `name` varchar(64) NOT NULL,
  `deadly` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `symptoms` text NOT NULL,
  PRIMARY KEY (`id_condition`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (1,'covid19',1,'Infectious disease caused by the SARS-coV-2 virus','fever,cough,tiredness,loss of taste or smell, difficulty breathing'),(2,'ebola',1,'Severe and often fatal illness caused by the Ebola virus','fever, headache, muscle pain, weakness, fatigue, vomiting'),(3,'Diabetes2',0,'Chronic condition that affects the way the body processes blood sugar','fatigue,blurred vision, frequent infections, slow healing'),(4,'flu',0,'Viral respiratory illness','fever, cough, body aches, chills, fatigue'),(5,'Pancreatic cancer',1,'Abnormal number of cells grow and divide in the pancreas','back pain,nausea,vomiting,weight loss'),(6,'ADHD',0,'Attention deficit and hyperactivity','inattention, hyperactivity, impulsivity,fidgeting');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conspiraciones`
--

LOCK TABLES `conspiraciones` WRITE;
/*!40000 ALTER TABLE `conspiraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `conspiraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnoses` (
  `id_diagnose` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `diagnose` text NOT NULL,
  `date` datetime NOT NULL,
  `id_condition` int(10) unsigned NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `id_doctor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_diagnose`),
  KEY `id_condition` (`id_condition`),
  KEY `id_user` (`id_user`),
  KEY `id_doctor` (`id_doctor`),
  CONSTRAINT `diagnoses_ibfk_1` FOREIGN KEY (`id_condition`) REFERENCES `conditions` (`id_condition`),
  CONSTRAINT `diagnoses_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `diagnoses_ibfk_3` FOREIGN KEY (`id_doctor`) REFERENCES `doctors` (`id_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,'Severe COVID-19','2012-12-12 10:31:04',1,1,1),(2,'Attention-Deficit/Hyperactive disorder','2013-12-12 09:30:02',4,1,1),(3,'Type 2 diabetes mellitus','2008-12-12 16:30:02',3,2,2),(4,'Influenza A','2015-05-05 15:00:00',4,3,2);
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
  `doctor` varchar(32) NOT NULL,
  PRIMARY KEY (`id_doctor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Fauci'),(2,'Frankenstein');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iluminatis`
--

DROP TABLE IF EXISTS `iluminatis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iluminatis` (
  `id_iluminati` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_iluminati`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `iluminatis_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iluminatis`
--

LOCK TABLES `iluminatis` WRITE;
/*!40000 ALTER TABLE `iluminatis` DISABLE KEYS */;
/*!40000 ALTER TABLE `iluminatis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `id_medicine` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(192) NOT NULL,
  `invented_by` varchar(24) NOT NULL,
  `side_effects` text NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `sale_price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_medicine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'Paxlovid','Pfizer','nausea, muscle aches, skin rash, increased blood preasure',400.00,530.00),(2,'Adderall','ShireLCC','nausea, decreased appetite, headache, difficulty sleeping',150.50,284.50),(3,'Humulin','Eli Lilly','low blood sugar, weight gain, skin rash',40.00,54.50),(4,'Tamiflu','Gilead Sciences','nausea, vomiting, nosebleeds, headache, fatigue',53.50,60.30);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatments`
--

DROP TABLE IF EXISTS `treatments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatments` (
  `id_treatment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_diagnose` int(10) unsigned NOT NULL,
  `id_medicine` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_treatment`),
  KEY `id_diagnose` (`id_diagnose`),
  KEY `id_medicine` (`id_medicine`),
  CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`id_diagnose`) REFERENCES `diagnoses` (`id_diagnose`),
  CONSTRAINT `treatments_ibfk_2` FOREIGN KEY (`id_medicine`) REFERENCES `medicines` (`id_medicine`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatments`
--

LOCK TABLES `treatments` WRITE;
/*!40000 ALTER TABLE `treatments` DISABLE KEYS */;
INSERT INTO `treatments` VALUES (1,1,1,'Antiviral medications'),(2,2,2,'Oral treatment'),(3,3,3,'Injection'),(4,4,4,'Oral treatment');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consp`
--

LOCK TABLES `user_consp` WRITE;
/*!40000 ALTER TABLE `user_consp` DISABLE KEYS */;
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
  `name` varchar(24) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `username` varchar(24) NOT NULL,
  `password` varchar(50) NOT NULL,
  `country` char(3) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hilon','Musg','root','5f4dcc3b5aa765d61d8327deb882cf99','USA'),(2,'Jeb','Besos','root2','1a1dc91c907325c69271ddf0c944bc72','USA'),(3,'Vil','gatos','root3','76a2173be6393254e72ffa4d6df1030a','USA');
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

-- Dump completed on 2023-05-15 10:30:59
