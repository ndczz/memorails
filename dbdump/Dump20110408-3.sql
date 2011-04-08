-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: memorails_development
-- ------------------------------------------------------
-- Server version	5.5.9

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
-- Current Database: `memorails_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `memorails_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `memorails_development`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Animals',NULL,NULL),(2,'Autos',NULL,NULL),(3,'Nature',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT '0.00',
  `user_id` int(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `show_count` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `height` int(10) DEFAULT NULL,
  `rating_count` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `picture_users` (`user_id`),
  KEY `picture_categories` (`category_id`),
  KEY `picture_category` (`category_id`),
  CONSTRAINT `picture_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `picture_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'cow','http://img.brothersoft.com/games/flash/icon/b/blithe-cow-coloring-52184-1286520546.jpg',4.80,1,NULL,'2011-04-08 16:56:07',1,16,100,100,5),(2,'cat','http://www.californiaearthminerals.com/graphics/cat.gif',2.24,1,NULL,'2011-04-08 15:43:55',1,10,100,100,8),(3,'car','http://www.qvts.com/images/CarHireClio.jpg',0.00,1,NULL,'2011-04-08 10:49:07',2,2,100,100,0),(4,'football','http://www.coachteed.com/images/links.png',0.00,1,NULL,NULL,3,0,100,100,0),(5,'bear','http://www.hollywoodgames.net/files/image/polar-bear.jpg',3.51,1,NULL,'2011-04-08 17:22:42',1,15,100,100,13),(6,'peugeot','http://www.tvoypeugeot.ru/admin/modules/html/files/html695/peugeot_307cc_paris_01.jpg',3.20,1,NULL,'2011-04-08 16:00:59',2,55,800,537,23),(7,'snake','http://www.motivationalz.com/120s/001.jpg',0.00,1,NULL,'2011-04-08 15:45:59',1,4,100,100,0),(8,'house','http://www.besthousedesign.com/wp-content/uploads/2008/11/dra_family_house_image.jpg',4.25,1,NULL,'2011-04-08 15:41:01',3,15,100,100,14),(9,'plane','http://www.freeplaynow.com:8080/park-my-plane-game.jpg',0.00,1,NULL,'2011-04-08 14:56:31',3,5,100,100,0),(10,'girl','http://files.rainbowdressup.com/games/flower-girl.jpg',0.00,1,NULL,NULL,3,0,100,100,0),(11,'dog','http://jackandhill.typepad.com/jack_and_hill_a_beauty_bl/images/target_dog.jpg',0.00,1,NULL,NULL,1,0,100,100,0),(12,'rihanna','http://www.lesavatars.com/Smile/Rihanna/rihanna103.jpg',0.00,1,NULL,'2011-04-08 14:14:50',3,1,100,100,0),(13,'Porsche 911','http://chevroletik.com/wp-content/uploads/2010/06/2010-porsche-911-turbo-580.jpg',5.00,1,NULL,'2011-04-08 17:23:48',2,74,585,388,2);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures_tags`
--

DROP TABLE IF EXISTS `pictures_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures_tags` (
  `picture_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pictures_tags_pictures` (`picture_id`),
  KEY `fk_pictures_tags_tags` (`tag_id`),
  CONSTRAINT `fk_pictures_tags_pictures` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pictures_tags_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures_tags`
--

LOCK TABLES `pictures_tags` WRITE;
/*!40000 ALTER TABLE `pictures_tags` DISABLE KEYS */;
INSERT INTO `pictures_tags` VALUES (13,1,1),(13,2,2),(13,3,3),(13,4,4),(1,5,5),(1,6,6);
/*!40000 ALTER TABLE `pictures_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20110407142441'),('20110407143055'),('20110407184840'),('20110407185233'),('20110408094604'),('20110408100202'),('20110408143359'),('20110408144929'),('20110408162402');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'porsche',NULL,NULL),(2,'911',NULL,NULL),(3,'car',NULL,NULL),(4,'auto',NULL,NULL),(5,'смешные картинки',NULL,NULL),(6,'животные',NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gugugu','pass','gu@gugu','2011-04-07 14:49:05','2011-04-07 14:49:05');
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

-- Dump completed on 2011-04-08 21:25:16
