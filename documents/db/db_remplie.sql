CREATE DATABASE  IF NOT EXISTS `book_hunter_2025` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book_hunter_2025`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: book_hunter_2025
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `biography` text,
  `picture` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Stephen','King','Auteur de nombreux romans d\'horreur marqués par une atmosphère oppressante.','stephen_king.jpg','2025-04-09 10:50:00'),(2,'Agatha','Christie','Reconnue mondialement pour ses intrigues policières et son célèbre détective Hercule Poirot.','agatha_christie.jpg','2025-04-09 10:51:00'),(3,'J.K.','Rowling','Auteure de la saga Harry Potter qui a marqué toute une génération.','jk_rowling.jpg','2025-04-09 10:52:00'),(4,'George','Orwell','Auteur dystopique, connu pour ses critiques sociales dans 1984 et La Ferme des animaux.','george_orwell.jpg','2025-04-09 10:53:00'),(5,'J.R.R.','Tolkien','Auteur et philologue, créateur de l’univers riche de la Terre du Milieu.','tolkien.jpg','2025-04-09 10:54:00');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isbn` varchar(45) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover` varchar(45) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn_UNIQUE` (`isbn`),
  KEY `fk_books_categories1_idx` (`category_id`),
  KEY `fk_books_authors1_idx` (`author_id`),
  CONSTRAINT `fk_books_authors1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'9780307743657','The Shining','the_shining.jpg','Un hôtel isolé et une atmosphère oppressante dévoilent une histoire de folie.','2025-04-09 11:10:00',5,1),(2,'9780007119318','Murder on the Orient Express','orient_express.jpg','Le célèbre détective Hercule Poirot enquête sur un meurtre dans un train luxueux.','2025-04-09 11:11:00',3,2),(3,'9780747532743','Harry Potter and the Philosopher\'s Stone','hp1.jpg','Le début de la saga d’un jeune sorcier découvrant ses pouvoirs dans un monde magique.','2025-04-09 11:12:00',4,3),(4,'9780451524935','1984','1984.jpg','Un regard sévère sur un futur totalitaire où la liberté individuelle est écrasée.','2025-04-09 11:13:00',2,4),(5,'9780451526342','Animal Farm','animal_farm.jpg','Une fable politique dépeignant une révolution qui tourne mal, critique du pouvoir totalitaire.','2025-04-09 11:14:00',1,4),(6,'9780048231886','The Hobbit','the_hobbit.jpg','L\'aventure d\'un hobbit qui se retrouve embarqué dans une quête épique au cœur de la Terre du Milieu.','2025-04-09 11:15:00',4,5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_tags`
--

DROP TABLE IF EXISTS `books_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_has_tags` (
  `book_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`book_id`,`tag_id`),
  KEY `fk_books_has_tags_tags1_idx` (`tag_id`),
  KEY `fk_books_has_tags_books_idx` (`book_id`),
  CONSTRAINT `fk_books_has_tags_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_tags_tags1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_tags`
--

LOCK TABLES `books_has_tags` WRITE;
/*!40000 ALTER TABLE `books_has_tags` DISABLE KEYS */;
INSERT INTO `books_has_tags` VALUES (1,1,'2025-04-09 11:40:00'),(1,5,'2025-04-09 11:41:00'),(2,4,'2025-04-09 11:43:00'),(2,5,'2025-04-09 11:42:00'),(3,2,'2025-04-09 11:44:00'),(3,3,'2025-04-09 11:45:00'),(4,4,'2025-04-09 11:46:00'),(5,4,'2025-04-09 11:47:00'),(5,5,'2025-04-09 11:48:00'),(6,3,'2025-04-09 11:49:00'),(6,4,'2025-04-09 11:50:00');
/*!40000 ALTER TABLE `books_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Roman','2025-04-09 11:00:00'),(2,'Science-fiction','2025-04-09 11:01:00'),(3,'Policier','2025-04-09 11:02:00'),(4,'Fantastique','2025-04-09 11:03:00'),(5,'Horreur','2025-04-09 11:04:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `book_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `value` tinyint(1) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`book_id`,`user_id`),
  KEY `fk_books_has_users_users1_idx` (`user_id`),
  KEY `fk_books_has_users_books1_idx` (`book_id`),
  CONSTRAINT `fk_books_has_users_books1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_users_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,5,'2025-04-09 11:55:00'),(1,2,4,'2025-04-09 11:56:00'),(2,1,4,'2025-04-09 11:57:00'),(2,3,5,'2025-04-09 11:58:00'),(3,2,5,'2025-04-09 11:59:00'),(4,1,3,'2025-04-09 12:00:00'),(5,3,4,'2025-04-09 12:01:00'),(6,2,5,'2025-04-09 12:02:00'),(6,3,4,'2025-04-09 12:03:00');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Suspense','2025-04-09 11:30:00'),(2,'Magie','2025-04-09 11:31:00'),(3,'Aventure','2025-04-09 11:32:00'),(4,'Classique','2025-04-09 11:33:00'),(5,'Intrigue','2025-04-09 11:34:00');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john_doe','john@example.com','hashed_password_1','2025-04-09 11:20:00'),(2,'jane_smith','jane@example.com','hashed_password_2','2025-04-09 11:21:00'),(3,'alice_wonder','alice@example.com','hashed_password_3','2025-04-09 11:22:00');
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

-- Dump completed on 2025-11-18  8:39:33
