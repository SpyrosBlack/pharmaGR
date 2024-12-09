-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmacydb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `role` enum('Admin','Pharmacist','Viewer') DEFAULT NULL,
  `userpassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES ('admin','Lakis','Lakis','Admin','1234'),('Kostas','Lakis','Spiros','Pharmacist','1234'),('Spiros','Lakis','Spiros','Pharmacist','1234');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `dateofcount` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `medicineid` int DEFAULT NULL,
  `pharmacyid` int DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `FKf3d6a7qtdoxk6c718fmbqqfir` (`medicineid`),
  KEY `FKbg4cbm1t1av11j1kmcexglqd7` (`pharmacyid`),
  CONSTRAINT `FKbg4cbm1t1av11j1kmcexglqd7` FOREIGN KEY (`pharmacyid`) REFERENCES `pharmacy` (`pharmacyid`),
  CONSTRAINT `FKf3d6a7qtdoxk6c718fmbqqfir` FOREIGN KEY (`medicineid`) REFERENCES `medicine` (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'2025-11-03',33,1,1),(2,'2025-11-03',33,2,1),(3,'2025-11-03',33,3,1),(4,'2025-11-03',33,2,1),(5,'2025-11-03',33,1,1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_warehouse`
--

DROP TABLE IF EXISTS `inventory_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_warehouse` (
  `inventory_id` bigint NOT NULL AUTO_INCREMENT,
  `dateofcount` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `medicineid` int DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `FK3ll563j7erqgjtd9p612gyamf` (`medicineid`),
  CONSTRAINT `FK3ll563j7erqgjtd9p612gyamf` FOREIGN KEY (`medicineid`) REFERENCES `medicine` (`medicineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_warehouse`
--

LOCK TABLES `inventory_warehouse` WRITE;
/*!40000 ALTER TABLE `inventory_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicineid` int NOT NULL AUTO_INCREMENT,
  `disabled_med` bit(1) NOT NULL DEFAULT b'0',
  `medicinename` varchar(255) DEFAULT NULL,
  `medicineprice` float NOT NULL,
  PRIMARY KEY (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,_binary '\0','Medicine 1',23),(2,_binary '\0','Medicine 2',2),(3,_binary '\0','Medicine 3',56),(4,_binary '\0','Medicine 2',666),(5,_binary '\0','ddddddddd',56),(6,_binary '\0','kkkkkkkkk',56),(7,_binary '\0','lllllll',56),(8,_binary '\0','eeeeeee',56);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy` (
  `pharmacyid` int NOT NULL AUTO_INCREMENT,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `pharmacyaddress` varchar(255) DEFAULT NULL,
  `pharmacycity` varchar(255) DEFAULT NULL,
  `pharmacyname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pharmacyid`),
  UNIQUE KEY `UKm7xgs9t8826u90a26t5jrba2l` (`username`),
  CONSTRAINT `FKslw2w6ddvlv6jb3td18jpfqs1` FOREIGN KEY (`username`) REFERENCES `app_user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,38.1725,23.725,'lala','lala','lala','Spiros'),(2,38.1725,23.725,'lala','lala','lala','Kostas');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaorder`
--

DROP TABLE IF EXISTS `pharmaorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmaorder` (
  `orderid` bigint NOT NULL AUTO_INCREMENT,
  `orderdate` date DEFAULT NULL,
  `pharmacyid` int DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK2st3467ptv1qlgekor3u26pd6` (`pharmacyid`),
  CONSTRAINT `FK2st3467ptv1qlgekor3u26pd6` FOREIGN KEY (`pharmacyid`) REFERENCES `pharmacy` (`pharmacyid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaorder`
--

LOCK TABLES `pharmaorder` WRITE;
/*!40000 ALTER TABLE `pharmaorder` DISABLE KEYS */;
INSERT INTO `pharmaorder` VALUES (1,'2024-11-16',1),(2,'2024-11-16',2);
/*!40000 ALTER TABLE `pharmaorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaorderitem`
--

DROP TABLE IF EXISTS `pharmaorderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmaorderitem` (
  `orderitemid` int NOT NULL AUTO_INCREMENT,
  `iscompleted` bit(1) NOT NULL,
  `quantity` int DEFAULT NULL,
  `medicineid` int DEFAULT NULL,
  `orderid` bigint DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `FK4ten2buib2ieen954pf4h2plt` (`medicineid`),
  KEY `FK16opiiennsgn74tay8hhhh120` (`orderid`),
  CONSTRAINT `FK16opiiennsgn74tay8hhhh120` FOREIGN KEY (`orderid`) REFERENCES `pharmaorder` (`orderid`),
  CONSTRAINT `FK4ten2buib2ieen954pf4h2plt` FOREIGN KEY (`medicineid`) REFERENCES `medicine` (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaorderitem`
--

LOCK TABLES `pharmaorderitem` WRITE;
/*!40000 ALTER TABLE `pharmaorderitem` DISABLE KEYS */;
INSERT INTO `pharmaorderitem` VALUES (1,_binary '\0',22,1,1),(2,_binary '\0',22,2,1);
/*!40000 ALTER TABLE `pharmaorderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pharmacydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 12:49:25
