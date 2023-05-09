-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fisiohumana
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `annexes`
--

DROP TABLE IF EXISTS `annexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annexes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_image` varchar(45) NOT NULL,
  `clinic_historys` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `annexes_FK` (`clinic_historys`),
  CONSTRAINT `annexes_FK` FOREIGN KEY (`clinic_historys`) REFERENCES `clinic_historys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annexes`
--

LOCK TABLES `annexes` WRITE;
/*!40000 ALTER TABLE `annexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `annexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_FK` (`user`),
  CONSTRAINT `appointment_FK` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic_historys`
--

DROP TABLE IF EXISTS `clinic_historys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic_historys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `residence_address` varchar(45) DEFAULT NULL,
  `emergency_number` varchar(10) NOT NULL,
  `diagnostic` varchar(50) NOT NULL,
  `background` varchar(100) NOT NULL,
  `referring_physician` varchar(45) DEFAULT NULL,
  `medical_evaluation` mediumtext NOT NULL,
  `recommended_sessions` int(11) NOT NULL,
  `attending_physician` varchar(45) NOT NULL,
  `ocupation` varchar(50) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinic_historys_FK` (`user`),
  CONSTRAINT `clinic_historys_FK` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic_historys`
--

LOCK TABLES `clinic_historys` WRITE;
/*!40000 ALTER TABLE `clinic_historys` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinic_historys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinical_evolutions`
--

DROP TABLE IF EXISTS `clinical_evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinical_evolutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `attending_physycian` varchar(45) NOT NULL,
  `clinic_history` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clinical_evolutions_FK` (`clinic_history`),
  CONSTRAINT `clinical_evolutions_FK` FOREIGN KEY (`clinic_history`) REFERENCES `clinic_historys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinical_evolutions`
--

LOCK TABLES `clinical_evolutions` WRITE;
/*!40000 ALTER TABLE `clinical_evolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `clinical_evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identification_types`
--

DROP TABLE IF EXISTS `identification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identification_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identification_types`
--

LOCK TABLES `identification_types` WRITE;
/*!40000 ALTER TABLE `identification_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `identification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `identification_number` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cell_phone_number` varchar(10) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `identification_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_FK` (`identification_type`),
  CONSTRAINT `users_FK` FOREIGN KEY (`identification_type`) REFERENCES `identification_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_role`
--

DROP TABLE IF EXISTS `users_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_role` (
  `users` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  KEY `users_has_role_FK` (`role`),
  KEY `users_has_role_FK_1` (`users`),
  CONSTRAINT `users_has_role_FK` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `users_has_role_FK_1` FOREIGN KEY (`users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_role`
--

LOCK TABLES `users_has_role` WRITE;
/*!40000 ALTER TABLE `users_has_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fisiohumana'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-05 11:07:24
