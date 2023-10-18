1 -- Obtener una lista de películas por género. Realizar una consulta que devuelva todas las películas de un género específico. Por ejemplo, mostrar todas las películas de género "Acción", "Terror" o "Suspenso".

SELECT DISTINCT c.id_pelicula, c.titulo, gen.Descripcion
FROM peliculas c
JOIN generos gen ON c.id_genero = gen.id_genero
WHERE gen.Descripcion IN ('Acción', 'Terror', 'Drama', 'Ciencia Ficción', 'Comedia', 'Familia');


-- 2 Obtener una lista de películas por tags. Realizar una consulta que devuelva todas las películas con los tags "Aventura" y "Ciencia Ficción" o "Aventura" y "Fantasía".

-- A) BUSCAR PELICULAS CON TAGS AVENTURA Y CIENCIA FICCION

SELECT P.Titulo, T.Descripcion  FROM trailerflix.peliculas_tags Datos
JOIN peliculas P ON P.id_pelicula = Datos.id_pelicula
JOIN tags T ON T.id_tag = Datos.id_tag
where T.Descripcion="Aventura" or T.Descripcion="Ciencia Ficción"
ORDER BY Titulo;

-- B) BUSCAR PELICULAS CON TAGS AVENTURA Y FANTASIA

SELECT P.Titulo, T.Descripcion  FROM trailerflix.peliculas_tags Datos
JOIN peliculas P ON P.id_pelicula = Datos.id_pelicula
JOIN tags T ON T.id_tag = Datos.id_tag
where T.Descripcion="Aventura" or T.Descripcion="Fantasía"
ORDER BY Titulo;



-- 3 Generar un informe donde se visualicen todos los títulos y categorías que en su resumen contengan la palabra "misión".


SELECT p.titulo, cat.Descripcion AS categoria
FROM peliculas p
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE p.resumen LIKE '%misión%';


-- 4 Generar un informe donde se visualicen las series con al menos 3 temporadas.

SELECT p.titulo, p.temporadas , cat.Descripcion AS categoria
FROM peliculas p
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE p.temporadas >= 3;

-- 5 Encontrar cuántas películas/series trabajó el actor 'Chris Pratt'

SELECT p.titulo, act.NombreYApellido AS actores
FROM peliculas p
JOIN repartos rp ON p.id_pelicula = rp.id_pelicula
JOIN actores act ON rp.id_actor = act.id_actor
WHERE NombreYApellido LIKE '%Chris Pratt%';

-- O si queremos que nos diga la categoria que es 

SELECT p.titulo, 
       act.NombreYApellido AS actores,
       CASE 
           WHEN cat.Descripcion = 'Película' THEN 'Película'
           WHEN cat.Descripcion = 'Serie' THEN 'Serie'
       END AS TipoCategoria
FROM peliculas p
JOIN repartos rp ON p.id_pelicula = rp.id_pelicula
JOIN actores act ON rp.id_actor = act.id_actor
JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE act.NombreYApellido LIKE '%Chris Pratt%';


-- 6 Informar actrices/actores y sus trabajos fílmicos. 
-- Mostrar el nombre completo de actrices/actores, 
-- el título de sus trabajos fílmicos, la categoría y el género.
SELECT DISTINCT actores.NombreYApellido AS NombreCompleto,
       peliculas.titulo AS TituloPeliculaSerie,
       categorias.Descripcion AS Categoria,
       generos.Descripcion AS Genero
FROM actores
JOIN repartos rp ON rp.id_actor = actores.id_actor
JOIN peliculas ON peliculas.id_pelicula = rp.id_pelicula
JOIN categorias ON peliculas.id_categoria = categorias.id_categoria
JOIN generos  ON peliculas.id_genero = generos.id_genero;


-- 7 Ver solo la categoría "películas". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), duración y el enlace al trailer.

SELECT UCASE(P.Titulo) as 'Titulo Pelicula', UCASE(G.Descripcion) as Genero,group_concat(' ',T.Descripcion) as Tags,P.Duracion,P.Trailer as Trailer FROM trailerflix.peliculas_tags Datos
JOIN peliculas P ON P.id_pelicula = Datos.id_pelicula

