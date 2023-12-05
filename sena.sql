
DROP TABLE IF EXISTS `Carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carrera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrera`
--

LOCK TABLES `Carrera` WRITE;
/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
INSERT INTO `Carrera` VALUES (1,'Desarrollo de Software'),(2,'Electrónica'),(3,'Mecánica Automotriz'),(4,'Seguridad y Salud Ocupacional'),(5,'Soldadura');
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,'Matemáticas Básicas'),(2,'Algebra Computacional'),(3,'Programación Básica'),(4,'Inglés'),(5,'Electrónica Básica'),(6,'Motor de Cuatro Tiempos'),(7,'Enfermedades Laborales'),(8,'Higiene Postural en el Trabajo'),(9,'Ergonomía'),(10,'Legislación Laboral en Colombia'),(11,'Materiales de Soldadura'),(12,'Métodos de Soldadura'),(13,'Fusión de Metales'),(14,'Buceo 1'),(15,'Buceo 2'),(16,'Riesgo Eléctrico'),(17,'Bases de Datos Relacionales'),(18,'Bases de Datos NO Relacionales'),(19,'Electrónica Digital'),(20,'Microprocesadores');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoRuta`
--

DROP TABLE IF EXISTS `CursoRuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CursoRuta` (
  `id_Ruta` int NOT NULL,
  `id_Curso` int NOT NULL,
  `duration` double NOT NULL,
  KEY `CursoRuta_id_Ruta_fk` (`id_Ruta`),
  KEY `CursoRuta_id_Curso_fk` (`id_Curso`),
  CONSTRAINT `CursoRuta_id_Curso_fk` FOREIGN KEY (`id_Curso`) REFERENCES `Curso` (`id`),
  CONSTRAINT `CursoRuta_id_Ruta_fk` FOREIGN KEY (`id_Ruta`) REFERENCES `Ruta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoRuta`
--

LOCK TABLES `CursoRuta` WRITE;
/*!40000 ALTER TABLE `CursoRuta` DISABLE KEYS */;
INSERT INTO `CursoRuta` VALUES (1,1,2.5),(1,2,3),(1,3,2),(1,4,4),(1,17,3.5),(1,18,2.5),(2,1,3),(2,3,4),(2,4,5),(2,2,4.5),(8,4,5),(8,6,2),(10,11,3),(10,16,5),(11,13,6),(11,11,4),(3,3,5),(3,4,6),(3,17,4),(4,5,2.5),(4,19,5.5),(4,20,8),(5,5,2),(5,19,5),(5,20,10);
/*!40000 ALTER TABLE `CursoRuta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoInstructor`
--

DROP TABLE IF EXISTS `CursoInstructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CursoInstructor` (
  `id_Instructor` int NOT NULL,
  `id_Curso` int NOT NULL,
  `id` varchar(5) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `CursoInstructor_id_Instructor_fk` (`id_Instructor`),
  KEY `CursoInstructor_id_Curso_fk` (`id_Curso`),
  CONSTRAINT `CursoInstructor_id_Curso_fk` FOREIGN KEY (`id_Curso`) REFERENCES `Curso` (`id`),
  CONSTRAINT `CursoInstructor_id_Instructor_fk` FOREIGN KEY (`id_Instructor`) REFERENCES `Instructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoInstructor`
--

LOCK TABLES `CursoInstructor` WRITE;
/*!40000 ALTER TABLE `CursoInstructor` DISABLE KEYS */;
INSERT INTO `CursoInstructor` VALUES (1,2,'AC-1'),(2,18,'DBN-1'),(2,17,'DBR-1'),(7,5,'EB-1'),(6,19,'ED-1'),(3,13,'FM-1'),(5,4,'I-1'),(4,1,'MB-1'),(7,20,'MP-1'),(3,11,'MS-1'),(3,3,'PB-1');
/*!40000 ALTER TABLE `CursoInstructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupEstudiante`
--

DROP TABLE IF EXISTS `GroupEstudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupEstudiante` (
  `id_group` varchar(5) NOT NULL,
  `id_Estudiante` int NOT NULL,
  KEY `id_group` (`id_group`),
  KEY `id_Estudiante` (`id_Estudiante`),
  CONSTRAINT `GroupEstudiante_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `CursoInstructor` (`id`),
  CONSTRAINT `GroupEstudiante_ibfk_2` FOREIGN KEY (`id_Estudiante`) REFERENCES `Estudiante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupEstudiante`
--

