CREATE TABLE `actores` (
  `id_actor` int NOT NULL AUTO_INCREMENT,
  `NombreYApellido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

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

CREATE TABLE `peliculas_tags` (
  `id_pelicula_tag` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `id_tag` int DEFAULT NULL,
  PRIMARY KEY (`id_pelicula_tag`),
  KEY `id_pelicula_idx` (`id_pelicula`),
  KEY `id_tag_idx` (`id_tag`),
  CONSTRAINT `id_tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `rankings` (
  `id_ranking` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `Ranking` int DEFAULT NULL,
  `Calificación` varchar(45) DEFAULT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_ranking`),
  KEY `id_pelicula_idx` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

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

CREATE TABLE `tags` (
  `id_tag` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
