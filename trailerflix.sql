-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: trailerflix
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `NombreYApellido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (1,'Pedro Pascal'),(2,'Carl Weathers'),(3,'Misty Rosas'),(4,'Chris Bartlett'),(5,'Rio Hackford'),(6,'Giancarlo Esposito'),(7,'Jim Parsons'),(8,'Johnny Galecki'),(9,'Kaley Cuoco'),(10,'Simon Helberg'),(11,'Kunal Nayyar'),(12,'Melissa Rauch'),(13,'Mayim Bialik'),(14,'Jennifer Aniston'),(15,'Courteney Cox'),(16,'Lisa Kudrow'),(17,'David Schwimmer'),(18,'Matthew Perry'),(19,'Matt LeBlanc'),(20,'Jessica Chastain'),(21,'John Malkovich'),(22,'Colin Farrell'),(23,'Common'),(24,'Geena Davis'),(25,'Ioan Gruffudd'),(26,'Miranda Cosgrove'),(27,'Kate Walsh'),(28,'Omar Epps'),(29,'Angus Macfadyen'),(30,'Jorja Fox'),(31,'Enver Gjokaj'),(32,'Bill Skarsgård'),(33,'Jessica Chastain'),(34,'Bill Hader'),(35,'James McAvoy'),(36,'Isaiah Mustafa'),(37,'Jay Ryan'),(38,'Bryce Dallas Howard'),(39,'Chris Pratt'),(40,'Irrfan Khan'),(41,'Vincent D\'Onofrio'),(42,'Omar Sy'),(43,'Nick Robinson'),(44,'Judy Greer'),(45,'Ryan Gosling'),(46,'Claire Foy'),(47,'Jason Clarke'),(48,'Kyle Chandler'),(49,'Corey Stoll'),(50,'Patrick Fugit'),(51,'Jennifer Lawrence'),(52,'Michael Sheen'),(53,'Laurence Fishburne'),(54,'Andy García'),(55,'Aurora Perrineau'),(56,'Kristin Brock'),(57,'Julee Cerda'),(58,'Fred Melamed'),(59,'Joaquin Phoenix'),(60,'Scarlett Johansson'),(61,'Amy Adams'),(62,'Rooney Mara'),(63,'Olivia Wilde'),(64,'Matt Letscher'),(65,'Portia Doubleday'),(66,'Spike Jonze'),(67,'Rafe Spall'),(68,'Justice Smith'),(69,'Daniella Pineda'),(70,'James Cromwell'),(71,'Toby Jones'),(72,'Ted Levine'),(73,'Jeff Goldblum'),(74,'BD Wong'),(75,'Geraldine Chaplin'),(76,'Isabella Sermon'),(77,'Kevin Layne'),(78,'Emilia Clarke'),(79,'Lena Headey'),(80,'Sophie Turner'),(81,'Kit Harington'),(82,'Peter Dinklage'),(83,'Nikolaj Coster-Waldau');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Serie'),(2,'Pelicula'),(3,'Programa Tv'),(4,'Cortometraje'),(5,'Audio Libro'),(6,'Otros');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Ciencia Ficcion'),(2,'Drama'),(3,'Suspenso'),(4,'Fantasia'),(5,'Terror'),(6,'Acción'),(7,'Comedia'),(8,'Familia'),(9,'Aventura'),(10,'Suceso Real'),(11,'Otros');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `id_pelicula` int NOT NULL AUTO_INCREMENT,
  `Poster` varchar(45) DEFAULT NULL,
  `Titulo` varchar(45) NOT NULL,
  `Resumen` varchar(600) DEFAULT NULL,
  `Temporadas` varchar(10) DEFAULT NULL,
  `Duracion` varchar(45) DEFAULT NULL,
  `Trailer` varchar(45) DEFAULT NULL,
  `Lanzamiento` date DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`),
  KEY `id_categoria_idx` (`id_categoria`),
  KEY `id_genero_idx` (`id_genero`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'./posters/3.jpg','The Mandalorian','Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la Serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República','2','N/A','https://www.youtube.com/embed/aOC8E8z_ifw','2019-11-12',1,1),(2,'./posters/4.jpg','The Umbrella Academy','La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad','1','N/A','https://www.youtube.com/embed/KHucKOK-Vik','2019-02-15',1,1),(3,'./posters/5.jpg','Gambito de Dama','En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones','1','N/A','https://www.youtube.com/embed/lbleRbyGKL4','2020-03-20',1,2),(4,'./posters/2.jpg','Riverdale','El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros','5','N/A','https://www.youtube.com/embed/HxtLlByaYTc','2017-05-11',1,2),(5,'./posters/6.jpg','Enola Holmes','La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.','N/A','97 min','https://www.youtube.com/embed/3t1g2pa355k','2020-09-23',2,2),(6,'./posters/11.jpg','The Big Bang Theory','Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La Serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas','12','N/A','https://www.youtube.com/embed/WBb3fojgW0Q','2007-11-24',1,7),(7,'./posters/12.jpg','Friends','Friends narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.','10','N/A','https://www.youtube.com/embed/ekYGfU0XIx0','1994-11-22',1,7),(8,'./posters/18.jpg','Ava','Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.','N/A','97 minutos','https://www.youtube.com/embed/eLEwNo78f0k','2019-05-30',2,6),(9,'./posters/22.jpg','3022','La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una Serie de flashbacks y flash-forward','N/A','97 minutos','https://www.youtube.com/embed/AGQ7OkmIx4Q','2019-11-22',2,3),(10,'./posters/23.jpg','IT - Capítulo 2','En este segundo capitulo Han pasado 27 años desde que el \"Club de los Perdedores\", formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia','N/A','97 minutos','https://www.youtube.com/embed/hZeFeYSmBcg','2019-09-06',2,5),(11,'./posters/32.jpg','Jurassic World','Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.','N/A','97 minutos','https://www.youtube.com/embed/RFinNxS5KN4','2015-06-11',2,9),(12,'./posters/34.jpg','El primer hombre en la luna','Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.','N/A','97 minutos','https://www.youtube.com/embed/PSoRx87OO6k','2018-10-12',2,10),(13,'./posters/56.jpg','Passengers','Una nave espacial, que viaja a un planeta lejano transportando a miles de personas, tiene una avería en una de las cápsulas de hibernación tras el impacto con un gran meteorito. Como resultado, un pasajero se despierta noventa años antes del final del viaje','N/A','116 minutos','https://www.youtube.com/embed/7BWWWQzTpNU','2016-12-21',2,1),(14,'./posters/70.jpg','Her','En un futuro cercano, Theodore, un hombre solitario a punto de divorciarse que trabaja en una empresa como escritor de cartas para terceras personas, compra un día un nuevo sistema operativo basado en el modelo de Inteligencia Artificial, diseñado para satisfacer todas las necesidades del usuario. Para su sorpresa, se crea una relación romántica entre él y Samantha, la voz femenina de ese sistema operativo','N/A','126 minutos','https://www.youtube.com/embed/UVMcpZ42BkA','2014-03-13',2,1),(15,'./posters/82.jpg','Jurassic World - El reino caido','Tras cuatro años de abandono del complejo turístico Jurassic World, la isla Nublar solo está habitada por los dinosaurios supervivientes, pero el volcán inactivo de la isla comienza a cobrar vida, Owen y Claire montan una campaña para rescatar a los dinosaurios restantes en la isla.','N/A','82 minutos','https://www.youtube.com/embed/vn9mMeWcgoM','2018-06-21',2,9),(16,'./posters/9.jpg','Juego de tronos','En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder','8','N/A','https://www.youtube.com/embed/KPLWWIOCOOQ','2011-04-17',1,4);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas_tags`
--

DROP TABLE IF EXISTS `peliculas_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas_tags` (
  `id_pelicula_tag` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `id_tag` int DEFAULT NULL,
  PRIMARY KEY (`id_pelicula_tag`),
  KEY `id_pelicula_idx` (`id_pelicula`),
  KEY `id_tag_idx` (`id_tag`),
  CONSTRAINT `id_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas_tags`
--

LOCK TABLES `peliculas_tags` WRITE;
/*!40000 ALTER TABLE `peliculas_tags` DISABLE KEYS */;
INSERT INTO `peliculas_tags` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,4),(7,3,4),(8,3,5),(9,3,6),(10,4,4),(11,4,7),(12,4,5),(13,5,5),(14,5,4),(15,5,7),(16,6,11),(17,6,2),(18,6,5),(19,7,11),(20,7,12),(21,7,4),(22,8,3),(23,8,4),(24,8,9),(25,9,1),(26,9,9),(27,9,13),(28,10,14),(29,10,9),(30,10,2),(31,11,9),(32,11,10),(33,11,5),(34,12,4),(35,12,15),(36,13,4),(37,13,15),(38,13,1),(39,13,17),(40,14,4),(41,14,1),(42,14,17),(43,14,16),(44,15,10),(45,15,3),(46,15,1),(47,16,10),(48,16,2),(49,16,4);
/*!40000 ALTER TABLE `peliculas_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rankings`
--

DROP TABLE IF EXISTS `rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rankings` (
  `id_ranking` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `Ranking` int DEFAULT NULL,
  `Calificación` varchar(45) DEFAULT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_ranking`),
  KEY `id_pelicula_idx` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rankings`
--

LOCK TABLES `rankings` WRITE;
/*!40000 ALTER TABLE `rankings` DISABLE KEYS */;
INSERT INTO `rankings` VALUES (1,1,1,'ATP','Estos dos primeros episodios se sienten como un reinicio para The Mandalorian, comenzando una nueva búsqueda para esta nueva era del programa. Se salta los eventos de The Book of Boba Fett y pasa directamente a la nueva narrativa sin perder un paso, y nos da la fórmula que hizo que el programa fuera tan popular desde el principio. También está expandiendo los mitos del mundo, especialmente los detalles canónicos del pueblo mandaloriano'),(2,2,2,'PM13','Sin altas pretensiones es una de las series más entretenidas y disfrutables del momento'),(3,3,3,'PM16','Un gambito es una apertura de ajedrez en la cual se sacrifica un peón o pieza para conseguir compensación con algún tipo de ventaja en el desarrollo. Un contragambito es cuando el oponente ofrece otro gambito como respuesta.'),(4,4,4,'PM16','Giro radical desde una gran serie hacia un sinsentido'),(5,5,5,'PM13','Entretenimiento familiar muy bien logrado'),(6,6,6,'PM13','\"La mitad de la diversión en esta comedia extravagantemente graciosa es que Penny es tan espacial que no parece reconocer a los nerds que Leonard y Sheldon realmente son.\"'),(7,7,7,'PM13','Hacen falta mas series como esta, y en mi opinion, \'Friends\' es la major series que vi.'),(8,8,8,'PM13','Ava (Chastain) es una asesina que trabaja para una organización de operaciones secretas. Cuando un peligroso encargo sale mal, Ava se verá obligada a luchar por su propia supervivencia'),(9,9,9,'PM16','Un grupo de astronautas, tras pasar un gran tiempo en el espacio, regresan a la Tierra y se encuentran que está al borde de la extinción.'),(10,10,10,'PM18','Creo que la propuesta del primer capítulo se expande muy bien en este segundo y da lugar a la ambigüedad en cuanto al origen de Pennywise. Eso particularmente creo que contribuye al terror.'),(11,11,11,'APT','En mi opinión, me encantó la película. La recomiendo mucho. Tiene muy buenos gráficos y dinosaurios muy bien hechos(tanto CGI como animatrónicos). Les doy un 10/10. Mi enhorabuena para Michael Crichton y Steven Spielberg'),(12,12,12,'APT','Chazelle tiene un don y es uno de los mejores directores jóvenes del momento. Hizo la increíble Whiplash, la hermosa La La Land y con First Man vuelve a cambiar de registro y sorprende con una película que te atrapa y te mantiene con el corazón en un puño casi en todo momento. Fotografía y banda sonora, además de actores secundarios, de auténtico lujo.'),(13,13,13,'PM13','No es la clásica película motivacional de hazañas de personas reales,  la magia de esta película es precisamente que te muestra un escenario absolutamente irreal, pero al mismo tiempo es la más cruda realidad de los seres humanos.'),(14,14,14,'PM13','De mis películas favoritas con una historia bien contada, que te transmite diferentes emociones ya sea felicidad, erotismo y hasta tristeza. Logras empatizar con la soledad del personaje Theodore y el porque se siente mas feliz con la compañía de su sistema operativo: Samantha. Es una buena película sobre amor y te cuenta algo diferente a las otras películas de amor conocidas. Sin duda la recomiendo, aunque es mejor verla solo o con una buena compañía'),(15,15,15,'APT','El principal atractivo son los dinosaurios. Algo muy importante es hasta que punto puede llegar la codicia del ser humano, subastando en miles de millones de dólares un grupo de animales que fueron prácticamente saqueados de su entorno, creado antaño como atracción para exhibir especies extintas hace decenas de millones artificialmente resucitadas y aprovechando fracasos previos'),(16,16,16,'PM16','Game Of Thrones hizo 2 cosas geniales : Primero ser una gran adaptacion de la obra original de RR.MARTIN e incluso hacer algo que está no pudo y quizas nunca pueda : ser terminada.');
/*!40000 ALTER TABLE `rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repartos`
--

DROP TABLE IF EXISTS `repartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repartos` (
  `id_reparto` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `id_actor` int DEFAULT NULL,
  PRIMARY KEY (`id_reparto`),
  KEY `id_pelicula_idx` (`id_pelicula`),
  KEY `id_actor_idx` (`id_actor`),
  CONSTRAINT `id_actor` FOREIGN KEY (`id_actor`) REFERENCES `actores` (`id_actor`),
  CONSTRAINT `id_pelicula` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repartos`
