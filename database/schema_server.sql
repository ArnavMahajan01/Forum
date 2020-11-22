-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forum
-- ------------------------------------------------------
-- Server version	5.5.61

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
-- Table structure for table `forum_category`
--

DROP TABLE IF EXISTS `forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_category` (
  `forum_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_category_name` varchar(45) NOT NULL,
  `total_questions` varchar(100) DEFAULT NULL,
  `forum_category_description` varchar(500) NOT NULL,
  `forum_icon` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT 'sysadmin',
  `updated_by` varchar(100) DEFAULT 'sysadmin',
  PRIMARY KEY (`forum_category_id`),
  UNIQUE KEY `forum_category_id_UNIQUE` (`forum_category_id`),
  UNIQUE KEY `forum_category_name_UNIQUE` (`forum_category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_category`
--

LOCK TABLES `forum_category` WRITE;
/*!40000 ALTER TABLE `forum_category` DISABLE KEYS */;
INSERT INTO `forum_category` VALUES (1,'Programming Basic',NULL,'When learning to code or develop software, websites or apps, we usually will get stuck with a problem or a bug that refuses to be resolved, no matter what you do. Feel free to ask your questions here.','icon fa-comment',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin'),(2,'Python',NULL,'General discussion forum for the Python programming language. All welcome.','icon solid fa-sync',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin'),(3,'Node.js',NULL,'Get your questions answered in our Node.js Forum, connect with other developers, or just find out what\'s going on in your local area.','icon fa-image',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin'),(4,'Bootstrap',NULL,'Discuss anything related to Bootstrap with  members. Ask any question, answer or reply to discussions on Bootstrap topics in this section of Forum.','icon solid fa-cog',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin'),(5,'CSS',NULL,'Questions relating to page structure and layout—from HTML5 and the proper use of elements to styling issues, browser bugs, media queries and responsive ','icon solid fa-wrench',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin'),(6,'DBMS',NULL,'Discuss anything related to DBMS with members. ... What is the difference between DBMS and Rdbms? What are the basic elements of database?','icon solid fa-check',1,'2020-11-15 16:59:52','2020-11-15 11:29:52','sysadmin','sysadmin');
/*!40000 ALTER TABLE `forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_questions`
--

DROP TABLE IF EXISTS `forum_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum_questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `question_header` varchar(100) NOT NULL,
  `views_count` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'sysadmin',
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(50) NOT NULL DEFAULT 'sysadmin',
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_id_UNIQUE` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_questions`
--

LOCK TABLES `forum_questions` WRITE;
/*!40000 ALTER TABLE `forum_questions` DISABLE KEYS */;
INSERT INTO `forum_questions` VALUES (1,1,'What are the general rules of this forum?',0,1,'2020-11-15 19:12:34','sysadmin','2020-11-15 13:42:34','sysadmin'),(2,2,'What are the general rules of this forum?',0,1,'2020-11-15 19:15:13','sysadmin','2020-11-15 13:45:13','sysadmin'),(3,3,'What are the general rules of this forum?',0,1,'2020-11-15 19:15:13','sysadmin','2020-11-15 13:45:13','sysadmin'),(4,4,'What are the general rules of this forum?',0,1,'2020-11-15 19:15:13','sysadmin','2020-11-15 13:45:13','sysadmin'),(5,5,'What are the general rules of this forum?',0,1,'2020-11-15 19:15:13','sysadmin','2020-11-15 13:45:13','sysadmin'),(6,6,'What are the general rules of this forum?',0,1,'2020-11-15 19:15:13','sysadmin','2020-11-15 13:45:13','sysadmin'),(8,1,'Hello',0,1,'2020-11-20 19:12:46','sysadmin','2020-11-20 13:42:46','sysadmin'),(9,2,'What is python',0,1,'2020-11-22 06:48:42','sysadmin','2020-11-22 01:18:42','sysadmin'),(10,2,'how to pass multiple variable in query string',0,1,'2020-11-22 06:50:53','sysadmin','2020-11-22 01:20:53','sysadmin'),(11,2,'what is ORAM in python?',0,1,'2020-11-22 06:52:00','sysadmin','2020-11-22 01:22:00','sysadmin');
/*!40000 ALTER TABLE `forum_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_detail`
--

DROP TABLE IF EXISTS `question_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `question_detail` text,
  `reply_level` int(11) NOT NULL DEFAULT '0',
  `sub_level` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT 'sysadmin',
  `updated_by` varchar(100) DEFAULT 'sysadmin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_detail`
--

LOCK TABLES `question_detail` WRITE;
/*!40000 ALTER TABLE `question_detail` DISABLE KEYS */;
INSERT INTO `question_detail` VALUES (1,1,'Sample Forum Rulesr<p>No spam. All automated messages, advertisements, and links to competitor websites will be deleted immediately.</p><p>Post in relevant sub-forums only. Messages posted in the wrong topic area will be removed and placed in the correct sub-forum by moderators.</p><p>Respect other users. No flaming or abusing fellow forum members. Users who continue to post inflammatory, abusive comments will be deleted from the forum after two warnings are issued by moderators.</p>p>Harassment. No threats or harassment of other users will be tolerated. Any instance of threatening or harassing behavior is grounds for deletion from the forums.</p><p>Adult content. No profanity or pornography is allowed. Posts containing adult material will be deleted.</p><p>Bandwidth. All images and signatures must be 500 x 500 pixels or smaller. Posts containing over-sized images and signatures will be removed.</p><p>Illegal content. No re-posting of copyrighted materials or other illegal content is allowed. Any posts containing illegal content or copyrighted materials will be deleted.</p>',0,0,1,1,'2020-11-21 14:01:38','2020-11-21 13:57:56','sysadmin','sysadmin'),(2,1,'How to contact in case of abuse?',1,0,2,1,'2020-11-21 14:08:22','2020-11-21 14:08:22','sysadmin','sysadmin'),(3,1,'forum reply',1,0,2,1,'2020-11-22 05:15:37','2020-11-21 23:45:37','sysadmin','sysadmin'),(4,1,'This is another reply.\r\n\r\nTo check how new line works here.\r\n\r\nregards\r\nArnav Mahajan',1,0,2,1,'2020-11-22 05:17:29','2020-11-21 23:47:29','sysadmin','sysadmin'),(5,1,'test',1,0,2,1,'2020-11-22 05:43:24','2020-11-22 00:13:24','sysadmin','sysadmin'),(6,1,'testTest',1,0,2,1,'2020-11-22 05:44:02','2020-11-22 00:14:02','sysadmin','sysadmin'),(7,1,'testTest',1,0,2,1,'2020-11-22 05:44:35','2020-11-22 00:14:35','sysadmin','sysadmin'),(8,1,'testTest',1,0,2,1,'2020-11-22 05:45:35','2020-11-22 00:15:35','sysadmin','sysadmin'),(9,1,'testTest',1,0,2,1,'2020-11-22 05:46:05','2020-11-22 00:16:05','sysadmin','sysadmin'),(10,9,'Could you please explain what is python and how it is useful in modern era?',0,0,2,1,'2020-11-22 06:48:42','2020-11-22 01:18:42','sysadmin','sysadmin'),(11,10,'Could you please explain how to pass multiple variable in query string in python function?',0,0,2,1,'2020-11-22 06:50:53','2020-11-22 01:20:53','sysadmin','sysadmin'),(12,11,'What is ORAM and how it is used',0,0,2,1,'2020-11-22 06:52:00','2020-11-22 01:22:00','sysadmin','sysadmin');
/*!40000 ALTER TABLE `question_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_credentials`
--

DROP TABLE IF EXISTS `user_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_credentials` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(500) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  CONSTRAINT `user_email_fk` FOREIGN KEY (`user_email`) REFERENCES `users` (`user_email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_credentials`
--

LOCK TABLES `user_credentials` WRITE;
/*!40000 ALTER TABLE `user_credentials` DISABLE KEYS */;
INSERT INTO `user_credentials` VALUES (1,'arun9@node.com','$2b$10$DA9SWpvqs1Q6b7WGe7rsE./lIH6HBRxouSlsLWtg43zO9UVqDhi2W',1,'2020-11-14 13:44:19','2020-11-14 08:14:19'),(2,'arun11@node.com','$2b$10$nHh67n6Axqr8RUNoDmP4lelH2d4OtyMf01fBA7NP8SS',1,'2020-11-14 14:12:55','2020-11-14 08:42:55'),(3,'arun12@node.com','$2b$10$4n61gv.H8gTntyzXvoCvkuuA3i3jyHWD0DlMrx4n30/',1,'2020-11-14 14:13:06','2020-11-14 08:43:06'),(4,'arun14@node.com','$2b$10$P7.gZf7v3958NcWy8E3MWuthM74y6Pq2wHwIlJUovNu',1,'2020-11-14 14:33:33','2020-11-14 09:03:33'),(5,'arun15@node.com','$2b$10$J6njMcKfqClyjtyoVF1t6.7j3Y9g5CHtRpd1v3IlCsa',1,'2020-11-14 14:36:02','2020-11-14 09:06:02'),(6,'arun20@gmail.com','$2b$10$DHmkhyU9HdP.N5O9XdnvsOOkhR87PmNS2zYfaT51srZ',1,'2020-11-14 14:50:03','2020-11-14 09:20:03'),(7,'arun20@node.com','$2b$10$hp9sDW0BmzX6waT8uq9ULuHNYoI4zzscbM6/T25EES1',1,'2020-11-14 14:50:40','2020-11-14 09:20:40'),(8,'arun22@node.com','$2b$10$Tqrri0nZBBxw1.PYmtErh.dHOrDEoO/0HcNlBuhnVUO',1,'2020-11-14 14:52:07','2020-11-14 09:22:07'),(9,'arun24@node.com','$2b$10$soZ/jvv6Oy/NhuNFOBpWaegkJvTbM6C7U4xou1wZEK.',1,'2020-11-14 14:53:21','2020-11-14 09:23:21'),(10,'arun26@node.com','$2b$10$CpsUcKFHoajJNXt3v9yXWeJ9IgZYwgS4NOu4qg/YftQ',1,'2020-11-14 14:55:52','2020-11-14 09:25:52'),(11,'arun27@node.com','$2b$10$FQTLkr182ecKhxK9b0BACuxAi8iMTIPi69h0U4MqzWN',1,'2020-11-14 15:00:38','2020-11-14 09:30:38'),(12,'arnav11@node.com','$2b$10$sllpcHXvO.pO5IouID2fAOA5tFBmnPiOh9JwffQyvqi',1,'2020-11-14 15:21:55','2020-11-14 09:51:55'),(13,'arnav.mahajan.3@gmail.com','$2b$10$a/VALGIndEJz/U2YL8UJ5.BjUdD9NjpJKqlHXmLHhyW',1,'2020-11-14 15:29:21','2020-11-14 09:59:21'),(14,'arnav.mahajan.4@gmail.com','$2b$10$zlNxDSxHx4lGQ8sTejjhze5KSvxk4k.s3OyCkBnpvNY',1,'2020-11-14 15:30:49','2020-11-14 10:00:49'),(15,'arnav.mahajan.5@gmail.com','$2b$10$oGCYYPi6kAmpEj44zuBurOHcmXBQXomWEwf1IO8mJI7',1,'2020-11-14 15:32:10','2020-11-14 10:02:10'),(16,'arnav.mahajan.6@gmail.com','$2b$10$itCuHfXrg1b8kP3M4bdOreiGl7SxM5EOfXp8HyajSaf',1,'2020-11-14 15:33:55','2020-11-14 10:03:55'),(17,'arnav.mahajan.9@gmail.com','$2b$10$7tB9c/go97g1poD4d7DZW.qfzo1gkuTzV2k1pFiTT91',1,'2020-11-14 15:41:30','2020-11-14 10:11:30'),(18,'arnav.mahajan.10@gmail.com','$2b$10$C9iTJVZXzwFCU/D9.IgppO1rP3TNWLzUK3ShL0h3CVfPeaaCVHGhm',1,'2020-11-14 18:40:06','2020-11-14 13:10:06'),(19,'arnav.mahajan.11@gmail.com','$2b$10$vsaQe4aLln.0ugOgqhC8MeaJ2akgYtzRfskBGV4iBuOT98mMOZaX6',1,'2020-11-15 00:06:23','2020-11-14 18:36:23'),(20,'arnav.mahajan.12@gmail.com','$2b$10$DLZY7M/ZTZisuaGhNA31f.809BbZjAqKKI4wjEFyA8vjZbPw5VmN2',1,'2020-11-15 16:49:26','2020-11-15 11:19:26');
/*!40000 ALTER TABLE `user_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(75) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_dt` datetime NOT NULL,
  `updated_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_id_UNIQUE` (`users_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Arnav Mahajan','arun9@node.com',1,'2020-11-14 13:44:18','2020-11-14 08:14:18'),(2,'Ayush ','arun11@node.com',1,'2020-11-14 14:12:55','2020-11-14 08:42:55'),(3,'Sanchit','arun12@node.com',1,'2020-11-14 14:13:06','2020-11-14 08:43:06'),(4,'Naveen','arun14@node.com',1,'2020-11-14 14:33:32','2020-11-14 09:03:32'),(5,'Sanjeev','arun15@node.com',1,'2020-11-14 14:36:02','2020-11-14 09:06:02'),(6,'Arnav Mahajan','arun20@gmail.com',1,'2020-11-14 14:50:03','2020-11-14 09:20:03'),(7,'Arnav Mahajan','arun20@node.com',1,'2020-11-14 14:50:40','2020-11-14 09:20:40'),(8,'Arnav Mahajan','arun22@node.com',1,'2020-11-14 14:52:07','2020-11-14 09:22:07'),(9,'Arnav Mahajan','arun24@node.com',1,'2020-11-14 14:53:21','2020-11-14 09:23:21'),(10,'Arnav Mahajan','arun26@node.com',1,'2020-11-14 14:55:51','2020-11-14 09:25:51'),(11,'Arnav Mahajan','arun27@node.com',1,'2020-11-14 15:00:37','2020-11-14 09:30:37'),(12,'Arnav Mahajan','arnav11@node.com',1,'2020-11-14 15:21:55','2020-11-14 09:51:55'),(13,'Arnav Mahajan','arnav.mahajan.3@gmail.com',1,'2020-11-14 15:29:20','2020-11-14 09:59:20'),(14,'Arnav Mahajan','arnav.mahajan.4@gmail.com',1,'2020-11-14 15:30:49','2020-11-14 10:00:49'),(15,'Arnav Mahajan','arnav.mahajan.5@gmail.com',1,'2020-11-14 15:32:10','2020-11-14 10:02:10'),(16,'Arnav Mahajan','arnav.mahajan.6@gmail.com',1,'2020-11-14 15:33:55','2020-11-14 10:03:55'),(17,'Arnav Mahajan','arnav.mahajan.9@gmail.com',1,'2020-11-14 15:41:30','2020-11-14 10:11:30'),(18,'Arnav Mahajan','arnav.mahajan.10@gmail.com',1,'2020-11-14 18:40:06','2020-11-14 13:10:06'),(19,'Arnav Mahajan','arnav.mahajan.11@gmail.com',1,'2020-11-15 00:06:23','2020-11-14 18:36:23'),(20,'Arnav Mahajan','arnav.mahajan.12@gmail.com',1,'2020-11-15 16:49:25','2020-11-15 11:19:25');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'forum'
--

--
-- Dumping routines for database 'forum'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-22 18:31:03
