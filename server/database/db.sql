-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: msp
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atiende`
--

DROP TABLE IF EXISTS `atiende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atiende` (
  `ciM` int NOT NULL,
  `ciP` int NOT NULL,
  PRIMARY KEY (`ciM`,`ciP`),
  KEY `ciP` (`ciP`),
  CONSTRAINT `atiende_ibfk_1` FOREIGN KEY (`ciM`) REFERENCES `medico` (`ciM`),
  CONSTRAINT `atiende_ibfk_2` FOREIGN KEY (`ciP`) REFERENCES `paciente` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atiende`
--

LOCK TABLES `atiende` WRITE;
/*!40000 ALTER TABLE `atiende` DISABLE KEYS */;
INSERT INTO `atiende` VALUES (11111111,12345678);
/*!40000 ALTER TABLE `atiende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico` (
  `codigoDiag` int NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `complicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigoDiag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
INSERT INTO `diagnostico` VALUES (1,'COVID','Problemas respiratorios graves');
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecha_atencion`
--

DROP TABLE IF EXISTS `fecha_atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fecha_atencion` (
  `ciP` int NOT NULL,
  `ciM` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`ciP`,`ciM`,`fecha`),
  CONSTRAINT `fecha_atencion_ibfk_1` FOREIGN KEY (`ciP`, `ciM`) REFERENCES `atiende` (`ciP`, `ciM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecha_atencion`
--

LOCK TABLES `fecha_atencion` WRITE;
/*!40000 ALTER TABLE `fecha_atencion` DISABLE KEYS */;
INSERT INTO `fecha_atencion` VALUES (12345678,11111111,'2022-09-18'),(12345678,11111111,'2022-10-05');
/*!40000 ALTER TABLE `fecha_atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `codigo` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `cantCamas` int DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Hospital de Clinicas','Av. Italia 2870','24871515',342),(2,'Hospital de Maldonado','Ventura Alegre s/n y las Dalias','42232339',86),(3,'Hospital de San Carlos','Ceberio 1234','42667788',50),(4,'hospital evangelico','Montevideo','42226688',60),(5,'hospital evangelico','Colonia','45826688',60);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internado`
--

DROP TABLE IF EXISTS `internado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internado` (
  `codigoH` int NOT NULL,
  `codigoS` int NOT NULL,
  `ciP` int NOT NULL,
  PRIMARY KEY (`codigoH`,`codigoS`,`ciP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internado`
--

LOCK TABLES `internado` WRITE;
/*!40000 ALTER TABLE `internado` DISABLE KEYS */;
INSERT INTO `internado` VALUES (1,1,12345678);
/*!40000 ALTER TABLE `internado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `codigoLab` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`codigoLab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (101,'San Fernando','Camacho s/n','42234567'),(102,'BioEste','Perez del Puerto 789','42345678');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `nombre` varchar(30) DEFAULT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `ciM` int NOT NULL,
  PRIMARY KEY (`ciM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('Juan Lopez','Medicina General',11111111),('Maria Rios','Pediatra',22222222),('Juan Perez','Pediatra',33333333),('Maria Rios','Medicina General',44444444);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `ci` int NOT NULL,
  `registro` int DEFAULT NULL,
  `nroCama` int DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `fechaRegistro` date DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (12345678,1,1,'Carlos','San Carlos 879','1998-07-03','M'),(23456789,2,2,'Ana Gimenez','18 de Julio 354','1970-01-31','F');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_diagnostico`
--

DROP TABLE IF EXISTS `paciente_diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_diagnostico` (
  `ciP` int NOT NULL,
  `codigoDiag` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`ciP`,`codigoDiag`,`fecha`),
  KEY `codigoDiag` (`codigoDiag`),
  CONSTRAINT `paciente_diagnostico_ibfk_1` FOREIGN KEY (`ciP`) REFERENCES `paciente` (`ci`),
  CONSTRAINT `paciente_diagnostico_ibfk_2` FOREIGN KEY (`codigoDiag`) REFERENCES `diagnostico` (`codigoDiag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_diagnostico`
--

LOCK TABLES `paciente_diagnostico` WRITE;
/*!40000 ALTER TABLE `paciente_diagnostico` DISABLE KEYS */;
INSERT INTO `paciente_diagnostico` VALUES (12345678,1,'2022-10-05');
/*!40000 ALTER TABLE `paciente_diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `codigoH` int NOT NULL,
  `codigoS` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cantCamas` int DEFAULT NULL,
  PRIMARY KEY (`codigoH`,`codigoS`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`codigoH`) REFERENCES `hospital` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,1,'CTI',5),(1,2,'Intermedio',8),(1,3,'General',15),(2,1,'CTI',2),(2,4,'Pediatria',3);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajaHL`
--

DROP TABLE IF EXISTS `trabajaHL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajaHL` (
  `codigoH` int NOT NULL,
  `codigoLab` int NOT NULL,
  PRIMARY KEY (`codigoH`,`codigoLab`),
  KEY `codigoLab` (`codigoLab`),
  CONSTRAINT `trabajaHL_ibfk_1` FOREIGN KEY (`codigoH`) REFERENCES `hospital` (`codigo`),
  CONSTRAINT `trabajaHL_ibfk_2` FOREIGN KEY (`codigoLab`) REFERENCES `laboratorio` (`codigoLab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajaHL`
--

LOCK TABLES `trabajaHL` WRITE;
/*!40000 ALTER TABLE `trabajaHL` DISABLE KEYS */;
INSERT INTO `trabajaHL` VALUES (1,101),(2,101),(1,102);
/*!40000 ALTER TABLE `trabajaHL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajaHM`
--

DROP TABLE IF EXISTS `trabajaHM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajaHM` (
  `codigoH` int DEFAULT NULL,
  `ciM` int NOT NULL,
  PRIMARY KEY (`ciM`),
  KEY `codigoH` (`codigoH`),
  CONSTRAINT `trabajaHM_ibfk_1` FOREIGN KEY (`codigoH`) REFERENCES `hospital` (`codigo`),
  CONSTRAINT `trabajaHM_ibfk_2` FOREIGN KEY (`ciM`) REFERENCES `medico` (`ciM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajaHM`
--

LOCK TABLES `trabajaHM` WRITE;
/*!40000 ALTER TABLE `trabajaHM` DISABLE KEYS */;
INSERT INTO `trabajaHM` VALUES (1,11111111),(1,44444444),(2,22222222);
/*!40000 ALTER TABLE `trabajaHM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabaja_servicio`
--

DROP TABLE IF EXISTS `trabaja_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabaja_servicio` (
  `codigoH` int NOT NULL,
  `codigoLab` int NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`codigoH`,`codigoLab`,`descripcion`,`fecha`),
  CONSTRAINT `trabaja_servicio_ibfk_1` FOREIGN KEY (`codigoH`, `codigoLab`) REFERENCES `trabajaHL` (`codigoH`, `codigoLab`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabaja_servicio`
--

LOCK TABLES `trabaja_servicio` WRITE;
/*!40000 ALTER TABLE `trabaja_servicio` DISABLE KEYS */;
INSERT INTO `trabaja_servicio` VALUES (1,101,'Ibuprofeno','2022-09-03');
/*!40000 ALTER TABLE `trabaja_servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 20:28:39
