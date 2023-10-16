-- Obtener una lista de películas por género. Realizar una consulta que devuelva todas las películas de un género específico. Por ejemplo, mostrar todas las películas de género "Acción", "Terror" o "Suspenso".

SELECT DISTINCT c.id_pelicula, c.titulo, gen.Descripcion
FROM peliculas c
JOIN generos gen ON c.id_genero = gen.id_genero
WHERE gen.Descripcion IN ('Acción', 'Terror', 'Drama', 'Ciencia Ficción', 'Comedia', 'Familia');



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
