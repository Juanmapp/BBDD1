CREATE DATABASE  IF NOT EXISTS `la_aprobacion` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `la_aprobacion`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: la_aprobacion
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `legajo` int NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `documento` int NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_estado` tinyint NOT NULL,
  `id_sector` tinyint NOT NULL,
  `id_pais` tinyint NOT NULL,
  PRIMARY KEY (`legajo`),
  UNIQUE KEY `legajo_UNIQUE` (`legajo`),
  UNIQUE KEY `documento_UNIQUE` (`documento`),
  KEY `fk_empleados_estado_idx` (`id_estado`),
  KEY `fk_empleados_sector1_idx` (`id_sector`),
  KEY `fk_empleados_pais1_idx` (`id_pais`),
  CONSTRAINT `fk_empleados_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `fk_empleados_pais1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`),
  CONSTRAINT `fk_empleados_sector1` FOREIGN KEY (`id_sector`) REFERENCES `sector` (`id_sector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-23  0:59:06