JOIN generos G ON G.id_genero=P.id_genero
JOIN tags T ON T.id_tag = Datos.id_tag
where P.id_categoria=2
GROUP BY Titulo;


-- 8 Ver solo la categoría "series". Mostrar el título en mayúscula, el género (en mayúscula), los tags (separados por coma en la misma columna, usando concat o group_concat), la cantidad de temporadas, el enlace al trailer y el resumen.

SELECT UCASE(P.Titulo) as 'Titulo Serie', UCASE(G.Descripcion) as Genero,group_concat(' ',T.Descripcion) as Tags,P.Temporadas,P.Trailer as Trailer,P.Resumen FROM trailerflix.peliculas_tags Datos
JOIN peliculas P ON P.id_pelicula = Datos.id_pelicula

JOIN generos G ON G.id_genero=P.id_genero
JOIN tags T ON T.id_tag = Datos.id_tag
where P.id_categoria=1
GROUP BY Titulo;

-- 9 Identificar la película/serie con más actores y la que posee menos actores (indicar la cantidad de actores en ambos casos).

-- MENOR CANTIDAD DE ACTORES

SELECT P.id_pelicula,
P.Titulo as "Series y películas con menor cantidad de actores"
     , COUNT(a.id_actor) Cantidad_de_Actores 
FROM  trailerflix.repartos Datos
       JOIN peliculas P ON P.id_pelicula=Datos.id_pelicula
JOIN actores A ON A.id_actor=Datos.id_actor
GROUP BY id_pelicula
HAVING   COUNT(A.id_actor) = (SELECT MIN(Cantidad_de_Actores) 
from(
SELECT Titulo,count(a.id_actor) Cantidad_de_Actores

FROM trailerflix.repartos Datos
JOIN peliculas P ON P.id_pelicula=Datos.id_pelicula
JOIN actores A ON A.id_actor=Datos.id_actor
group by titulo) Conteo_Actores);


-- MAYOR CANTIDAD DE ACTORES

SELECT P.id_pelicula,
P.Titulo as "Series y películas con mayor cantidad de actores"
     , COUNT(a.id_actor) Cantidad_de_Actores 
FROM  trailerflix.repartos Datos
       JOIN peliculas P ON P.id_pelicula=Datos.id_pelicula
JOIN actores A ON A.id_actor=Datos.id_actor
GROUP BY id_pelicula
HAVING   COUNT(A.id_actor) = (SELECT MAX(Cantidad_de_Actores) 
from(
SELECT Titulo,count(a.id_actor) Cantidad_de_Actores

FROM trailerflix.repartos Datos
JOIN peliculas P ON P.id_pelicula=Datos.id_pelicula
JOIN actores A ON A.id_actor=Datos.id_actor
group by titulo) Conteo_Actores);

-- 10 Contar la cantidad total de películas registradas.
SELECT 
COUNT(id_pelicula) as "Cantidad de peliculas registradas"
FROM trailerflix.peliculas 
where id_categoria=2;



-- 11)
select COUNT(*) as total_series from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.Descripcion = 'Serie';
----------------------------------
select COUNT(*) as total_series  from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.id_categoria = 1;



-- 12)
select Titulo (por que no anda con trailerflix.peliculas.titulo?)
from trailerflix.peliculas as p
join trailerflix.categorias as c
on p.id_categoria = c.id_categoria
where c.Descripcion = "Serie"
order by p.Temporadas desc;
---------------------------
TAMBIEN PODRIA SER CON EL ID EL where



-- 13)
alter table trailerflix.peliculas
add COLUMN Lanzamiento DATE NULL AFTER Trailer;

update trailerflix.peliculas
join trailerflix.generos
on trailerflix.peliculas.id_genero = trailerflix.generos.id_genero
set lanzamiento = '2023-10-09'
where trailerflix.generos.Descripcion = 'Aventura';


-- 14)
select trailerflix.peliculas.titulo
from trailerflix.peliculas
where trailerflix.peliculas.titulo like '%Aventura%' OR trailerflix.peliculas.resumen like '%madre%';



-- 15)

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