--

LOCK TABLES `repartos` WRITE;
/*!40000 ALTER TABLE `repartos` DISABLE KEYS */;
INSERT INTO `repartos` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,6,7),(8,6,8),(9,6,9),(10,6,10),(11,6,11),(12,6,12),(13,6,13),(14,7,14),(15,7,15),(16,7,16),(17,7,17),(18,7,18),(19,7,19),(20,8,20),(21,8,21),(22,8,22),(23,8,23),(24,8,24),(25,8,25),(26,9,26),(27,9,27),(28,9,28),(29,9,29),(30,9,30),(31,9,31),(32,10,32),(33,10,33),(34,10,34),(35,10,35),(36,10,36),(37,10,37),(38,11,38),(39,11,39),(40,11,40),(41,11,41),(42,11,42),(43,11,43),(44,11,44),(45,12,45),(46,12,46),(47,12,47),(48,12,48),(49,12,49),(50,12,50),(51,13,51),(52,13,52),(53,13,53),(54,13,54),(55,13,55),(56,13,56),(57,13,57),(58,13,58),(59,13,39),(60,14,59),(61,14,60),(62,14,61),(63,14,62),(64,14,63),(65,14,64),(66,14,65),(67,14,66),(68,14,39),(69,15,67),(70,15,68),(71,15,69),(72,15,70),(73,15,71),(74,15,72),(75,15,73),(76,15,74),(77,15,75),(78,15,76),(79,15,77),(80,15,38),(81,15,39),(82,16,78),(83,16,79),(84,16,80),(85,16,81),(86,16,82),(87,16,83);
/*!40000 ALTER TABLE `repartos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Sci-Fi'),(2,'Fantasía'),(3,'Acción'),(4,'Drama'),(5,'Ficción'),(6,'Sucesos'),(7,'Misterio'),(8,'Crimen'),(9,'Suspenso'),(10,'Aventura'),(11,'Comedia'),(12,'Familia'),(13,'Futurista'),(14,'Terror'),(15,'Suceso Real'),(16,'Romance'),(17,'Ciencia Ficción'),(18,'Otros');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-13 11:49:37
