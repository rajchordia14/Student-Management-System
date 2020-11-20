CREATE DATABASE  IF NOT EXISTS `StudentManage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `StudentManage`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: StudentManage
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

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
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (10001,'Computer Science'),(10002,'Basic Electronics'),(10003,'Technical English'),(10004,'Classical Physics'),(10005,'Mathematics 1'),(10006,'OTA');
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `fid` int NOT NULL AUTO_INCREMENT,
  `cid` int DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `cid` (`cid`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `Courses` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (10001,10001,'Mukesh','Jadon','M','mukesh','mukeshjadon@lnmiit.ac.in','9876543212','B-38 Jaipur'),(10002,10001,'Ram','Sharma','M','ram','ramsharma@lnmiit.ac.in','9123456789','B-46 Jaipur'),(10003,10002,'Nikhil','Raj','M','nikhil','nikhilraj@lnmiit.ac.in','9717171717','B-53 Jaipur'),(10004,10003,'Payel','Pal','F','payel','payelpal@lnmiit.ac.in','9123452222','B-43 Jaipur'),(10005,10005,'Harsh','Trivedi','M','harsh','harshtrivedi@lnmiit.ac.in','9167546789','B-09 Jaipur'),(10006,10006,'Jayprakash','Kar','M','jayprakash','jayprakashkar@lnmiit.ac.in','9123456789','B-46 Jaipur');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marksheet`
--

DROP TABLE IF EXISTS `Marksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marksheet` (
  `sid` int NOT NULL,
  `cid` int NOT NULL,
  `fid` int NOT NULL,
  `marks` int DEFAULT NULL,
  PRIMARY KEY (`sid`,`cid`,`fid`),
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  KEY `fid` (`fid`),
  CONSTRAINT `marksheet_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Students` (`sid`),
  CONSTRAINT `marksheet_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `Courses` (`cid`),
  CONSTRAINT `marksheet_ibfk_3` FOREIGN KEY (`fid`) REFERENCES `Faculty` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marksheet`
--

LOCK TABLES `Marksheet` WRITE;
/*!40000 ALTER TABLE `Marksheet` DISABLE KEYS */;
INSERT INTO `Marksheet` VALUES (10001,10001,10001,78),(10001,10001,10002,78),(10001,10002,10003,80),(10001,10003,10004,95),(10001,10005,10005,77),(10002,10001,10001,87),(10002,10002,10003,98),(10002,10003,10004,69),(10002,10005,10005,70),(10002,10006,10006,88),(10003,10001,10002,54),(10003,10003,10004,68),(10003,10005,10005,76),(10004,10003,10004,75),(10004,10005,10005,79),(10004,10006,10006,71);
/*!40000 ALTER TABLE `Marksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (10001,'Aashita','Agarwal','E-266 Vaishali Nagar','9664200000','aashita','F','19ucs160@lnmiit.ac.in'),(10002,'Pranjal','Gupta','E-78 Sodala Jaipur','9948573529','pranjal','M','19ucs162@lnmiit.ac.in'),(10003,'Kartik','Singhal','A-74 Jaipur','9293849264','kartik','M','19ucs263@lnmiit.ac.in'),(10004,'Raj','Chordia','153-C adarsh Nagar,Ajmer','9530077999','raj','M','19ucs227@lnmiit.ac.in'),(10005,'Rakesh','Modi','B-85 Shastri Nagar,Jaipur','9948573322','rakesh','M','19ucs064@lnmiit.ac.in'),(10006,'Vedang','Mohammed','B-786 Muslim Mohala','9786786786','vedang','M','19ucs071@lnmiit.ac.in');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-20 21:24:12
