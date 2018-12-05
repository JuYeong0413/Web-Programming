-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: week13
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board_tbl`
--

DROP TABLE IF EXISTS `board_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `e_mail` varchar(40) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `passwd` varchar(10) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref` (`ref`),
  CONSTRAINT `board_tbl_ibfk_1` FOREIGN KEY (`ref`) REFERENCES `board_tbl` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_tbl`
--

LOCK TABLES `board_tbl` WRITE;
/*!40000 ALTER TABLE `board_tbl` DISABLE KEYS */;
INSERT INTO `board_tbl` VALUES (1,'홍길동','hgd@test.com','안녕하세요','안녕하세요, DB 연동을 환영합니다.','1234',1),(2,'이주영','jy@test.com','모델1','모델1 입니다.','1234',2),(3,'이주영','jy@test.com','모델2','모델2 입니다.','1234',3);
/*!40000 ALTER TABLE `board_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-05 22:45:04