LOCK TABLES `GroupEstudiante` WRITE;
/*!40000 ALTER TABLE `GroupEstudiante` DISABLE KEYS */;
INSERT INTO `GroupEstudiante` VALUES ('DBR-1',1),('AC-1',1),('PB-1',1),('DBN-1',1),('MB-1',2),('AC-1',2),('PB-1',2),('I-1',2),('MB-1',3),('AC-1',3),('PB-1',3),('I-1',4),('MB-1',4),('AC-1',4),('PB-1',5),('I-1',5),('DBR-1',5),('EB-1',6),('ED-1',6),('MP-1',6),('EB-1',7),('ED-1',7),('MP-1',7),('EB-1',8),('ED-1',8),('EB-1',9),('ED-1',9),('MP-1',9),('MS-1',10),('FM-1',10),('MS-1',11);
/*!40000 ALTER TABLE `GroupEstudiante` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Registro`
--

DROP TABLE IF EXISTS `Registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registro` (
  `id_Estudiante` int NOT NULL,
  `id_Ruta` int NOT NULL,
  `state` enum('Activo','Terminado','Cancelado') DEFAULT NULL,
  KEY `Registro_id_Ruta_fk` (`id_Ruta`),
  KEY `Registro_id_Estudiante_pk` (`id_Estudiante`),
  CONSTRAINT `Registro_id_Ruta_fk` FOREIGN KEY (`id_Ruta`) REFERENCES `Ruta` (`id`),
  CONSTRAINT `Registro_id_Estudiante_pk` FOREIGN KEY (`id_Estudiante`) REFERENCES `Estudiante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registro`
--

LOCK TABLES `Registro` WRITE;
/*!40000 ALTER TABLE `Registro` DISABLE KEYS */;
INSERT INTO `Registro` VALUES (1,1,'Activo'),(2,1,'Activo'),(3,2,'Cancelado'),(4,2,'Activo'),(5,3,'Activo'),(6,4,'Terminado'),(7,4,'Terminado'),(8,5,'Terminado'),(9,5,'Cancelado'),(10,11,'Terminado'),(11,10,'Terminado');
/*!40000 ALTER TABLE `Registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ruta`
--

DROP TABLE IF EXISTS `Ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ruta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_Carrera` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Ruta_id_Carrera_fk` (`id_Carrera`),
  CONSTRAINT `Ruta_id_Carrera_fk` FOREIGN KEY (`id_Carrera`) REFERENCES `Carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ruta`
--

LOCK TABLES `Ruta` WRITE;
/*!40000 ALTER TABLE `Ruta` DISABLE KEYS */;
INSERT INTO `Ruta` VALUES (1,'Sistemas de Información Empresariales',1),(2,'Videojuegos',1),(3,'Machine Learning',1),(4,'Microcontroladores',2),(5,'Robótica',2),(6,'Dispositivos Bio-médicos',2),(7,'Motores Hibridos',3),(8,'Vehículos de Uso Agrícola',3),(9,'Sistemas de Gestión en Seguridad Ocupacional',4),(10,'Soldadura Autógena Industrial',5),(11,'Soldadura Eléctrica Industrial',5),(12,'Soldadura Submarina',5);
/*!40000 ALTER TABLE `Ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidad`
--

DROP TABLE IF EXISTS `Especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Especialidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidad`
--

LOCK TABLES `Especialidad` WRITE;
/*!40000 ALTER TABLE `Especialidad` DISABLE KEYS */;
INSERT INTO `Especialidad` VALUES (1,'Sistemas'),(2,'Salud Ocupacional'),(3,'Soldadura'),(4,'Mecánica'),(5,'Inglés'),(6,'Electrónica');
/*!40000 ALTER TABLE `Especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiante`
--

DROP TABLE IF EXISTS `Estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiante`
--

LOCK TABLES `Estudiante` WRITE;
/*!40000 ALTER TABLE `Estudiante` DISABLE KEYS */;
INSERT INTO `Estudiante` VALUES (1,'Carlos Saúl','Gómez',20),(2,'Leyla María','Delgado Vargas',21),(3,'Juan José','Cardona',22),(4,'Sergio Augusto','Contreras Navas',23),(5,'Ana María','Velázquez Parra',24),(6,'Gustavo','Noriega Alzate',25),(7,'Pedro Nell','Gómez Díaz',26),(8,'Jairo Augusto','Castro Camargo',27),(9,'Henry','Soler Vega',28),(10,'Antonio','Cañate Cortés',26),(11,'Daniel','Simmancas Junior',21);
/*!40000 ALTER TABLE `Estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_Especialidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Instructor_id_Especialidad_fk` (`id_Especialidad`),
  CONSTRAINT `Instructor_id_Especialidad_fk` FOREIGN KEY (`id_Especialidad`) REFERENCES `Especialidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (1,'Ricardo Vicente Jaimes',1),(2,'Marinela Narvaez',2),(3,'Agustín Parra Granados',3),(4,'Nelson Raúl Buitrago',4),(5,'Roy Hernando Llamas',5),(6,'María Jimena Monsalve',6),(7,'Juan Carlos Cobos',6),(8,'Pedro Nell Santomaría',1),(9,'Andrea González',1),(10,'Marisela Sevilla',2);
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;


