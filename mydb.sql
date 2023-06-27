CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `comprausuario`
--

DROP TABLE IF EXISTS `comprausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprausuario` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idJuego` int NOT NULL,
  `cantidad` int NOT NULL,
  `fechaCompra` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idAdmin` int NOT NULL,
  `precioCompra` varchar(45) DEFAULT NULL,
  `idEstados` int NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_Compra_Usuario1_idx` (`idUsuario`),
  KEY `fk_Compra_Juego1_idx` (`idJuego`),
  KEY `fk_Compra_Usuario2_idx` (`idAdmin`),
  KEY `fk_comprausuario_estados1_idx` (`idEstados`),
  CONSTRAINT `fk_Compra_Juego1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  CONSTRAINT `fk_Compra_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_Compra_Usuario2` FOREIGN KEY (`idAdmin`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_comprausuario_estados1` FOREIGN KEY (`idEstados`) REFERENCES `estados` (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprausuario`
--

LOCK TABLES `comprausuario` WRITE;
/*!40000 ALTER TABLE `comprausuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencial`
--

DROP TABLE IF EXISTS `credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencial` (
  `correo` varchar(45) NOT NULL,
  `contraseniaHashed` varchar(64) NOT NULL,
  `idCuenta` int NOT NULL,
  KEY `fk_credencial_cuenta1_idx` (`idCuenta`),
  CONSTRAINT `fk_credencial_cuenta1` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`idCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial`
--

LOCK TABLES `credencial` WRITE;
/*!40000 ALTER TABLE `credencial` DISABLE KEYS */;
INSERT INTO `credencial` VALUES ('dyla@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',1),('jondoead@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',2),('robertbrown@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',10),('emiliedavd@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',11),('juanperez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',112),('mariagonz@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',113),('carloslopez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',114),('larodriguez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',115),('diegohernandez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',116),('anamartinez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',117),('pedrogarcia@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',118),('luisasanchez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',119),('migueltorres@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',120),('sofialuna@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',121),('alejandrorojas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',122),('valentinacordova@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',123),('javiervargas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',124),('paulaortega@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',125),('andresguerrero@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',126),('fernandadiaz@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',127),('gabrielvargas@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',128),('johndoe@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',129),('janesmith@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',130),('alicejohnson@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',131),('emilydavis@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',132),('sophiawilson@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',133),('lauragonzalez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',134),('carlostorres@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',135),('anaramirez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',136),('luishernandez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',137),('elenacastro@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',138),('mariolopez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',139),('sofiagomez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',140),('andresmartinez@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',141),('carolinasilva@gmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',142);
/*!40000 ALTER TABLE `credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `idCuenta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `desabilitado` tinyint NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idCuenta`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_Cuentas_Roles_idx` (`idRol`),
  CONSTRAINT `fk_Cuentas_Roles` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'Dylan','Bustamante','tecreo','Chosica','dyla@hotmail.com',NULL,'soy una persona xd',0,1),(2,'Joeyn','Doead','johndoead','Calle Los Pinos 33333','jondoead@gmail.com',NULL,'Tengo miedo de web1',0,1),(10,'Robert','Brown','robertbrown','Avenida Los Laureles 321','robertbrown@gmail.com',NULL,'todos quieren ser admins',0,2),(11,'Emilie','Davd','emiliedavd','Calle Maple 654','emiliedavd@gmail.com',NULL,'soy admin',0,2),(112,'Juan','Pérez','juanperez','Av. Javier Prado 123','juanperez@gmail.com',NULL,'Soy un amante de la música',0,3),(113,'María','González','mariagonz','Jr. Huallaga 456','mariagonz@gmail.com',NULL,'Me encanta viajar',0,3),(114,'Carlos','López','carlosl','Av. Arequipa 789','carloslopez@gmail.com',NULL,'Amante de los deportes',0,3),(115,'Laura','Rodríguez','larodri','Av. Larco 321','larodriguez@gmail.com',NULL,'Apasionada por la lectura',0,3),(116,'Diego','Hernández','diegoh','Jr. Iquitos 654','diegohernandez@gmail.com',NULL,'Fanático de la tecnología',0,3),(117,'Ana','Martínez','anamart','Chiclayo','anamartinez@gmail.com',NULL,'Adoro la cocina',0,3),(118,'Pedro','García','pedrog','Piura','pedrogarcia@gmail.com',NULL,'Me encanta el cine',0,3),(119,'Luisa','Sánchez','luisas','Huaraz','luisasanchez@gmail.com',NULL,'Amante de los animales',0,3),(120,'Miguel','Torres','miguelt','Tacna','migueltorres@gmail.com',NULL,'Apasionado por la fotografía',0,3),(121,'Sofía','Luna','sofial','Ayacucho','sofialuna@gmail.com',NULL,'Me gusta la pintura',0,3),(122,'Alejandro','Rojas','alejandror','Pucallpa','alejandrorojas@gmail.com',NULL,'Adicto a los videojuegos',0,3),(123,'Valentina','Cordova','valentinac','Ica','valentinacordova@gmail.com',NULL,'Me gusta la jardinería',0,3),(124,'Javier','Vargas','javierv','Huancayo','javiervargas@gmail.com',NULL,'Fanático del fútbol',0,3),(125,'Paula','Ortega','paulao','Chimbote','paulaortega@gmail.com',NULL,'Amante de la moda',0,3),(126,'Andrés','Guerrero','andresg','Tarapoto','andresguerrero@gmail.com',NULL,'Apasionado por la historia',0,3),(127,'Fernanda','Díaz','fernandad','Trujillo','fernandadiaz@gmail.com',NULL,'Me gusta el yoga',0,3),(128,'Gabriel','Vargas','gabrielv','Lima','gabrielvargas@gmail.com',NULL,'Adicto a las series',0,3),(129,'John','Doe','johndoe','Calle Los Pinos 123','johndoe@gmail.com',NULL,'Tengo miedo del entregable',0,3),(130,'Jane','Smith','janesmith','Avenida Los Robles 456','janesmith@gmail.com',NULL,'Iweb izipizi',0,3),(131,'Alice','Johnson','alicejohnson','Calle Las Flores 789','alicejohnson@gmail.com',NULL,'No tengo dinero',0,3),(132,'Emily','Davis','emilydavis','Calle Maple 654','emilydavis@gmail.com',NULL,'Soy un niño',0,3),(133,'Sophia','Wilson','sophiawilson','Calle Cedar 147','sophiawilson@gmail.com',NULL,'Amo jugar videojuegos',0,2),(134,'Laura','González','lauragonzalez','Calle Secundaria 456','lauragonzalez@gmail.com',NULL,'Usuario activo',0,3),(135,'Carlos','Torres','carlostorres','Avenida Norte 789','carlostorres@gmail.com',NULL,'Usuario activo',0,3),(136,'Ana','Ramírez','anaramirez','Calle Principal 789','anaramirez@gmail.com',NULL,'Usuario activo',0,3),(137,'Luis','Hernández','luishernandez','Avenida Central 123','luishernandez@gmail.com',NULL,'Usuario activo',0,3),(138,'Elena','Castro','elenacastro','Calle Secundaria 789','elenacastro@gmail.com',NULL,'Usuario activo',0,3),(139,'Mario','López','mariolopez','Avenida Norte 456','mariolopez@gmail.com',NULL,'Usuario activo',0,3),(140,'Sofía','Gómez','sofiagomez','Calle Principal 456','sofiagomez@gmail.com',NULL,'Usuario activo',0,3),(141,'Andrés','Martínez','andresmartinez','Avenida Central 789','andresmartinez@gmail.com',NULL,'Usuario activo',0,3),(142,'Carolina','Silva','carolinasilva','Calle Secundaria 123','carolinasilva@gmail.com',NULL,'Usuario activo',0,3);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `idestados` int NOT NULL,
  `nombreEstados` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'pendiente'),(2,'aceptado'),(3,'no aceptado'),(4,'rechazado '),(6,'pendiente'),(7,'entregado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `idJuego` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descuento` decimal(10,0) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `existente` tinyint DEFAULT NULL,
  `habilitado` tinyint DEFAULT NULL,
  `consola` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`idJuego`),
  UNIQUE KEY `foto_UNIQUE` (`foto`),
  KEY `fk_Juegos_Cuentas1_idx` (`idJuego`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (120,'Valorant','Juego de disparos casi tan bueno como CSGO',0,0,'img/juegos/1valorant.png',1,1,'Nintendo Switch','Aventura',100),(122,'dota2','juegazo',0,0,'img/juegos/2dota2.jpg',1,1,'PlayStation 4','Acción',50),(123,'Toontown','juego de farmeo',0,0,'img/juegos/3toon.jpg',1,1,'PlayStation 5','Sandbox',100),(124,'Call of Duty','shooter',150,0,'img/juegos/4callDuty.jpg',1,1,'PlayStation 4','Acción',5),(125,'Beyond two souls ','Beyond: Two Souls es un videojuego de drama interactivo, desarrollado por Quantic Dream y distribuido por Sony',120,20,'img/juegos/5beyond.jpg',1,1,'PlayStation 5','Mundo abierto',100),(126,'The Legend of Zelda: Breath of the Wild','Videojuego de aventuras',180,10,'img/juegos/6zelda.jpg',1,1,'PlayStation 4','Terror',50),(127,'Minecraft','Juego de construcción y aventura',50,0,'img/juegos/7mine.jpg',1,1,'Nintendo Switch','Mundo abierto',200),(128,'Grand Theft Auto V','Videojuego de acción y mundo abierto',200,25,'img/juegos/8gta5.jpg',1,1,'PlayStation 4','Acción',20),(129,'FIFA 22','Videojuego de fútbol',60,0,'img/juegos/9fifa.jpeg',1,1,'Nintendo Switch','Estrategia',30),(130,'Assassins Creed Valhalla','Videojuego de acción y aventura',140,15,'img/juegos/10assa.jpg',1,1,'PlayStation 5','Terror',15),(131,'Animal Crossing: New Horizons','Videojuego de simulación de vida',60,0,'img/juegos/11animal.jpg',1,1,'Nintendo Switch','Mundo abierto',10),(132,'Super Mario Odyssey','Videojuego de plataformas',50,0,'img/juegos/12mario.jpg',1,1,'PlayStation 5','Acción',50),(133,'The Witcher 3: Wild Hunt','Videojuego de rol y acción',40,10,'img/juegos/13witcher.jpg',1,1,'PC','Shooter',25),(134,'Fortnite','Videojuego de Battle Royale',100,0,'img/juegos/14fortnite.jpg',1,1,'PlayStation 4','Shooter',100),(135,'Red Dead Redemption 2','Videojuego de acción y mundo abierto',60,0,'img/juegos/15reddead.jpg',1,1,'PC','battle royal',40),(136,'Pokemon','Videojuego de Pokemon',60,0,'img/juegos/16pokemon.png',1,1,'PlayStation 4','Estrategia',1),(137,'The Last of Us Part II','Videojuego de acción y aventura',70,0,'img/juegos/17lastofus.jpg',1,1,'PlayStation 5','Acción',20),(138,'Overwatch','Videojuego de disparos en equipo',40,0,'img/juegos/18over.jpg',1,1,'PC','battle royal',50),(139,'Resident Evil Village','Videojuego de terror y supervivencia',50,0,'img/juegos/19resident.jpg',1,1,'PlayStation 4','battle royal',15),(140,'Splatoon 2','Videojuego de disparos y acción',40,0,'img/juegos/20spla.jpg',1,1,'PlayStation 5','Estrategia',40),(141,'Final Fantasy VII Remake','Videojuego de rol y aventuras',60,0,'img/juegos/21final.jpg',1,1,'PlayStation 4','Acción',25);
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'manager'),(2,'administrador'),(3,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventausuario`
--

DROP TABLE IF EXISTS `ventausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventausuario` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idJuego` int NOT NULL,
  `precioVenta` decimal(10,0) NOT NULL,
  `mensajeAdmin` varchar(255) DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  `idEstados` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_Venta_Usuario1_idx` (`idUsuario`),
  KEY `fk_Venta_Juego1_idx` (`idJuego`),
  KEY `fk_Venta_Usuario2_idx` (`idAdmin`),
  KEY `fk_ventausuario_estados1_idx` (`idEstados`),
  CONSTRAINT `fk_Venta_Juego1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  CONSTRAINT `fk_Venta_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_Venta_Usuario2` FOREIGN KEY (`idAdmin`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_ventausuario_estados1` FOREIGN KEY (`idEstados`) REFERENCES `estados` (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventausuario`
--

LOCK TABLES `ventausuario` WRITE;
/*!40000 ALTER TABLE `ventausuario` DISABLE KEYS */;
INSERT INTO `ventausuario` VALUES (11,112,121,0,'El juego fue vendido',10,1),(12,113,122,0,'El juego fue vendido',11,2),(13,113,123,0,'El juego se encuentra en el estado de espera',10,3),(14,113,124,150,'El juego fue vendido',11,4),(15,113,125,96,'El juego se encuentra en el estado de espera',11,1),(16,113,126,162,'El juego fue vendido',11,2),(17,114,127,50,'El juego fue vendido',10,3),(18,114,128,150,'El juego se encuentra en el estado de espera',11,4),(19,114,129,60,'El juego fue vendido',10,1),(20,114,130,119,'El juego se encuentra en el estado de espera',10,2);
/*!40000 ALTER TABLE `ventausuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 21:01:42
