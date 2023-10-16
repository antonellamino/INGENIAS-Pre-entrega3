10)
select COUNT(*) as total_peliculas  from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.Descripcion = 'Pelicula';
---------------------------------
select COUNT(*) as total_peliculas  from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.id_categoria = 2;



11)select COUNT(*) as total_series from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.Descripcion = 'Serie';
----------------------------------
select COUNT(*) as total_series  from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.id_categoria = 1;



12)
select Titulo (por que no anda con trailerflix.peliculas.titulo?)
from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.Descripcion = "Serie"
order by p.Temporadas desc;
---------------------------
TAMBIEN PODRIA SER CON EL ID EL where



13)
alter table trailerflix.peliculas
add COLUMN Lanzamiento DATE NULL AFTER Trailer;

update trailerflix.peliculas
join trailerflix.generos
on trailerflix.peliculas.id_genero = trailerflix.generos.id_genero
set lanzamiento = '2023-10-09'
where trailerflix.generos.Descripcion = 'Aventura';


14)
select trailerflix.peliculas.titulo
from trailerflix.peliculas
where trailerflix.peliculas.titulo like '%Aventura%' OR trailerflix.peliculas.resumen like '%madre%';



15)

CREATE TABLE `rankings` (
  `id_ranking` int NOT NULL AUTO_INCREMENT,
  `id_pelicula` int DEFAULT NULL,
  `Ranking` int DEFAULT NULL,
  `Calificación` varchar(45) DEFAULT NULL,
  `Comentarios` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_ranking`),
  KEY `id_pelicula_idx` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3


consultas:

//OBTENER LAS DIFERENTES CALIFICACIONES
select rankings.calificación as calificaciones
FROM rankings
where rankings.calificación is not null
group by calificaciones;

//OBTENER EL TITULO CON SU CALIFICACION
select CONCAT(peliculas.titulo, ' - ', rankings.calificación) as titulo_calificacion
from rankings
join peliculas on rankings.id_pelicula = peliculas.id_pelicula;

//UNIR TABLA PELICULAS CON RANKINGS
select rankings.id_ranking, peliculas.titulo, rankings.calificación, rankings.comentarios
from rankings
join peliculas on rankings.id_pelicula = peliculas.id_pelicula;

