-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: arsky
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `ID` varchar(45) NOT NULL,
  `Asiento_Clase` int(11) DEFAULT NULL,
  `Avion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES ('A1',1,'AB1234'),('A2',1,'AB1234'),('B1',2,'AB1234'),('B2',2,'AB1234'),('C1',3,'AB1234'),('C2',3,'AB1234');
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aviones`
--

DROP TABLE IF EXISTS `aviones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aviones` (
  `Matrícula` varchar(6) NOT NULL,
  `Modelo` varchar(45) DEFAULT NULL,
  `Asientos_Primera` int(11) DEFAULT NULL,
  `Asientos_Bussiness` int(11) DEFAULT NULL,
  `Asientos_Economica` int(11) DEFAULT NULL,
  PRIMARY KEY (`Matrícula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aviones`
--

LOCK TABLES `aviones` WRITE;
/*!40000 ALTER TABLE `aviones` DISABLE KEYS */;
INSERT INTO `aviones` VALUES ('AB1234','Boeing 737',12,30,150),('CD5678','Airbus A320',10,20,180),('EF9012','Boeing 747',20,50,300),('GH3456','Airbus A380',30,70,400),('IJ7890','Boeing 787',15,35,250),('KL1234','Embraer 190',5,15,80);
/*!40000 ALTER TABLE `aviones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boleto`
--

DROP TABLE IF EXISTS `boleto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleto` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Precio` int(11) DEFAULT NULL,
  `Vuelo_ID` int(11) DEFAULT NULL,
  `Compra_ID` int(11) DEFAULT NULL,
  `Asiento_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Compra_ID_idx` (`Compra_ID`),
  KEY `Vuelo_ID_idx` (`Vuelo_ID`),
  CONSTRAINT `Compra_ID` FOREIGN KEY (`Compra_ID`) REFERENCES `compra` (`ID`),
  CONSTRAINT `Vuelo_ID` FOREIGN KEY (`Vuelo_ID`) REFERENCES `vuelo` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleto`
--

LOCK TABLES `boleto` WRITE;
/*!40000 ALTER TABLE `boleto` DISABLE KEYS */;
INSERT INTO `boleto` VALUES (1,500000,13,5,'A2'),(2,500000,13,6,'A2'),(3,500000,13,7,'A2'),(18,500000,7,23,'A2'),(19,500000,7,24,'A2'),(20,500000,7,25,'A2'),(21,500000,7,26,'A2');
/*!40000 ALTER TABLE `boleto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Económica','500000'),(2,'Primera','1000000'),(3,'Bussiness','2000000');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Contrasenia` text DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,'Pepito','ui',456,NULL,'2024-09-11','clave'),(455,'Hernesto','Halphonso',911,NULL,'2025-12-01','clave'),(678,'Pepito','fefwfwf',8766,NULL,'2024-09-03','$2y$10$V4XvRsuTbewhkdyuFw54pubmCHW6dbg6mueI0W0uMnMXPIAIqIyXi'),(777,'exaple','alibaba',3445565,NULL,'2345-05-31','clave'),(987,'messian','oiuábo',234,'info@gmail.com','2024-09-11','$2y$10$i36tgqRoudyx5MGp/fP2BO8HvMRf1Ux21ILiGVxz4eabwPQPjzoYO'),(12345678,'Juan Cruz','Melgarejo',45,NULL,'2024-09-20','clave'),(22222222,'Magali','Cristobo',32323,NULL,'2003-04-28','$2y$10$sM.9DrDEIwr8YsJUebr9AeLoPIs0JjyveXeAuMc2ep6TYuGquaIie'),(48386010,'Santino','Vuotto',2147483647,NULL,'2007-11-10','$2y$10$J2x4Q8aIOYnMmAMWQOwIDukICC9eockdoQZRcgEtAZSA053cUiEdu');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad_Cuotas` int(11) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Cliente_ID` int(11) DEFAULT NULL,
  `Tarjeta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Cliente_ID` (`Cliente_ID`),
  KEY `Tarjeta_ibfk_1_idx` (`Tarjeta`),
  CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`DNI`),
  CONSTRAINT `Tarjeta` FOREIGN KEY (`Tarjeta`) REFERENCES `tarjeta` (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,6,'2024-10-04 00:00:00',22222222,'144'),(5,2,'2024-10-29',987,'1234 1234 1234 1234'),(6,2,'2024-10-29',987,'1234 1234 1234 1234'),(7,3,'2024-10-29',987,'1234 1234 1234 1234'),(8,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(9,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(10,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(11,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(12,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(13,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(14,5,'2024-10-30',48386010,'1234 1234 1234 1234'),(15,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(16,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(17,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(18,3,'2024-10-30',48386010,'1234 1234 1234 1234'),(19,3,'2024-10-30',48386010,'1234 1234 1234 1234'),(20,3,'2024-10-30',48386010,'1234 1234 1234 1234'),(21,3,'2024-10-30',48386010,'1234 1234 1234 1234'),(22,4,'2024-10-30',48386010,'1234 1234 1234 1234'),(23,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(24,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(25,2,'2024-10-30',48386010,'1234 1234 1234 1234'),(26,2,'2024-10-30',48386010,'1234 1234 1234 1234');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `ID` int(11) NOT NULL,
  `Provincia` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Buenos Aires','La provincia más poblada, con una rica historia cultural y económica.','https://www.cultura.gob.ar/media/uploads/91f015d450c077bf555c1956209375c2.jpg'),(2,'CABA','Capital del país, centro cultural y económico, famoso por su arquitectura y vida nocturna.','https://reportnews.la/wp-content/uploads/2020/07/caba.jpg'),(3,'Catamarca','Conocida por sus montañas y producción de frutas, especialmente aceitunas.','https://www.travelandes.com/img/GalleryContent/111871/catamarca_2.jpg'),(4,'Chaco','Famosa por sus bosques chaqueños y su producción agrícola.','https://www.serargentino.com/public/images/2020/07/15948465980-Chaco-773x458.jpg'),(5,'Chubut','Destacada por su costa atlántica y la biodiversidad de la Península Valdés.','https://media.airedesantafe.com.ar/p/934d0d409ff4eb32de5251238a3a6ebd/adjuntos/268/imagenes/003/663/0003663329/que-hacer-chubut-los-mejores-7-lugares-que-debes-visitar.png'),(6,'Córdoba','Cuna de la cultura argentina, famosa por su arquitectura colonial y montañas.','https://cordobaturismo.gov.ar/wp-content/uploads/2018/07/Ciudad-de-Cordoba-1-scaled-1.jpg'),(7,'Corrientes','Conocida por sus ríos y su tradición folklórica, especialmente el chamamé.','https://upload.wikimedia.org/wikipedia/commons/a/a3/Puente_General_Manuel_Belgrano.jpg'),(8,'Entre Ríos','Famosa por sus termas y producción agrícola, especialmente en arroz y citrus.','https://www.lapazentrerios.tur.ar/images/la-ciudad.jpg?v=1001'),(9,'Formosa','Conocida por su riqueza natural y su cultura indígena.','https://www.elcomercial.com.ar/content/bucket/3/18403w850h566c.jpg.webp'),(10,'Jujuy','Destacada por sus paisajes de montañas y su cultura indígena.','https://antiguatilcara.com.ar/image/blog_images/destinos-imperdibles-jujuy-750x350.jpg'),(11,'La Pampa','Conocida por sus vastas llanuras y la ganadería.','https://a.travel-assets.com/findyours-php/viewfinder/images/res70/86000/86493-La-Pampa-Province.jpg'),(12,'La Rioja','Famosa por su producción de vino y su paisaje montañoso.','https://media.airedesantafe.com.ar/p/1c6cc20129ad2c9b1c6ff9b86c9f2f0e/adjuntos/268/imagenes/003/661/0003661078/que-hacer-la-rioja-los-mejores-7-lugares-que-debes-visitar.png'),(13,'Mendoza','Renombrada por sus bodegas y producción de vino Malbec.','https://www.argentina.gob.ar/sites/default/files/2020/06/provincia-mendoza-jumbotron.jpg'),(14,'Misiones','Conocida por las Cataratas del Iguazú y su selva subtropical.','https://www.argentina.gob.ar/sites/default/files/cataratas_2.jpg'),(15,'Neuquén','Famosa por sus paisajes patagónicos y la producción de petróleo.','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRV2NRZM1yi_BLH4tqrRHMSw58luFJ75N-RA&s'),(16,'Río Negro','Destacada por sus paisajes naturales y la producción de frutas.','https://media.lmcipolletti.com/p/d8baaf454f1bd0ca258fa3c1ea663e41/adjuntos/195/imagenes/003/604/0003604148/1200x675/smart/maravillajpg.jpg'),(17,'Salta','Conocida por su cultura rica y sus impresionantes paisajes montañosos.','https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Catedral_de_Salta_Capital.JPG/1200px-Catedral_de_Salta_Capital.JPG'),(18,'San Juan','Famosa por su producción de vino y sus paisajes áridos.','https://sisanjuan.b-cdn.net/media/xt-adaptive-images/480/media/k2/items/cache/9032d69f4b59d829e0f8ee59e90ffb6e_XL.webp'),(19,'San Luis','Conocida por su turismo de aventura y paisajes serranos.','https://agenciasanluis.com/wp-content/uploads/2022/07/Pasos-malos-2.jpg'),(20,'Santa Cruz','Famosa por sus glaciares y la Patagonia argentina.','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Perito_Moreno_%2839986110524%29.jpg/266px-Perito_Moreno_%2839986110524%29.jpg'),(21,'Santa Fe','Conocida por su agricultura y su importante puerto sobre el río Paraná.','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Santa_Fe%2C_Argentina_2019_%28letras%29.jpg/1200px-Santa_Fe%2C_Argentina_2019_%28letras%29.jpg'),(22,'Santiago del Estero','Famosa por su rica historia y tradiciones folclóricas.','https://upload.wikimedia.org/wikipedia/commons/d/dc/Casa_de_gobierno_de_Santiago_del_Estero.JPG'),(23,'Tierra del Fuego','Conocida por su naturaleza extrema y el fin del mundo.','https://upload.wikimedia.org/wikipedia/commons/7/71/Les_Eclaireurs_Lighthouse.jpg'),(24,'Tucumán','Famosa por su producción de azúcar y su historia de independencia.','https://media.tycsports.com/files/2023/08/23/608815/tucuman_862x485.webp');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta` (
  `Numero` varchar(45) NOT NULL,
  `Fecha_Cad` varchar(45) DEFAULT NULL,
  `Cliente_DNI` int(11) DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `Cliente_DNI` (`Cliente_DNI`),
  KEY `Tipo` (`Tipo`),
  CONSTRAINT `Tarjeta_ibfk_1` FOREIGN KEY (`Cliente_DNI`) REFERENCES `cliente` (`DNI`),
  CONSTRAINT `Tarjeta_ibfk_2` FOREIGN KEY (`Tipo`) REFERENCES `tipo_tarjeta` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` VALUES ('123','2027-09-01',2,1),('1234 1234 1234 1234','01/30',987,1),('133','2028-02-20',987,4),('144','2026-03-27',22222222,2);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_tarjeta`
--

DROP TABLE IF EXISTS `tipo_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_tarjeta` (
  `Codigo` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_tarjeta`
--

LOCK TABLES `tipo_tarjeta` WRITE;
/*!40000 ALTER TABLE `tipo_tarjeta` DISABLE KEYS */;
INSERT INTO `tipo_tarjeta` VALUES (1,'Visa'),(2,'Mastercard'),(3,'American Express'),(4,'Mercado Pago');
/*!40000 ALTER TABLE `tipo_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Origen` int(11) DEFAULT NULL,
  `Destino` int(11) DEFAULT NULL,
  `Fecha_Salida` date DEFAULT NULL,
  `Fecha_Llegada` date DEFAULT NULL,
  `Avion` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Origen` (`Origen`),
  KEY `Destino` (`Destino`),
  KEY `Avion_idx` (`Avion`),
  CONSTRAINT `Avion` FOREIGN KEY (`Avion`) REFERENCES `aviones` (`Matrícula`),
  CONSTRAINT `Vuelo_ibfk_1` FOREIGN KEY (`Origen`) REFERENCES `sede` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Vuelo_ibfk_2` FOREIGN KEY (`Destino`) REFERENCES `sede` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,1,2,'2024-11-01','2024-11-01','AB1234'),(2,3,4,'2024-11-05','2024-11-05','CD5678'),(3,5,6,'2024-11-10','2024-11-11','EF9012'),(4,7,8,'2024-11-12','2024-11-12','GH3456'),(5,9,10,'2024-11-15','2024-11-15','IJ7890'),(6,11,12,'2024-11-18','2024-11-18','KL1234'),(7,1,2,'2024-11-01','2024-11-01','AB1234'),(8,3,4,'2024-11-05','2024-11-05','CD5678'),(9,5,6,'2024-11-10','2024-11-11','EF9012'),(10,7,8,'2024-11-12','2024-11-12','GH3456'),(11,9,10,'2024-11-15','2024-11-15','IJ7890'),(12,11,12,'2024-11-18','2024-11-18','KL1234'),(13,1,2,'2024-11-01','2024-11-01','AB1234'),(14,3,4,'2024-11-05','2024-11-05','CD5678'),(15,5,6,'2024-11-10','2024-11-11','EF9012'),(16,7,8,'2024-11-12','2024-11-12','GH3456'),(17,9,10,'2024-11-15','2024-11-15','IJ7890'),(18,11,12,'2024-11-18','2024-11-18','KL1234');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 19:38:51
