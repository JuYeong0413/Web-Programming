-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: cafeGO
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
-- Table structure for table `cafe_tbl`
--

DROP TABLE IF EXISTS `cafe_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cafe_tbl` (
  `name` varchar(40) NOT NULL,
  `theme` varchar(10) DEFAULT NULL,
  `star` float DEFAULT '0',
  `location` varchar(100) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_tbl`
--

LOCK TABLES `cafe_tbl` WRITE;
/*!40000 ALTER TABLE `cafe_tbl` DISABLE KEYS */;
INSERT INTO `cafe_tbl` VALUES ('WE Ccafe','디저트',0,'서울 강서구 강서로47길 169','02-2667-8550','https://weccafe.modoo.at/'),('가배도',NULL,0,'서울 송파구 백제고분로45길 6','02-423-4542','https://www.instagram.com/gbdcoffee/'),('맛차차','녹차',0,'서울 성동구 서울숲2길 18-11','010-9719-8707','https://www.matchachaseoul.com/'),('미즐','브런치',0,'서울 강북구 4.19로 107','02-999-5055',NULL),('반쥴','홍차',0,'서울 종로구 삼일대로17길 23','02-735-5437',NULL),('비하인드미','마카롱',0,'서울 동대문구 회기로 125','0507-1408-0890',NULL),('서대문커피공장',NULL,0,'서울 서대문구 가재울로14길 11','010-6399-5149',NULL),('선유기지',NULL,0,'서울 영등포구 선유로51길 1','070-8862-3697','https://www.instagram.com/seonyu_base/'),('알렉스더커피','디저트',0,'서울 성북구 성북로28길 9','070-7520-7714','http://www.alexthecoffee.com/'),('알베르',NULL,0,'서울 강남구 강남대로102길 34','02-566-6181',NULL),('앤드커피랩','디저트',0,'서울 용산구 이태원로54길 74','02-790-5022','https://www.facebook.com/artisanndesign'),('에빈의커피이야기','핸드드립',0,'서울 중구 퇴계로 42길 35','02-2039-2447',NULL),('최가커피','핸드드립',0,'서울 광진구 능동로13길 23','02-465-7998','https://www.facebook.com/choigacoffee/'),('카페 달력','디저트',0,'서울 은평구 연서로18길 28-2','070-7376-0910','https://www.instagram.com/cafe_calendar/'),('카페 메종드한','한옥',0,'서울 강동구 강동대로 177','02-482-2005','https://maisondehan1.modoo.at/'),('카페 스미다',NULL,0,'서울 금천구 벚꽃로 298','070-4633-2525',NULL),('카페 향아','디저트',0,'서울 중랑구 사가정로46길 18',NULL,NULL),('카페오븐','디저트',0,'서울 도봉구 해동로16길 12','02-3141-0089','https://blog.naver.com/cafeoven'),('카페큐브',NULL,0,'서울 구로구 경인로 662','02-2211-6603','http://cafecube.itrocks.kr/'),('캐틀앤비','브런치',0,'서울 서초구 양재천로 131','02-578-2737','http://cattlenbee.net/'),('커피가게동경','핸드드립',0,'서울 마포구 망원로 6길 21','070-4845-0619',NULL),('커피별녹색잔',NULL,0,'서울 양천구 목동로 21길 26','02-2696-3337',NULL),('페니커피로스터스','디저트',0,'서울 동작구 동작대로1길 36','02-521-8230','https://www.instagram.com/penny_hills/'),('플랫커피',NULL,0,'서울 노원구 공릉로39길 20','070-8614-8747',NULL),('황홀경','디저트',0,'서울 관악구 관악로14길 37','02-6449-7362',NULL);
/*!40000 ALTER TABLE `cafe_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_tbl`
--

DROP TABLE IF EXISTS `review_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_tbl` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  `star` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_tbl`
--

LOCK TABLES `review_tbl` WRITE;
/*!40000 ALTER TABLE `review_tbl` DISABLE KEYS */;
INSERT INTO `review_tbl` VALUES (1,'주영','에빈의커피이야기','좋아요!','2018-12-23 19:29:46',1);
/*!40000 ALTER TABLE `review_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tbl`
--

DROP TABLE IF EXISTS `user_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tbl` (
  `name` varchar(10) NOT NULL,
  `birthday` date DEFAULT NULL,
  `id` varchar(15) NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tel` varchar(15) DEFAULT '-',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tbl`
--

LOCK TABLES `user_tbl` WRITE;
/*!40000 ALTER TABLE `user_tbl` DISABLE KEYS */;
INSERT INTO `user_tbl` VALUES ('이주영','1997-04-13','2jy22','주영','admin','2jy22@naver.com','010-7255-3753');
/*!40000 ALTER TABLE `user_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-23 23:39:05
