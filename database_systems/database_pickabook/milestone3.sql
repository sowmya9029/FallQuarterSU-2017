#################################################################################
#  ASSIGNNMENT: Milestone #3
#
#  DESCRIPTION: Creates the tables for our "Pickabook" ERD, populates them with
#  dummy data, and performs queries on the database.
#
#  FILE: milestone3_11212017.sql
#
#  AUTHOR: Sowmya Satyavada (satyavad@seattleu.edu) and Scott Moser 
#          (mosers1@seattleu.edu)
#################################################################################

# Commenting out due to access permissions on cssql.seattleu.edu database
#CREATE DATABASE IF NOT EXISTS `pickabook_schema` /*!40100 DEFAULT CHARACTER SET latin1 */;
#USE `pickabook_schema`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: pickabook_schema
-- ------------------------------------------------------
-- Server version	5.7.19

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

################################################################################
# PARTS I  & II: Table create and population
#################################################################################

# Unlock tables to be dropped so we can execute the script numerous times
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(45) DEFAULT NULL,
  `user_last_name` varchar(45) DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_type` varchar(45) DEFAULT NULL,
  `user_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'sowmya','satyavada','1234','sowmya@gmail.com','seller/buyer',NULL),(2,'scott','moser','1234','scott@gmail.com','buyer',NULL),(3,'harsha','sree','1234','harsha@gmail.com','seller/buyer',NULL),(4,'john','P','1234','jonh@gmail.com','buyer',NULL),(5,'Li','Lin','1234','li@seattleu.edu','buyer',NULL),(6,'Zin','Zhu','1223','zin@su.edu','seller',NULL),(7,'Oh','seila','4568','oh@su.edu','buyer',NULL),(8,'shivani','patinani','9876','shivani.yahoo.co.in','seller/buyer',NULL),(9,'rutu','bhatt','7654','rutu@gmail.com','seller',NULL),(10,'adam','tanaous','3456','adam@gmail.com','buyer',NULL),(11,'osama','johma','9873','osama@gmail.com','buyer',NULL),(12,'mark','hu','3456','mark.hu@gmiail.com','buyer',NULL),(13,'chi','wang','3456','chi@expedia.com','seller',NULL),(14,'namesh','kair','4567','nameh@gmail.com','seller/buyer',NULL),(15,'dan','lao','2567','dan@gmail.com','buyer',NULL),(16,'liz','johnson','1234','liz@gmail.com','seller',NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `auth_id` int(11) NOT NULL,
  `auth_first_name` varchar(45) NOT NULL,
  `auth_city` varchar(45) DEFAULT NULL,
  `auth_last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Henry','Bothell','Fielding'),(2,'Samuel','Bothell','Richardson'),(3,'Jonathan','Seattle','Swift'),(4,'Daniel','New York','Defoe'),(5,'John','New York','Bunyan'),(6,'Benjamin','New Jersey','Disraeli'),(7,'Thomos','New Jersey','Cormen'),(8,'sedney','Oregon','sheldon'),(9,'galye','Oregon','mcdowel'),(10,'alane','Oregon','moore'),(13,'jk','max','rowling');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_author` (
  `book_isbn` int(11) NOT NULL,
  `auth_id` int(11) NOT NULL,
  PRIMARY KEY (`book_isbn`,`auth_id`),
  KEY `auth_id` (`auth_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `authors` (`auth_id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1112,1),(1234,2),(1920,3),(1314,4),(1516,5),(2021,6),(2223,7),(5678,8),(1718,9),(8910,10),(5678,13);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_cart`
--

DROP TABLE IF EXISTS `book_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_cart` (
  `book_isbn` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`book_isbn`,`cart_id`),
  KEY `cart_id_idx` (`cart_id`),
  CONSTRAINT `book_isbn` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_cart`
--

LOCK TABLES `book_cart` WRITE;
/*!40000 ALTER TABLE `book_cart` DISABLE KEYS */;
INSERT INTO `book_cart` VALUES (1234,1),(1314,2),(2223,2),(1314,3),(1718,4),(2223,5),(1718,6),(1516,7),(1920,8),(1112,9),(2223,9),(1112,10);
/*!40000 ALTER TABLE `book_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_review`
--

DROP TABLE IF EXISTS `book_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_review` (
  `br_id` int(11) NOT NULL,
  `book_isbn` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `br_comment` varchar(1000) DEFAULT NULL,
  `br_rating` int(11) NOT NULL,
  PRIMARY KEY (`br_id`),
  KEY `book_isbn` (`book_isbn`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `book_review_ibfk_1` FOREIGN KEY (`book_isbn`) REFERENCES `books` (`book_isbn`),
  CONSTRAINT `book_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_review`
--

LOCK TABLES `book_review` WRITE;
/*!40000 ALTER TABLE `book_review` DISABLE KEYS */;
INSERT INTO `book_review` VALUES (1,1112,2,'never read this book',3,'wa'),(2,1234,4,'I dare you to try to find a boring portion of this book, because you won\'t--it is captivating from start to finish and able to be enjoyed by anyone. If you\'re looking for a great read for your vacation, a long ride in the car or just to read in bed each night-this is an excellent choice!\" Writing Tips',4,'ny'),(3,1314,5,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',1,'nj'),(4,1516,11,'A fan of Peter Savage novels since the release of the first novel by Dave Edlund, I couldn\'t pass up a great price for the four book set on iBooks. Now I have them on my iPad instead of carrying hard copies. With the holidays coming up, I couldn\'t think of a better gift for someone that likes action packed thrillers tied to current events. ',5,'wa'),(5,1718,12,'experience it your self',5,'or'),(6,8910,14,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',4,'wa'),(7,1920,2,'What an experience it has been to read these novels! I am very happy to have been able to read them all at once because to me they are really one long book broken into four physically manageable sizes. The story Ferrante tells is compelling and moving and interesting all the way through (and if, as a non-Italian reader, ',5,'fl'),(8,5678,5,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',3,'or'),(9,2021,7,'I found her main character really irritating, self absorbed and unsympathetic . She shows virtually no warmth to her children and only once mentions playing with the youngest. I felt there were 2 books too many. The first book was lively and interesting with a full range of credible characters. The 2nd book was less so. By the 3rd I\'d had enough of Elena. ',5,'ty'),(10,2223,1,'This author is a hard worker who does his research and the book\'s premise was interesting. Unfortunately, his writing never rises above cliche level. Sadly, after reading the first of the four books (I could not pass up the great price which I found on Bookbub.com) I never went back for books 2, 3 and 4. The first level thriller writers like Silva, Connelly and Childs can flat do it. This guy can\'t.',4,'wa');
/*!40000 ALTER TABLE `book_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_isbn` int(11) NOT NULL,
  `user_seller_id` int(11) DEFAULT NULL,
  `book_title` varchar(45) NOT NULL,
  `book_edition_num` int(11) DEFAULT NULL,
  `book_short_desc` varchar(145) NOT NULL,
  `book_long_desc` varchar(1000) DEFAULT NULL,
  `book_genre` varchar(45) NOT NULL,
  `book_cover_type` varchar(45) NOT NULL,
  `book_price` double NOT NULL,
  `book_publisher` varchar(45) NOT NULL,
  `book_publish_year` varchar(45) NOT NULL,
  `book_language` varchar(45) NOT NULL,
  PRIMARY KEY (`book_isbn`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`user_seller_id`) 
REFERENCES `Users` (`user_id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1112,1,'java',1,'book short description2',NULL,'education','type1',100,'publisher1','1998','english'),(1234,6,'DatabaseSystems',2,'book short description1','testing ashdb tadsvv','education','cover type6',100,'publisher2','2001','engish'),(1314,1,'the hunger games',2,'awesome book ',NULL,'education','cover type1',600,'publisher1','2013','chinese'),(1516,3,'catching fire',34,'must read','aghshdgsv gfafsf','thriller','type2',300,'publisher12','2005','french'),(1718,8,'harry potter',65,'blah blah blah','ong descrption 1','tragedy','type4',100,'publisher4','1990','hindi'),(1920,14,'breadking dawn',4,'must read book',NULL,'fiction','type7',500,'publisher19','1907','english'),(2021,8,'mockingjay',32,'mind blowing suspense',NULL,'fiction','cover type9',200,'publisher9','1897','english'),(2223,13,'eclipse',7,'qwerty',NULL,'fiction','cover type1',200,'publisher6','1987','french'),(5678,13,'comic book1',3,'blah blah blah',NULL,'comic','type3',600,'publisher8','1865','hindi'),(8910,16,'horror book1',4,'testing 1234','dassas faddfd eafdfdfds asdda ','thriller','cover type12',400,'publisher0','2016','spanich'),(9876,6,'comic',6,'this is short description',NULL,'comic','non',53,'publisher6','2017','hindi');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart_shiping_speed` varchar(45) NOT NULL,
  PRIMARY KEY (`cart_id`),
  CONSTRAINT `cart_user_id_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2,'6 days'),(2,4,'2 days'),(3,5,'7 days'),(4,11,'1 day'),(5,19,'1 day'),(6,20,'2 weeks'),(7,18,'3 days'),(8,11,'1 day'),(9,4,'1 day'),(10,2,'2 days');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `user_id` int(11) DEFAULT NULL,
  `cc_holdername` varchar(45) NOT NULL,
  `cc_num` int(30) NOT NULL,
  `cc_exp_date` varchar(45) NOT NULL,
  `cc_bill_street_addr` varchar(45) NOT NULL,
  `cc_bill_zip_code` int(11) NOT NULL,
  `cc_bill_state` varchar(45) NOT NULL,
  `cc_cvv` int(3) NOT NULL,
  PRIMARY KEY (`cc_num`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (7,'oh sheila',9876567,'05/19/2021','address7',98765,'or',432),(1,'sowmya satyavda',87654390,'12/09/2008','address9',65432,'ca',667),(4,'john l',123457920,'11/08/2019','address1',78293,'ny',123),(2,'scott',345678902,'05/09/2025','address5',98012,'fl',111),(10,'adam',354728420,'04/19/2017','address2',12345,'nj',456),(5,'li lin',472467328,'11/18/2018','address3',98022,'wa',345),(15,'sree',763252830,'09/01/2013','address8',56793,'ca',123),(3,'harsha',765432190,'09/03/2022','address6',98011,'nv',908),(15,'dan lao',876540981,'01/08/2020','address8',56793,'ca',654),(12,'mark hu',1234567890,'05/19/2019','address4',56345,'tx',567),(8,'shivani',1276534987,'09/08/2016','address10',76534,'ar',898);
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_item`
--

DROP TABLE IF EXISTS `line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_item` (
  `order_id` int(11) NOT NULL,
  `line_item_num` int(11) NOT NULL,
  `book_isbn` int(11) NOT NULL,
  `line_item_price` double NOT NULL,
  `line_item_quantity` int(11) NOT NULL,
  `line_item_total` double NOT NULL,
  PRIMARY KEY (`order_id`,`line_item_num`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_item`
--

LOCK TABLES `line_item` WRITE;
/*!40000 ALTER TABLE `line_item` DISABLE KEYS */;
INSERT INTO `line_item` VALUES (1,123,1112,100,3,300),(2,234,1234,100,2,200),(3,432,1718,100,1,100),(4,543,2223,200,6,1200),(4,610,9876,53,1,54),(5,546,1516,300,1,300),(6,876,5678,600,1,600),(7,367,8910,400,3,600),(8,234,1314,300,2,600),(9,543,1920,500,5,2500),(10,789,2021,200,5,2500);
/*!40000 ALTER TABLE `line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `os_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `os_payment_status` varchar(45) NOT NULL,
  `order_shipping_status` varchar(45) NOT NULL,
  `os_est_arrival_date` date DEFAULT NULL,
  PRIMARY KEY (`os_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,2,'completed','delivered','2025-06-12'),(2,1,'cancelled','pending','2019-06-12'),(3,3,'cancelled','pending','2018-01-18'),(4,5,'completed','delivered','2012-12-11'),(5,6,'completed','shipping','2025-06-12'),(6,4,'completed','delivered','2017-04-21'),(7,7,'completed','shipping','2023-06-21'),(8,8,'cancelled','pending','2025-06-12'),(9,9,'completed','shipping','2017-04-21'),(10,10,'completed','delivered','2017-04-22');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `order_date` date NOT NULL,
  `order_shipping_cost` double NOT NULL,
  `order_tax` double NOT NULL,
  `order_total` double NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2017-08-11',234,34,268),(2,2,'2016-08-13',45,5,50),(3,5,'2001-08-16',123,23,126),(4,7,'2013-08-09',543,43,586),(5,4,'2017-08-11',20,20,40),(6,10,'2012-07-06',290,12,302),(7,6,'2011-12-09',534,23,557),(8,9,'2019-08-16',876,31,907),(9,8,'2010-07-17',1345,54,1399),(10,3,'2006-05-06',32,1,33),(11,1,'2017-08-11',1111,23,1134);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_address` (
  `ship_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ship_street_addr` varchar(100) DEFAULT NULL,
  `ship_zip_code` int(11) DEFAULT NULL,
  `ship_state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ship_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `shipping_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` VALUES (1,3,'address8',12343,'wa'),(2,4,'address1',34565,'wa'),(3,5,'address1',34565,'wa'),(4,2,'address7',32455,'ca'),(5,7,'address1',34565,'wa'),(6,11,'address9',98003,'fl'),(7,12,'address6',98012,'ny'),(8,13,'address3',54678,'nj'),(9,14,'address1',34565,'or'),(10,15,'address2',23986,'ca');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pickabook_schema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 15:39:14
