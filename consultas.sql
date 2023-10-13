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
