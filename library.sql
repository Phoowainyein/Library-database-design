-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: final_assignment
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Garry','Kasparov'),(2,'Stef','Maruch'),(3,'Aahz','Maruch'),(4,'Robert','T. Kiyosaki'),(5,'Ashlee','Vance'),(6,'Henrik','Fexeus'),(7,'James','W. Nilsson'),(8,'Susan','Riedel');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(81) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `totalpages` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Deep Thinking','In May 1997 AI.',294,2018,4.5),(2,'Python for Dummies','quick-and-easy guide for beginners',432,2006,4.0),(3,'Rich Dad Poor Dad',NULL,336,2017,4.0),(4,'Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future',', Musk is the man behind PayPal, Tesla Motors, SpaceX, and SolarCity, each of which has sent shock waves throughout American business and industry',400,2015,3.5),(5,'Art of Reading Minds','The international bestselling guide to human behaviour',256,2020,3.0),(6,'Electric Circuits (11th Edition)',NULL,600,2020,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksbyAuthors`
--

DROP TABLE IF EXISTS `booksbyAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booksbyAuthors` (
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  KEY `bookId` (`bookId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `booksbyAuthors_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`),
  CONSTRAINT `booksbyAuthors_ibfk_2` FOREIGN KEY (`authorId`) REFERENCES `authors` (`authorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksbyAuthors`
--

LOCK TABLES `booksbyAuthors` WRITE;
/*!40000 ALTER TABLE `booksbyAuthors` DISABLE KEYS */;
INSERT INTO `booksbyAuthors` VALUES (1,1),(2,2),(2,3),(3,4),(4,5),(5,6),(6,7),(6,8);
/*!40000 ALTER TABLE `booksbyAuthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowedbyUsers`
--

DROP TABLE IF EXISTS `borrowedbyUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrowedbyUsers` (
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `issueDate` date NOT NULL,
  `loanisactive` tinyint(1) NOT NULL,
  `librarianId` int(11) NOT NULL,
  KEY `userId` (`userId`),
  KEY `bookId` (`bookId`),
  KEY `librarianId` (`librarianId`),
  CONSTRAINT `borrowedbyUsers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `borrowedbyUsers_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`),
  CONSTRAINT `borrowedbyUsers_ibfk_3` FOREIGN KEY (`librarianId`) REFERENCES `librarians` (`librarianId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowedbyUsers`
--

LOCK TABLES `borrowedbyUsers` WRITE;
/*!40000 ALTER TABLE `borrowedbyUsers` DISABLE KEYS */;
INSERT INTO `borrowedbyUsers` VALUES (4,5,'2019-10-06',1,2),(1,4,'2021-11-28',1,2),(6,1,'2021-12-04',1,1);
/*!40000 ALTER TABLE `borrowedbyUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `departmentId` int(11) NOT NULL,
  `departmentName` varchar(50) NOT NULL,
  PRIMARY KEY (`departmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Dept of liabrary & information Science'),(2,'Instituete of library Science');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarians`
--

DROP TABLE IF EXISTS `librarians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarians` (
  `librarianId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phoneNum` varchar(15) NOT NULL,
  `departmentId` int(11) NOT NULL,
  PRIMARY KEY (`librarianId`),
  UNIQUE KEY `firstName` (`firstName`,`lastName`,`phoneNum`),
  KEY `departmentId` (`departmentId`),
  CONSTRAINT `librarians_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarians`
--

LOCK TABLES `librarians` WRITE;
/*!40000 ALTER TABLE `librarians` DISABLE KEYS */;
INSERT INTO `librarians` VALUES (1,'Holly','Berger','812-964-322',1),(2,'Tim','Assmann','323-660-708',1),(3,'John','Fisher','417-456-982',2),(4,'Nicky','minaj','455-334-218',2),(5,'Bick','tomas','340-764-009',2);
/*!40000 ALTER TABLE `librarians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNum` varchar(25) NOT NULL,
  `street` varchar(40) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(4) NOT NULL,
  `zipcode` varchar(5) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `firstName` (`firstName`,`lastName`,`phoneNum`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Doc','Fisher','doc123@gmail.com','605-241-7536','107 Vine Street','Port Washington','NY','14217'),(2,'Pamella','Davies','pamella@aol.com','308-567-7424','769C Creek St.','Fairport','NY','11553'),(3,'Genovera','Wilson','wilson.G@google.com','830-835-8873','15 Yellow St.','Bufalo','NY','11372'),(4,'Pitbull','Johnson','pibull86@student.al.com','306-750-4887','476 Chestnut Ave','Morrone','NY','11050'),(5,'Latsha','Spenice','lat.Spe29@gmail.com','706-722-3659','910 Thorne Ave.','Sacramento','CA','10950'),(6,'Emma','Baldwin','Emma.baldwin@yahoo.com','662-823-6976','876 Spruce Drive St.','Jackson Heights','NY','11376');
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

-- Dump completed on 2021-11-29 14:23:50
