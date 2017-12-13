CREATE DATABASE  IF NOT EXISTS `libraryeval` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `libraryeval`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: libraryeval
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `_auteur`
--

DROP TABLE IF EXISTS `_auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_auteur` (
  `Annee_naissance` int(11) DEFAULT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`),
  CONSTRAINT `FK__Auteur_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_auteur`
--

LOCK TABLES `_auteur` WRITE;
/*!40000 ALTER TABLE `_auteur` DISABLE KEYS */;
INSERT INTO `_auteur` VALUES (1885,1),(1973,2),(1965,3),(1966,4),(1973,5),(1622,16),(1981,17),(1942,19),(1930,21),(1970,22),(1968,23),(1962,24),(1970,26),(1968,27),(1973,28),(1990,30),(1962,33),(1920,34),(1968,35),(1820,36),(1875,39);
/*!40000 ALTER TABLE `_auteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_collection`
--

DROP TABLE IF EXISTS `_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_collection` (
  `Nom_collection` varchar(25) NOT NULL,
  PRIMARY KEY (`Nom_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_collection`
--

LOCK TABLES `_collection` WRITE;
/*!40000 ALTER TABLE `_collection` DISABLE KEYS */;
INSERT INTO `_collection` VALUES ('Classique'),('Documentaire'),('Jeunesse'),('Roman'),('Science Fiction');
/*!40000 ALTER TABLE `_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ecrit`
--

DROP TABLE IF EXISTS `_ecrit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_ecrit` (
  `ISBN` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`ISBN`,`id_personne`),
  KEY `FK___Ecrit_id_personne` (`id_personne`),
  CONSTRAINT `FK___Ecrit_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `_livre` (`ISBN`),
  CONSTRAINT `FK___Ecrit_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ecrit`
--

LOCK TABLES `_ecrit` WRITE;
/*!40000 ALTER TABLE `_ecrit` DISABLE KEYS */;
INSERT INTO `_ecrit` VALUES (4,1),(14,1),(121212,1),(7,2),(56456465,2),(1,3),(2,4),(5,5),(6,5),(15,16),(9356,16),(93112,16),(11,17),(112,17),(113,17),(114,17),(115,17),(116,17),(117,17),(221,17),(222,17),(223,17),(224,17),(225,17),(4949,17),(12131,17),(1113131,17),(111312313,17),(123123132,17),(79,19),(120,21),(111,23),(99,24),(2510,26),(3,27),(8,27),(411,27),(13,28),(1364646,30),(7587989,33),(797979,34),(151511631,35),(546464646,36),(7897979,39);
/*!40000 ALTER TABLE `_ecrit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_emprunte`
--

DROP TABLE IF EXISTS `_emprunte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_emprunte` (
  `id_personne` int(11) NOT NULL,
  `Id_exemplaire` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`,`Id_exemplaire`,`ISBN`),
  KEY `FK__Emprunte_Id_exemplaire` (`Id_exemplaire`),
  KEY `FK__Emprunte_ISBN` (`ISBN`),
  CONSTRAINT `FK__Emprunte_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `_livre` (`ISBN`),
  CONSTRAINT `FK__Emprunte_Id_exemplaire` FOREIGN KEY (`Id_exemplaire`) REFERENCES `_exemplaire` (`Id_exemplaire`),
  CONSTRAINT `FK__Emprunte_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_emprunte`
--

LOCK TABLES `_emprunte` WRITE;
/*!40000 ALTER TABLE `_emprunte` DISABLE KEYS */;
INSERT INTO `_emprunte` VALUES (31,6,5),(15,21,111),(25,42,13),(6,50,115),(15,54,117),(31,58,222),(31,62,224),(31,92,4),(31,93,7),(42,102,797979),(38,105,151511631),(11,114,4),(8,127,4),(15,132,7897979);
/*!40000 ALTER TABLE `_emprunte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_emprunteur`
--

DROP TABLE IF EXISTS `_emprunteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_emprunteur` (
  `Emprunt_possible` tinyint(1) DEFAULT NULL,
  `nbre_emprunt_en_cours` int(11) DEFAULT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_personne`),
  CONSTRAINT `FK__Emprunteur_id_personne` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_emprunteur`
--

LOCK TABLES `_emprunteur` WRITE;
/*!40000 ALTER TABLE `_emprunteur` DISABLE KEYS */;
INSERT INTO `_emprunteur` VALUES (1,1,6),(1,1,8),(1,1,11),(1,3,15),(1,1,25),(1,5,31),(1,1,38),(1,0,40),(1,0,41),(1,1,42),(1,0,43);
/*!40000 ALTER TABLE `_emprunteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_exemplaire`
--

DROP TABLE IF EXISTS `_exemplaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_exemplaire` (
  `Id_exemplaire` int(11) NOT NULL AUTO_INCREMENT,
  `Disponible` tinyint(1) DEFAULT NULL,
  `Info_exemplaire` varchar(25) DEFAULT NULL,
  `ISBN` int(11) NOT NULL,
  PRIMARY KEY (`Id_exemplaire`,`ISBN`),
  KEY `FK__Exemplaire_ISBN` (`ISBN`),
  CONSTRAINT `FK__Exemplaire_ISBN` FOREIGN KEY (`ISBN`) REFERENCES `_livre` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_exemplaire`
--

LOCK TABLES `_exemplaire` WRITE;
/*!40000 ALTER TABLE `_exemplaire` DISABLE KEYS */;
INSERT INTO `_exemplaire` VALUES (1,1,' en stock',1),(2,1,'en stock',2),(6,0,'en stock',5),(7,1,'en stock',6),(9,1,'en stock',8),(10,1,'en stock',15),(11,1,'en stock',11),(14,1,'en stock',79),(18,1,'en stock',120),(21,0,'en stock',111),(22,1,'en stock',111),(23,1,'en stock',79),(25,1,'en stock',99),(26,1,'en stock',99),(28,1,'en stock',2510),(29,1,'en stock',2510),(39,1,'en stock',3),(42,0,'en stock',13),(44,1,'en stock',112),(46,1,'en stock',113),(48,1,'en stock',114),(50,0,'en stock',115),(52,1,'en stock',116),(54,0,'en stock',117),(56,1,'en stock',221),(58,0,'en stock',222),(60,1,'en stock',223),(62,0,'en stock',224),(64,1,'en stock',225),(72,1,'en stock',93112),(74,1,'en stock',9356),(76,1,'en stock',1113131),(78,1,'en stock',123123132),(80,1,'en stock',111312313),(81,1,'en stock',1),(83,1,'en stock',14),(85,1,'en stock',1364646),(86,1,'en stock',1364646),(88,1,'en stock',4949),(90,1,'en stock',411),(91,1,'en stock',411),(92,0,'en stock',4),(93,0,'en stock',7),(98,1,'en stock',7587989),(99,1,'en stock',7587989),(102,0,'en stock',797979),(103,1,'en stock',797979),(105,0,'en stock',151511631),(106,1,'en stock',151511631),(108,1,'en stock',121212),(109,1,'en stock',121212),(111,1,'en stock',546464646),(112,1,'en stock',546464646),(113,1,'en stock',546464646),(114,0,'en stock',4),(116,1,'en stock',112),(119,1,'en stock',112),(123,1,'en stock',56456465),(126,1,'en stock',7897979),(127,0,'en stock',4),(128,1,'en stock',2),(129,1,'en stock',4),(130,1,'en stock',1),(131,1,'en stock',56456465),(132,0,'en stock',7897979),(133,1,'en stock',3),(136,1,'en stock',12131);
/*!40000 ALTER TABLE `_exemplaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_livre`
--

DROP TABLE IF EXISTS `_livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_livre` (
  `ISBN` int(11) NOT NULL,
  `Titre_livre` varchar(25) DEFAULT NULL,
  `Sous_titre` varchar(25) DEFAULT NULL,
  `Nbre_exemplaire` int(11) DEFAULT NULL,
  `Disponible_emprunt` tinyint(1) DEFAULT NULL,
  `Nom_collection` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `FK__Livre_Nom_collection` (`Nom_collection`),
  CONSTRAINT `FK__Livre_Nom_collection` FOREIGN KEY (`Nom_collection`) REFERENCES `_collection` (`Nom_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_livre`
--

LOCK TABLES `_livre` WRITE;
/*!40000 ALTER TABLE `_livre` DISABLE KEYS */;
INSERT INTO `_livre` VALUES (1,'Le jeu de l ange',NULL,3,1,'Roman'),(2,'La compagnie',NULL,2,1,'Roman'),(3,'underworld usa','',2,1,'Roman'),(4,'Les miserables','',4,1,'Classique'),(5,'Le livre de Dave',NULL,1,1,'Roman'),(6,'No smoking',NULL,1,1,'Roman'),(7,'Vendetta','',2,1,'Roman'),(8,'LA confidential',NULL,1,1,'Roman'),(11,'java','pour les naze',1,1,'Documentaire'),(13,'chat noir','chat blanc',1,1,'Roman'),(14,'notre dame','de paris',1,1,'Classique'),(15,'l avare','',1,1,'Classique'),(79,'Martine a l afpa','soustitre',2,1,'Jeunesse'),(99,'mort ou vif','',4,1,'Roman'),(111,'da vinci code','',1,1,'Science Fiction'),(112,'html ','et css 3',3,1,'Documentaire'),(113,'javascript','et css',1,1,'Documentaire'),(114,'mySql','',1,1,'Documentaire'),(115,'xml','modele conceptuel',1,1,'Documentaire'),(116,'html5','exercices',1,1,'Documentaire'),(117,'c++','',1,1,'Documentaire'),(120,'sur la route','',1,1,'Roman'),(221,'algo','en chanson',1,1,'Documentaire'),(222,'algo','en mime',1,1,'Documentaire'),(223,'Html 5','en mimes',1,1,'Documentaire'),(224,'MySql','en chanson',1,1,'Documentaire'),(225,'xml','en mime',1,1,'Documentaire'),(411,'perfidia','',2,1,'Roman'),(1313,'java','swing',1,1,'Documentaire'),(2510,'Star wars','rogue one',2,1,'Science Fiction'),(4949,'java','en signeau de fum�e',1,1,'Documentaire'),(9356,'tartuffe','',1,1,'Classique'),(12131,'spring','et boot',1,1,'Documentaire'),(93112,'les fourberies','de scapin',1,1,'Classique'),(121212,'l homme qui rit','',2,1,'Classique'),(797979,'le livre de la jungle','',2,1,'Classique'),(1113131,'java','a la flute',1,1,'Documentaire'),(1364646,'toto','a l afpa',2,1,'Jeunesse'),(7587989,'Le seigneur des anneaux','',2,1,'Jeunesse'),(7897979,'Croc Blanc','',2,1,'Classique'),(56456465,'les anges de new york','',2,1,'Roman'),(111312313,'java','en morse',1,1,'Documentaire'),(123123132,'java','en braille',1,1,'Documentaire'),(151511631,'Part vite et reviens tard','',2,1,'Roman'),(546464646,'Les Hauts de Hurlevent','',3,1,'Classique');
/*!40000 ALTER TABLE `_livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personne` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (1,'Victor','Hugo'),(2,'R.J','Ellory'),(3,'Zafon','Carlos'),(4,'Littel','Robert'),(5,'Self','Will'),(6,'Rogers','Steven'),(8,'Doe','Jann'),(11,'Zer','Yann'),(15,'Cruise','Tom'),(16,'moliere','m.'),(17,'mas','dom'),(19,'daltone','ma'),(21,'kerouac','jack'),(22,'brown','dan'),(23,'x','x'),(24,'tom','clancy'),(25,'Gros','Tony'),(26,'lucas','georges'),(27,'ellroy','james'),(28,'kusturisca','emir'),(30,'to','to'),(31,'Parker','Peter'),(33,'-','Tolkien'),(34,'Kipling','Rudyard'),(35,'Vargas','Fred'),(36,'bronte','emilie'),(38,'Stark','Tony'),(39,'jack','london'),(40,'Banner','Brice'),(41,'Kyle','Selina'),(42,'Gelly','Romain'),(43,'Pauo','Piu');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'libraryeval'
--

--
-- Dumping routines for database 'libraryeval'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 17:13:51
