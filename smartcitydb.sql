-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: smartcity
-- ------------------------------------------------------
-- Server version 5.7.19-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Businessman'),(1,'Student'),(3,'Tourist');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user details',7,'add_userdetails'),(20,'Can change user details',7,'change_userdetails'),(21,'Can delete user details',7,'delete_userdetails'),(22,'Can add profile',8,'add_profile'),(23,'Can change profile',8,'change_profile'),(24,'Can delete profile',8,'delete_profile'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(28,'Can add question',10,'add_question'),(29,'Can change question',10,'change_question'),(30,'Can delete question',10,'delete_question'),(31,'Can add element',11,'add_element'),(32,'Can change element',11,'change_element'),(33,'Can delete element',11,'delete_element'),(34,'Can add entity',12,'add_entity'),(35,'Can change entity',12,'change_entity'),(36,'Can delete entity',12,'delete_entity'),(37,'Can add city',13,'add_city'),(38,'Can change city',13,'change_city'),(39,'Can delete city',13,'delete_city'),(40,'Can add industry',14,'add_industry'),(41,'Can change industry',14,'change_industry'),(42,'Can delete industry',14,'delete_industry'),(43,'Can add mall',15,'add_mall'),(44,'Can change mall',15,'change_mall'),(45,'Can delete mall',15,'delete_mall'),(46,'Can add museum',16,'add_museum'),(47,'Can change museum',16,'change_museum'),(48,'Can delete museum',16,'delete_museum'),(49,'Can add park',17,'add_park'),(50,'Can change park',17,'change_park'),(51,'Can delete park',17,'delete_park'),(52,'Can add restaurant',18,'add_restaurant'),(53,'Can change restaurant',18,'change_restaurant'),(54,'Can delete restaurant',18,'delete_restaurant'),(55,'Can add zoo',19,'add_zoo'),(56,'Can change zoo',19,'change_zoo'),(57,'Can delete zoo',19,'delete_zoo'),(58,'Can add hotel',20,'add_hotel'),(59,'Can change hotel',20,'change_hotel'),(60,'Can delete hotel',20,'delete_hotel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$ebWKEQWMpJjm$254vhxxKzUJTU2vrEzIlCQpvdKtQ/kIZviSp6uWxBI0=','2017-09-07 08:13:59.543949',1,'admin','','','',1,1,'2017-09-07 08:13:21.294022'),(17,'pbkdf2_sha256$36000$0PbmABYq2kKi$32stEjpL6L2aL1GzqG3j76stI9Xp+mpdtE4C03BVpTE=','2017-10-05 09:05:30.437489',1,'stran','','','stran@abc.com',1,1,'2017-10-03 07:20:14.843981'),(19,'pbkdf2_sha256$36000$XIbwUAa5XDUr$aVq2eV17L1oWwRQ/opZ5uU+UpAUjy/sDpLEPJvH4mhg=','2017-10-05 12:04:23.572258',0,'steve','Tuong','Nguyen','stranger0411@gmail.com',0,1,'2017-10-03 23:09:26.000000'),(20,'pbkdf2_sha256$36000$1rp04LNLrZ7W$dHT7IzmnuJKOfOxcjgg1A7BUnM/zFYAh4R5xfQh4Vbo=','2017-10-04 06:15:15.539373',0,'steven','Steven','Tuong','stranger0411@gmail.com',0,1,'2017-10-04 02:52:04.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,19,1),(6,20,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_city`
--

DROP TABLE IF EXISTS `browser_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `map` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_city`
--

LOCK TABLES `browser_city` WRITE;
/*!40000 ALTER TABLE `browser_city` DISABLE KEYS */;
INSERT INTO `browser_city` VALUES (1,'Brisbane','2016-12-13_hQL7R9S.png'),(2,'Sydney','');
/*!40000 ALTER TABLE `browser_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_college`
--

DROP TABLE IF EXISTS `browser_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_college` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `departments` varchar(200) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_college`
--

LOCK TABLES `browser_college` WRITE;
/*!40000 ALTER TABLE `browser_college` DISABLE KEYS */;
INSERT INTO `browser_college` VALUES (1,'Queensland University of Technology','2 George St., Brisbane 4000, QLD','SEF','qut@edu.au'),(2,'University of Queensland','Unknown','SEF','uq@edu.au');
/*!40000 ALTER TABLE `browser_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_hotel`
--

DROP TABLE IF EXISTS `browser_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_hotel`
--

LOCK TABLES `browser_hotel` WRITE;
/*!40000 ALTER TABLE `browser_hotel` DISABLE KEYS */;
INSERT INTO `browser_hotel` VALUES (1,'Hotel California','12 Holliwood St, CA','012415599','calihotel@gmail.com');
/*!40000 ALTER TABLE `browser_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_industry`
--

DROP TABLE IF EXISTS `browser_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `industry_type` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_industry`
--

LOCK TABLES `browser_industry` WRITE;
/*!40000 ALTER TABLE `browser_industry` DISABLE KEYS */;
INSERT INTO `browser_industry` VALUES (1,'Dimension Data','163 North Quay St.','TECH','dd@gmail.com');
/*!40000 ALTER TABLE `browser_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_library`
--

DROP TABLE IF EXISTS `browser_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_library`
--

LOCK TABLES `browser_library` WRITE;
/*!40000 ALTER TABLE `browser_library` DISABLE KEYS */;
INSERT INTO `browser_library` VALUES (1,'Chermside','Westfield Chermside','012394185','chermsidelib@gmail.com');
/*!40000 ALTER TABLE `browser_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_mall`
--

DROP TABLE IF EXISTS `browser_mall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_mall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `browser_mall_city_id_e22cba2b_fk_browser_city_id` (`city_id`),
  CONSTRAINT `browser_mall_city_id_e22cba2b_fk_browser_city_id` FOREIGN KEY (`city_id`) REFERENCES `browser_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_mall`
--

LOCK TABLES `browser_mall` WRITE;
/*!40000 ALTER TABLE `browser_mall` DISABLE KEYS */;
INSERT INTO `browser_mall` VALUES (2,'Queens Street Mall','1 Queens Street, Brisbane 4000','0124591248','awf@gmail.com',1);
/*!40000 ALTER TABLE `browser_mall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_museum`
--

DROP TABLE IF EXISTS `browser_museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_museum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `browser_museum_city_id_bd1da589_fk_browser_city_id` (`city_id`),
  CONSTRAINT `browser_museum_city_id_bd1da589_fk_browser_city_id` FOREIGN KEY (`city_id`) REFERENCES `browser_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_museum`
--

LOCK TABLES `browser_museum` WRITE;
/*!40000 ALTER TABLE `browser_museum` DISABLE KEYS */;
INSERT INTO `browser_museum` VALUES (1,'Museum of Brisbane','12 Adelaide St, Brisbane 4000','410395375','MASF@gmail.com',1);
/*!40000 ALTER TABLE `browser_museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_park`
--

DROP TABLE IF EXISTS `browser_park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_park` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `browser_park_city_id_d2a9cb6e_fk_browser_city_id` (`city_id`),
  CONSTRAINT `browser_park_city_id_d2a9cb6e_fk_browser_city_id` FOREIGN KEY (`city_id`) REFERENCES `browser_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_park`
--

LOCK TABLES `browser_park` WRITE;
/*!40000 ALTER TABLE `browser_park` DISABLE KEYS */;
INSERT INTO `browser_park` VALUES (1,'Duton  Park','2/62 Heaslop Terrace','0410395375','stranger0411@gmail.com',1);
/*!40000 ALTER TABLE `browser_park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_restaurant`
--

DROP TABLE IF EXISTS `browser_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `browser_restaurant_city_id_34f885ac_fk_browser_city_id` (`city_id`),
  CONSTRAINT `browser_restaurant_city_id_34f885ac_fk_browser_city_id` FOREIGN KEY (`city_id`) REFERENCES `browser_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_restaurant`
--

LOCK TABLES `browser_restaurant` WRITE;
/*!40000 ALTER TABLE `browser_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `browser_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `browser_zoo`
--

DROP TABLE IF EXISTS `browser_zoo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `browser_zoo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `browser_zoo_city_id_94471bdc_fk_browser_city_id` (`city_id`),
  CONSTRAINT `browser_zoo_city_id_94471bdc_fk_browser_city_id` FOREIGN KEY (`city_id`) REFERENCES `browser_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `browser_zoo`
--

LOCK TABLES `browser_zoo` WRITE;
/*!40000 ALTER TABLE `browser_zoo` DISABLE KEYS */;
INSERT INTO `browser_zoo` VALUES (1,'Queensland National Zoo','124 Dntentknow St. Burndall, 4077','14850114085','sawf@gmail.com',1);
/*!40000 ALTER TABLE `browser_zoo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-09-07 08:15:10.689068','1','Student',1,'[{\"added\": {}}]',4,1),(2,'2017-09-07 08:17:39.098968','2','test',1,'[{\"added\": {}}]',2,1),(6,'2017-10-03 07:21:07.683446','1','Brisbane',1,'[{\"added\": {}}]',13,17),(7,'2017-10-03 07:34:18.191318','1','Brisbane',1,'[{\"added\": {}}]',13,17),(8,'2017-10-03 08:20:04.281367','1','Brisbane',1,'[{\"added\": {}}]',11,17),(9,'2017-10-03 23:09:10.482767','13','eqwewqeqw',3,'',2,17),(10,'2017-10-03 23:09:10.487769','14','eqwewqeqwwq',3,'',2,17),(11,'2017-10-03 23:09:10.496770','10','jurtis111',3,'',2,17),(12,'2017-10-03 23:09:10.500772','6','mark',3,'',2,17),(13,'2017-10-03 23:09:10.504775','3','matthew',3,'',2,17),(14,'2017-10-03 23:09:10.509785','4','olliedog',3,'',2,17),(15,'2017-10-03 23:09:10.512802','12','qwrerqew',3,'',2,17),(16,'2017-10-03 23:09:10.516814','11','qwweeqw',3,'',2,17),(17,'2017-10-03 23:09:10.520816','15','Steve',3,'',2,17),(18,'2017-10-03 23:09:10.524818','18','steve123',3,'',2,17),(19,'2017-10-03 23:09:10.528816','2','test',3,'',2,17),(20,'2017-10-03 23:09:10.532818','7','timmy',3,'',2,17),(21,'2017-10-03 23:09:10.536849','8','timmy2',3,'',2,17),(22,'2017-10-03 23:09:10.540967','9','timmy3',3,'',2,17),(23,'2017-10-03 23:09:26.923368','19','steve',1,'[{\"added\": {}}]',2,17),(24,'2017-10-03 23:10:29.825056','19','steve',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}]',2,17),(25,'2017-10-04 01:42:58.471618','2','Sydney',1,'[{\"added\": {}}]',13,17),(26,'2017-10-04 02:51:46.857522','5','admin2',3,'',2,17),(27,'2017-10-04 02:51:46.860525','16','admin3',3,'',2,17),(28,'2017-10-04 02:52:04.482165','20','steven',1,'[{\"added\": {}}]',2,17),(29,'2017-10-04 02:52:42.970617','20','steven',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"last_login\"]}}]',2,17),(30,'2017-10-04 06:20:06.778483','1','Queensland University of Technology',1,'[{\"added\": {}}]',21,17),(31,'2017-10-04 06:20:37.314944','2','University of Queensland',1,'[{\"added\": {}}]',21,17),(32,'2017-10-04 06:22:37.051244','1','Duton  Park',1,'[{\"added\": {}}]',17,17),(33,'2017-10-04 07:03:36.430794','1','Chermside',1,'[{\"added\": {}}]',22,17),(34,'2017-10-04 07:05:34.045992','1','Hotel California',1,'[{\"added\": {}}]',20,17),(35,'2017-10-04 07:07:08.031520','1','Dimension Data',1,'[{\"added\": {}}]',14,17),(36,'2017-10-04 07:07:58.520260','1','Museum of Brisbane',1,'[{\"added\": {}}]',15,17),(37,'2017-10-04 07:09:11.766339','1','Museum of Brisbane',1,'[{\"added\": {}}]',16,17),(38,'2017-10-04 07:10:23.580866','1','Queensland National Zoo',1,'[{\"added\": {}}]',19,17),(39,'2017-10-04 07:11:25.125634','2','Queens Street Mall',1,'[{\"added\": {}}]',15,17),(40,'2017-10-04 07:11:38.245320','1','Museum of Brisbane',3,'',15,17),(41,'2017-10-04 08:16:10.967144','3','Paris',1,'[{\"added\": {}}]',13,17),(42,'2017-10-04 08:39:50.871590','3','Paris',3,'',13,17);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(2,'auth','user'),(13,'browser','city'),(21,'browser','college'),(20,'browser','hotel'),(14,'browser','industry'),(22,'browser','library'),(15,'browser','mall'),(16,'browser','museum'),(17,'browser','park'),(18,'browser','restaurant'),(19,'browser','zoo'),(5,'contenttypes','contenttype'),(9,'HomePage','choice'),(11,'HomePage','element'),(12,'HomePage','entity'),(10,'HomePage','question'),(8,'login','profile'),(6,'sessions','session'),(7,'users','userdetails');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-07 07:42:59.873127'),(2,'auth','0001_initial','2017-09-07 07:43:02.145209'),(3,'admin','0001_initial','2017-09-07 07:43:02.704076'),(4,'admin','0002_logentry_remove_auto_add','2017-09-07 07:43:02.719090'),(5,'contenttypes','0002_remove_content_type_name','2017-09-07 07:43:03.090838'),(6,'auth','0002_alter_permission_name_max_length','2017-09-07 07:43:03.285074'),(7,'auth','0003_alter_user_email_max_length','2017-09-07 07:43:03.486419'),(8,'auth','0004_alter_user_username_opts','2017-09-07 07:43:03.507475'),(9,'auth','0005_alter_user_last_login_null','2017-09-07 07:43:03.653706'),(10,'auth','0006_require_contenttypes_0002','2017-09-07 07:43:03.665718'),(11,'auth','0007_alter_validators_add_error_messages','2017-09-07 07:43:03.692762'),(12,'auth','0008_alter_user_username_max_length','2017-09-07 07:43:03.886200'),(13,'sessions','0001_initial','2017-09-07 07:43:04.097630'),(14,'users','0001_initial','2017-09-07 07:55:47.085417'),(15,'login','0001_initial','2017-09-30 13:45:43.439248'),(16,'HomePage','0001_initial','2017-09-30 14:28:34.832206'),(17,'HomePage','0002_auto_20171003_1531','2017-10-03 04:33:15.623746'),(18,'browser','0001_initial','2017-10-03 07:33:32.035320'),(19,'browser','0002_auto_20171002_2246','2017-10-03 07:33:32.118376');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1jg4m0lgk9k6a6pozmcf4z7abq3q6rzi','MmI0ODhkOWFkOThkNGQ5MmM5NjQwOTA5M2U3ZmUyMTI5NjhiNDM2MTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTkxMzBiMjI1ZjhjYzM4ODRjYjlhMTVjMTQ5Yzg1MzRmMDdkODQ2OSJ9','2017-09-26 04:57:30.873368'),('m3cchvuxvnn9vx9iqeekmm3xzuffehff','MzBiNmEyZjc4NzM3N2Y1OTg4MDU4YzBmZGY5YTBmMWUwZGJhZmZjYTp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmI0ZWU5ZWZiOTgzODBkYmZkNDZlZTE1ODI0NmYzZWM3ZDhmOTkwOCJ9','2017-10-19 12:04:23.580256'),('xpo0ro3ffbf44tkj40wqehxd4w9zqhfc','YWRkMTY4ZmJkNDJjMGQ1MWQ3YzE4M2U3OGIzODI4YmIzNmUyZmZmODp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjYyMTM2ZmU2MmI5NDhhYjZjNTNjYjczMjc1YTU0NGU3MDNiMWUzYSJ9','2017-10-17 22:51:20.409828');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_element`
--

DROP TABLE IF EXISTS `homepage_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `element_name` varchar(200) NOT NULL,
  `element_address` varchar(200) NOT NULL,
  `element_phone` varchar(15) NOT NULL,
  `element_email` varchar(200) NOT NULL,
  `element_department` varchar(200) NOT NULL,
  `element_industry_type` varchar(200) NOT NULL,
  `rating` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `HomePage_element_entity_id_a80125c2_fk_HomePage_entity_id` (`entity_id`),
  CONSTRAINT `HomePage_element_entity_id_a80125c2_fk_HomePage_entity_id` FOREIGN KEY (`entity_id`) REFERENCES `homepage_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_element`
--

LOCK TABLES `homepage_element` WRITE;
/*!40000 ALTER TABLE `homepage_element` DISABLE KEYS */;
INSERT INTO `homepage_element` VALUES (1,'Brisbane','41 Gergeo stree','0410395375','stranger0411@gmail.com','Study','tourism',0,1);
/*!40000 ALTER TABLE `homepage_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homepage_entity`
--

DROP TABLE IF EXISTS `homepage_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homepage_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(200) NOT NULL,
  `modify_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homepage_entity`
--

LOCK TABLES `homepage_entity` WRITE;
/*!40000 ALTER TABLE `homepage_entity` DISABLE KEYS */;
INSERT INTO `homepage_entity` VALUES (1,'Museums','2017-10-03 05:27:41.763637'),(2,'Colleges','2017-10-03 05:06:04.623968'),(3,'Libraries','2017-10-03 05:06:46.851828'),(4,'Industries','2017-10-03 05:07:36.129309'),(5,'Hotels','2017-10-03 05:08:04.682016'),(6,'Parks','2017-10-03 05:08:37.890192'),(7,'Zoos','2017-10-03 05:12:32.045387'),(8,'Restaurants','2017-10-03 05:13:05.803728'),(9,'Malls','2017-10-03 05:13:52.089275');
/*!40000 ALTER TABLE `homepage_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_profile`
--

DROP TABLE IF EXISTS `login_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` longtext NOT NULL,
  `phone` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `login_profile_user_id_2714a7c6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_profile`
--

LOCK TABLES `login_profile` WRITE;
/*!40000 ALTER TABLE `login_profile` DISABLE KEYS */;
INSERT INTO `login_profile` VALUES (2,'','',17),(4,'','',19),(5,'','',20);
/*!40000 ALTER TABLE `login_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 20:53:47
