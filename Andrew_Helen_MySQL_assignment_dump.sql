CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bed` (
  `bedNumber` int(11) NOT NULL AUTO_INCREMENT,
  `bedType` enum('emergency','intensive care','standard') DEFAULT NULL,
  `wardID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`bedNumber`),
  KEY `FK_ward` (`wardID`),
  KEY `FK_patient_bed` (`patientID`),
  CONSTRAINT `FK_patient_bed` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_ward` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1,'emergency',1,12),(2,'intensive care',2,13),(3,'standard',3,14),(4,'emergency',1,15),(5,'intensive care',2,16),(6,'standard',3,17),(7,'emergency',1,18),(8,'intensive care',2,19),(9,'standard',3,20),(10,'emergency',1,21),(11,'intensive care',2,22),(12,'standard',3,23);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `PPS` int(6) NOT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `town` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `contactNo` int(8) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `specialisation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PPS`),
  KEY `docSpec` (`specialisation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (160728,'Orla','Smith','1 School House Road','Inistioge','Kilkenny',863742892,'2017-12-26','Cardiac'),(177259,'Steven','Doyle','14 Fishermans Grove','Sycamores','Kilkenny',877526934,'2017-11-04','Pathology'),(235156,'Niall','Flynn','13 The Village','Thomastown','Kilkenny',872072455,'2017-09-11','Neurology'),(287588,'Rose','Brown','11 Church Road','The Rower','Kilkenny',872771104,'2017-08-01','Oncology'),(308458,'Anne','Ryan','28 Main Street','New Ross','Wexford',871563537,'2017-07-02','ANESTHESIOLOGY'),(453904,'Tom','Smith','15 Main Street','Dungarvan','Waterford',879429423,'2017-09-13','Surgery'),(513805,'Cathy','Ryan','123 Riverwalk','The Rower','Kilkenny',869536231,'2017-01-03','Pediatrics'),(567443,'Martin','Delaney','25 Upper Street','New Ross','Wexford',873611217,'2017-04-04','Radiology'),(626177,'Eoin','Roche','21 Main Street','Glenmore','Kilkenny',874529346,'2017-04-16','Emergency');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drug` (
  `drugID` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(20) DEFAULT NULL,
  `manufacturer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`drugID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (1,'Amoxicillin','Bayer'),(2,'Flucloxacillin','Eli Lilly'),(3,'Meropenem','Gilead'),(4,'Vancomycin','Amgen'),(5,'Gentamycin','Steven'),(6,'Clarithromycin','GSK'),(7,'Co-amoxiclav','Novartis'),(8,'Doxycycline','Pfizer'),(9,'Ceftazidime','Roche'),(10,'Piperacillin','Johnson & Johnson'),(11,'Ciprofloxacin','Sanofi'),(12,'Levofloxacin','Abbvie'),(15,'panadol','GSK');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `drug_count` AFTER INSERT ON `drug` FOR EACH ROW BEGIN
	insert into prescriptionCount
    set 
    drugID = new.drugID,
    count = 0;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `town` varchar(20) DEFAULT NULL,
  `county` varchar(20) DEFAULT NULL,
  `contactNo` int(8) DEFAULT NULL,
  `arriveDate` date DEFAULT NULL,
  `dischargeDate` date DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'James','Malone','21 Main Street','Tramore','Waterford',879127175,'2017-09-04','2017-09-14'),(2,'Marie','Ryan','Kylerue','New Ross','Wexford',832699374,'2019-01-08','2019-01-14'),(3,'Philip','Walsh','Boherdrad','Cashel','Tipperary',863118014,'2017-08-14','2017-08-20'),(4,'James','Ryan','Tinniscully','The Rower','Kilkenny',854103609,'2018-09-14','2018-09-15'),(5,'Rose','Davis','15 Main Street','New Ross','Wexford',858925164,'2019-01-24','2019-01-28'),(6,'Kevin','Roche','Rathinure','Glenmore','Kilkenny',860361652,'2018-03-14','2018-03-19'),(7,'Orla','Ryan','5 Rose Lawn','Grace Dieu','Waterford',846602415,'2017-06-16','2017-07-09'),(8,'Cathy','Brown','Kill and Mill','Cashel','Tipperary',875317305,'2017-07-01','2017-07-11'),(9,'James','Smith','123 Riverwalk','Thomastown','Kilkenny',838041473,'2019-04-07','2019-04-13'),(10,'Claire','Kelly','11 Church Road','Cashel','Tipperary',879134179,'2019-03-30','2019-04-02'),(11,'Mairead','Walsh','5 The Drive','Tramore','Waterford',842757389,'2018-04-23','2018-04-28'),(12,'Anne','Ryan','14 Fishermans Grove','Dunmore East','Waterford',866988046,'2018-02-20',NULL),(13,'Eoin','Delaney','Lower South Street','New Ross','Wexford',836654207,'2019-08-06',NULL),(14,'Cathal','Mooney','1 School House Road','New Ross','Wexford',870081464,'2017-12-26',NULL),(15,'Niall','Flynn','The Quay','Thomastown','Kilkenny',838959025,'2018-05-09',NULL),(16,'Tom','Smith','Upper Rosemount','Inistioge','Kilkenny',849997207,'2019-08-24',NULL),(17,'Martin','Roche','Belview','Slieverue','Kilkenny',870243236,'2018-09-26',NULL),(18,'Molly','Doyle','13 The Village','Clonroche','Wexford',855484270,'2018-01-24',NULL),(19,'Anne','Brown','28 Main Street','Tramore','Waterford',872123066,'2017-10-30',NULL),(20,'Sam','Brown','Tintine','The Rower','Kilkenny',866490864,'2019-06-27',NULL),(21,'Steven','Ryan','25 Upper Street','Clonmel','Tipperary',870420746,'2018-03-20',NULL),(22,'Paul','Doyle','The Mews','Sycamores','Kilkenny',836982514,'2019-05-26',NULL),(23,'Phil','Smith','Rose Inn','Dungarvan','Waterford',860346138,'2017-07-12',NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescription` (
  `visitID` int(11) NOT NULL,
  `drugID` int(11) NOT NULL,
  `doseageDetails` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`visitID`,`drugID`),
  KEY `FK_drug` (`drugID`),
  CONSTRAINT `FK_drug` FOREIGN KEY (`drugID`) REFERENCES `drug` (`drugID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_visit` FOREIGN KEY (`visitID`) REFERENCES `visit` (`visitID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (2,6,'One four times daily'),(3,9,'One three times daily '),(5,12,'One four times daily'),(6,10,'One two times daily '),(9,11,'One two times daily '),(12,10,'one a day'),(13,12,'One three times daily '),(16,7,'One three times daily '),(17,15,'one a day'),(18,5,'One four times daily'),(18,15,'one a day'),(19,10,'one a day'),(20,9,'One two times daily '),(22,12,'One three times daily '),(24,12,'One three times daily '),(25,4,'One two times daily '),(26,9,'One two times daily '),(29,6,'One two times daily '),(31,12,'One two times daily '),(33,5,'One three times daily '),(41,6,'One two times daily '),(42,10,'One three times daily ');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `drug_count_add` AFTER INSERT ON `prescription` FOR EACH ROW BEGIN
	update prescriptionCount
	set count = count +1
    where drugid = new.drugid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prescriptioncount`
--

DROP TABLE IF EXISTS `prescriptioncount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescriptioncount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drugID` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_drugID` (`drugID`),
  CONSTRAINT `FK_drugID` FOREIGN KEY (`drugID`) REFERENCES `drug` (`drugID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptioncount`
--

LOCK TABLES `prescriptioncount` WRITE;
/*!40000 ALTER TABLE `prescriptioncount` DISABLE KEYS */;
INSERT INTO `prescriptioncount` VALUES (1,15,1),(16,1,0),(17,2,0),(18,3,0),(19,4,0),(20,5,0),(21,6,0),(22,7,0),(23,8,0),(24,9,0),(25,10,2),(26,11,0),(27,12,0);
/*!40000 ALTER TABLE `prescriptioncount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `PPS` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`visitID`),
  KEY `FK_patient` (`patientID`),
  KEY `FK_DOC` (`PPS`),
  CONSTRAINT `FK_DOC` FOREIGN KEY (`PPS`) REFERENCES `doctor` (`PPS`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,1,626177,'2017-09-04','09:00:00'),(2,2,567443,'2019-01-08','09:30:00'),(3,3,513805,'2017-08-14','10:00:00'),(4,4,453904,'2018-09-14','10:30:00'),(5,5,308458,'2019-01-24','11:00:00'),(6,6,287588,'2018-03-14','11:30:00'),(7,7,235156,'2017-06-16','12:00:00'),(8,8,177259,'2017-07-01','12:30:00'),(9,9,160728,'2019-04-07','13:00:00'),(10,10,626177,'2019-03-30','13:30:00'),(11,11,567443,'2018-04-23','14:00:00'),(12,12,513805,'2018-02-20','14:30:00'),(13,13,453904,'2019-08-06','15:00:00'),(14,14,308458,'2017-12-26','15:30:00'),(15,15,287588,'2018-05-09','16:00:00'),(16,16,235156,'2019-08-24','16:30:00'),(17,17,177259,'2018-09-26','17:00:00'),(18,18,160728,'2018-01-24','17:30:00'),(19,19,308458,'2017-10-30','18:00:00'),(20,20,287588,'2019-06-27','18:30:00'),(21,21,235156,'2018-03-20','19:00:00'),(22,22,177259,'2019-05-26','19:30:00'),(23,23,177259,'2017-07-12','20:00:00'),(24,1,626177,'2017-09-05','20:00:00'),(25,2,567443,'2019-01-09','19:30:00'),(26,3,513805,'2017-08-15','19:00:00'),(27,4,453904,'2018-09-15','18:30:00'),(28,5,308458,'2019-01-25','18:00:00'),(29,6,287588,'2018-03-15','17:30:00'),(30,7,235156,'2017-06-17','17:00:00'),(31,8,177259,'2017-07-02','16:30:00'),(32,9,160728,'2019-04-08','16:00:00'),(33,10,626177,'2019-03-31','15:30:00'),(34,11,567443,'2018-04-24','15:00:00'),(35,12,513805,'2018-02-21','14:30:00'),(36,13,453904,'2019-08-07','14:00:00'),(37,14,308458,'2017-12-27','13:30:00'),(38,15,287588,'2018-05-10','13:00:00'),(39,16,235156,'2019-08-25','12:30:00'),(40,17,177259,'2018-09-27','12:00:00'),(41,18,160728,'2018-01-25','11:30:00'),(42,19,308458,'2017-10-31','11:00:00'),(43,20,287588,'2019-06-28','10:30:00'),(44,21,235156,'2018-03-21','10:00:00'),(45,22,177259,'2019-05-27','09:30:00'),(46,23,177259,'2017-07-13','09:00:00');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ward` (
  `wardID` int(11) NOT NULL AUTO_INCREMENT,
  `wardName` varchar(20) DEFAULT NULL,
  `wardType` enum('emergency','intensive care','standard') DEFAULT NULL,
  PRIMARY KEY (`wardID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward`
--

LOCK TABLES `ward` WRITE;
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
INSERT INTO `ward` VALUES (1,'Ward 1','emergency'),(2,'Ward 2','intensive care'),(3,'Ward 3','standard');
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ward1scripts`
--

DROP TABLE IF EXISTS `ward1scripts`;
/*!50001 DROP VIEW IF EXISTS `ward1scripts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ward1scripts` AS SELECT 
 1 AS `Patient Name`,
 1 AS `Drug`,
 1 AS `Doesage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ward2scripts`
--

DROP TABLE IF EXISTS `ward2scripts`;
/*!50001 DROP VIEW IF EXISTS `ward2scripts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ward2scripts` AS SELECT 
 1 AS `Patient Name`,
 1 AS `Drug`,
 1 AS `Doesage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ward3scripts`
--

DROP TABLE IF EXISTS `ward3scripts`;
/*!50001 DROP VIEW IF EXISTS `ward3scripts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ward3scripts` AS SELECT 
 1 AS `Patient Name`,
 1 AS `Drug`,
 1 AS `Doesage`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital'
--

--
-- Dumping routines for database 'hospital'
--

--
-- Final view structure for view `ward1scripts`
--

/*!50001 DROP VIEW IF EXISTS `ward1scripts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ward1scripts` AS select concat(`patient`.`fName`,' ',`patient`.`lName`) AS `Patient Name`,`drug`.`drugName` AS `Drug`,`prescription`.`doseageDetails` AS `Doesage` from (((((`patient` join `visit` on((`patient`.`patientID` = `visit`.`patientID`))) join `prescription` on((`visit`.`visitID` = `prescription`.`visitID`))) join `drug` on((`prescription`.`drugID` = `drug`.`drugID`))) join `bed` on((`patient`.`patientID` = `bed`.`patientID`))) join `ward` on((`bed`.`wardID` = `ward`.`wardID`))) where (`ward`.`wardID` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ward2scripts`
--

/*!50001 DROP VIEW IF EXISTS `ward2scripts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ward2scripts` AS select concat(`patient`.`fName`,' ',`patient`.`lName`) AS `Patient Name`,`drug`.`drugName` AS `Drug`,`prescription`.`doseageDetails` AS `Doesage` from (((((`patient` join `visit` on((`patient`.`patientID` = `visit`.`patientID`))) join `prescription` on((`visit`.`visitID` = `prescription`.`visitID`))) join `drug` on((`prescription`.`drugID` = `drug`.`drugID`))) join `bed` on((`patient`.`patientID` = `bed`.`patientID`))) join `ward` on((`bed`.`wardID` = `ward`.`wardID`))) where (`ward`.`wardID` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ward3scripts`
--

/*!50001 DROP VIEW IF EXISTS `ward3scripts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ward3scripts` AS select concat(`patient`.`fName`,' ',`patient`.`lName`) AS `Patient Name`,`drug`.`drugName` AS `Drug`,`prescription`.`doseageDetails` AS `Doesage` from (((((`patient` join `visit` on((`patient`.`patientID` = `visit`.`patientID`))) join `prescription` on((`visit`.`visitID` = `prescription`.`visitID`))) join `drug` on((`prescription`.`drugID` = `drug`.`drugID`))) join `bed` on((`patient`.`patientID` = `bed`.`patientID`))) join `ward` on((`bed`.`wardID` = `ward`.`wardID`))) where (`ward`.`wardID` = 3) */;
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

-- Dump completed on 2019-11-17 21:47:40
