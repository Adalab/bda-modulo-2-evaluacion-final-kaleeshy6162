
/* Evaluación Final Módulo 2  --  Final Evaluation Module 2  */

/* Ejercicios /  Base de Datos Sakila:  --  Exercises / Sakila Database:   */

/* 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
   1. Select all movie titles without duplicates. */

SELECT DISTINCT `title`  /* DISTINCT: se utiliza para seleccionar valores únicos de una columna. /  DISTINCT: It is used to select unique values from a column. */
	FROM `film` ;


/* 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
   2. Show the titles of all movies with a "PG-13" rating. */

SELECT `title` 
	FROM `film`
	WHERE `rating` = 'PG-13' ;  /* WHERE: Filtra los resultados para incluir solo aquellas filas donde la columna rating tenga el valor 'PG-13'.
								   WHERE: Filters the results to include only those rows where the column rating has the value 'PG-13'. */


/* 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
   3. Find the title and description of all movies containing the word "amazing" in their description. */

SELECT `title`, `description`
	FROM `film`
	WHERE `description` LIKE '%amazing%' ;   /*  - Filtra los resultados para incluir solo aquellas filas donde la columna description contenga la palabra "amazing". 
												 El uso de % antes y después de "amazing" permite que se encuentren coincidencias que contengan cualquier texto antes o después de la palabra.
												 - Filters the results to include only those rows where the description column contains the word "amazing."
												 The use of % before and after "amazing" allows for matches that contain any text before or after the word.*/


/* 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
   4. Find the title of all movies with a runtime longer than 120 minutes. */

SELECT `title`, `length`
	FROM `film`
	WHERE `length` > 120;  /* - Devuelve los títulos de todas las películas que tienen una duración (length) superior a 120 minutos. 
							  - Returns the titles of all movies that have a duration (length) greater than 120 minutes.*/


/* 5. Recupera los nombres de todos los actores.
   5. Retrieve the names of all actors. */

SELECT `first_name`, `last_name`
	FROM `actor`;

SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name`
	FROM `actor`;   /* CONCAT(): es una función que une (concatena) dos o más cadenas de texto en una sola. En esta query concateno el nombre y el apellido para que esten en una sola columna.
					 CONCAT(): It is a function that joins (concatenates) two or more text strings into one. In this query, I concatenate the first name and last name so that they appear in a single column. */


/* 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
   6. Find the first and last name of actors with "Gibson" in their last name. */

SELECT `first_name`, `last_name`
	FROM `actor`
	WHERE `last_name` = 'Gibson';  /*  WHERE: Filtra los resultados para incluir solo aquellas filas donde la columna rating tenga el valor 'Gibson'.
									 WHERE: Filters the results to include only those rows where the column rating has the value 'Gibson'. */ 


/* 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
   7. Find the names of actors with an actor_id between 10 and 20. */

SELECT `first_name`, `last_name`
	FROM `actor`
	WHERE `actor_id` BETWEEN 10 AND 20;  /* BETWEEN/AND filtra los resultados para incluir solo aquellos actores cuyo actor_id esté en el rango de 10 a 20.
										  BETWEEN/AND filters the results to include only those actors whose actor_id is within the range of 10 to 20.  */


/* 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
   8. Find the title of movies in the film table with a rating other than "R" or "PG-13". */

SELECT `title`
	FROM `film`
	WHERE `rating` NOT IN ('R', 'PG-13');  /* NOT IN: Es una forma de especificar que valores deseas excluir. En este caso excluye las películas que tienen clasificaciones "R" o "PG-13".
											NOT IN: It is a way to specify which values you want to exclude. In this case, it excludes movies that have ratings of "R" or "PG-13."*/

/* 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
   9. Find the total number of movies in each rating category in the film table and show the rating along with the count. */

SELECT `rating`, COUNT(*) AS `total_movies`  
	FROM `film`
	GROUP BY `rating`;  /* GROUP BY: agrupa los resultados por la columna rating. Por cada clasificación, se calculará el recuento de películas que pertenecen a esa clasificación.
						   GROUP BY: Groups the results by the rating column. For each rating, the count of movies belonging to that classification will be calculated.  */


/*10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
   10. Find the total number of movies rented by each customer and display the customer ID, their first and last name, along with the count of rented movies. */

SELECT `c`.`customer_id`, `c`.`first_name`, `c`.`last_name`, COUNT(`r`.`rental_id`) AS `total_rentals`  
	FROM `customer` AS  `c`
		LEFT JOIN `rental` AS `r`                  -- Utilizo LEFT JOIN para combinar datos de dos tablas, seleccionando todos los registros de la tabla de la izquierda. / I use LEFT JOIN to combine data from two tables, selecting all records from the left table.
			ON `c`.`customer_id` = `r`.`customer_id`       -- Establece la condición de unión en base al ID del cliente / Sets the join condition based on the customer ID.
	GROUP BY `c`.`customer_id`, `c`.`first_name`, `c`.`last_name`    -- Agrupo los registros en una columna /  I group the records in a column.
	ORDER BY `total_rentals` DESC;                 -- Lo ordeno de forma descendente /I sort it in descending order.


/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
   11. Find the total number of rentals by category and display the category name along with the rental count. */

SELECT `name` AS `category_name`, COUNT(`r`.`rental_id`) AS `total_rentals`
	FROM `rental` AS `r`
		JOIN `inventory` AS `i`                -- Utilizo JOIN para combinar datos de dos o mas tablas / I use JOIN to combine data from two or more tables.
			ON r.`inventory_id` = `i`.`inventory_id`
		JOIN `film_category` AS `fc` 
			ON `i`.`film_id` = `fc`.`film_id`
		JOIN `category` AS `cat` 
			ON `fc`.`category_id` = `cat`.`category_id`
	GROUP BY `name`                            -- Agrupo los registros en una columna / I group the records into a column.
	ORDER BY `total_rentals` DESC;           -- Lo ordeno de forma descendente / I sort it in descending order.


/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
   12. Find the average runtime of movies for each rating category in the film table and show the rating along with the average runtime. */

SELECT `rating`, round(AVG(length), 0) AS `average_duration`   -- Calculo el promedio con el length y calculo el promedio con AVG / I calculate the average with length and compute the average using AVG.
	FROM `film`
	GROUP BY `rating`
	ORDER BY `average_duration` DESC;


/* 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
   13. Find the first and last name of the actors appearing in the movie titled "Indian Love." */

SELECT `a`.`first_name`, `a`.`last_name`
	FROM `film` AS `f`
		JOIN `film_actor` AS `fa` 
			ON `f`.`film_id` = `fa`.`film_id`
		JOIN `actor` AS `a` 
			ON `fa`.`actor_id` = `a`.`actor_id`
	WHERE `f`.`title` = 'Indian Love';


/* 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
   14. Display the title of all movies containing the word "dog" or "cat" in their description. */

SELECT `title`
	FROM `film`
	WHERE `description` LIKE '%dog%' OR `description` LIKE '%cat%'; /* filtro registros en una consulta, de modo que solo se devuelvan aquellos que cumplen una condición específica
																	   I filter records in a query so that only those that meet a specific condition are returned.*/

/* 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
   15. Is there any actor or actress not appearing in any movie in the film_actor table? */

-- No se encuentra ningun registro. / No records found.
SELECT `first_name`, `last_name`
	FROM `actor`
	WHERE `actor_id` NOT IN (SELECT `actor_id` FROM `film_actor`);  -- Utilizo una NOT IN(subconsulta) para excluir los nombres que no aparezcan en ninguna pelicula / I use a NOT IN (subquery) to exclude names that do not appear in any movie.

-- Sin subconsulta, con union de tablas / Without a subquery, with a union of tables.
SELECT `a`.`first_name`, `a`.`last_name`
	FROM `actor` AS `a`
	LEFT JOIN `film_actor` AS `fa`           
		ON `a`.`actor_id` = `fa`.`actor_id`
	WHERE `fa`.`actor_id` IS NULL;    -- IS NULL Verifica si el valor de una columna es NULL, es decir esta vacio. / IS NULL checks if the value of a column is NULL, meaning it is empty.


/* 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
   16. Find the title of all movies released between 2005 and 2010. */

SELECT `title`
	FROM `film`
	WHERE `release_year` BETWEEN 2005 AND 2010;        


/* 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
   17. Find the title of all movies in the same category as "Family." */

SELECT `f.title`
	FROM `film` AS `f`
		JOIN `film_category` AS `fc` 
			ON `f`.`film_id` = `fc`.`film_id`
		JOIN `category` AS `c` 
			ON `fc`.`category_id` = `c`.`category_id`
	WHERE `c`.`name` = 'Family';


/* 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
   18. Display the first and last name of actors who appear in more than 10 movies. */
   
-- Con la columna movie_count / With the column movie_count.
SELECT `a`.`first_name`, `a`.`last_name`, COUNT(`fa`.`film_id`) AS `movie_count`
	FROM `actor` AS `a`
		JOIN `film_actor` AS `fa` 
			ON `a`.`actor_id` = `fa`.`actor_id`
	GROUP BY `a`.`actor_id`, `a`.`first_name`, `a`.`last_name`
	HAVING `movie_count` > 10;    -- Filtro los grupos de registro que se han creado con el GROUP BY / I filter the groups of records that have been created with GROUP BY.

-- Sin la columna movie_count / Without the movie_count column.
SELECT `a`.`first_name`, `a`.`last_name`
	FROM `actor` AS `a`
		JOIN `film_actor` AS `fa` 
			ON `a`.`actor_id` = `fa`.`actor_id`
	GROUP BY `a`.`actor_id`, `a`.`first_name`, `a`.`last_name`
	HAVING COUNT(`fa`.`film_id`) > 10;


/* 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
   19. Find the title of all movies rated "R" and with a runtime longer than 2 hours in the film table. */

SELECT `title`
	FROM `film`
	WHERE `rating` = 'R' AND `length` > 120;


/* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
   20. Find movie categories with an average runtime over 120 minutes and display the category name along with the average runtime. */

SELECT `c`.`name` AS `category_name`, ROUND(AVG(`f`.`length`), 0) AS `average_length`
	FROM `category` AS `c`
		JOIN `film_category` AS `fc` 
			ON `c`.`category_id` = `fc`.`category_id`
		JOIN `film` AS `f` 
			ON `fc`.`film_id` = `f`.`film_id`
	GROUP BY `c`.`category_id`, `c`.`name`
	HAVING AVG(`f`.`length`) > 120;


/* 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
   21. Find actors who have appeared in at least 5 movies and show the actor's name along with the number of movies they've appeared in. */

SELECT `a`.`first_name`, `a`.`last_name`, COUNT(`fa`.`film_id`) AS `movie_count`
	FROM `actor` AS `a`
	JOIN `film_actor` AS `fa` 
		ON `a`.`actor_id` = `fa`.`actor_id`
	GROUP BY `a`.`actor_id`, `a`.`first_name`, `a`.`last_name`
	HAVING `movie_count` >= 5;

-- Con el nombre y el apellido en la misma columna / With the first name and last name in the same column.
SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name`, COUNT(`fa`.`film_id`) AS `movie_count`
	FROM `actor` AS `a`
	JOIN `film_actor` AS `fa` 
		ON `a`.`actor_id` = `fa`.`actor_id`
	GROUP BY `a`.`actor_id`, `a`.`first_name`, `a`.`last_name`
	HAVING `movie_count` >= 5;


/* 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
   22. Find the title of all movies rented for more than 5 days. Use a subquery to find rental_ids with a duration over 5 days and then select the corresponding movies. */

SELECT `f`.`title`
	FROM `film` AS `f`
	WHERE `f`.`film_id` IN (SELECT `i`.`film_id`     -- Utilizo una subconsulta selecciono `film_id` de la tabla `inventory` / I use a subquery to select film_id from the inventory table.
						FROM `inventory` AS `i`
						WHERE `i`.`inventory_id` IN (SELECT `r`.`inventory_id`    -- Utilizo una subconsulta interna para seleccionar todos los inventory_id de la tabla rental / I use an inner subquery to select all inventory_id from the rental table.        
								FROM `rental` AS `r`
								WHERE (`r`.`return_date` - `r`.`rental_date`) > 5));  -- Condición: Filtro los registros donde la duración del alquiler fue superior a 5 días / Condition: I filter the records where the rental duration was greater than 5 days.



/* 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
   23. Find the first and last name of actors who haven't acted in any "Horror" category movies. Use a subquery to find actors who have appeared in "Horror" movies and exclude them from the list of actors. */

SELECT `a`.`first_name`, `a`.`last_name`
FROM `actor` AS `a`
WHERE `a`.`actor_id` NOT IN (SELECT `fa`.`actor_id`
						FROM `film_actor` AS `fa`
						JOIN `inventory` AS `i` 
							ON `fa`.`film_id` = `i`.`film_id`
						JOIN `rental` AS `r` 
							ON `i`.`inventory_id` = `r`.`inventory_id`
						JOIN `film` AS `f` 
							ON `fa`.`film_id` = `f`.`film_id`
						JOIN `film_category` AS `fc` 
							ON `f`.`film_id` = `fc`.`film_id`
						JOIN `category` AS `c` 
							ON `fc`.`category_id` = `c`.`category_id`
						WHERE `c`.`name` = 'Horror');


/* ----------------------------------------- BONUS ----------------------------------------- */

/* 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
   24. Find the titles of movies that are comedies and have a runtime over 180 minutes in the film table. */

SELECT `f`.`title`
	FROM `film` AS `f`
	JOIN `film_category` AS `fc`  -- Hago un JOIN con la tabla `film_category` para acceder a las categorías de cada película / I perform a JOIN with the film_category table to access the categories of each movie.
		ON `f`.`film_id` = `fc`.`film_id`
	JOIN `category` AS `c`   -- Hago otro JOIN con la tabla `category` para obtener los nombres de las categorías / I perform another JOIN with the category table to obtain the names of the categories.
		ON `fc`.`category_id` = `c`.`category_id`
	WHERE `c`.`name` = 'Comedy' AND `f`.`length` > 180;   /* Filtro para que solo se incluyan películas de la categoría "Comedy" y filtro para que solo se incluyan películas con duración mayor a 180 minutos
															 I filter to include only movies from the "Comedy" category and filter to include only movies with a duration greater than 180 minutes.*/

/* 25. Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.
   25. Find all actors who have acted together in at least one movie. The query should display the first and last name of the actors and the number of movies they've acted in together. */

SELECT `a1`.`first_name` AS `actor1_first_name`, `a1`.`last_name` AS `actor1_last_name`, `a2`.`first_name` AS `actor2_first_name`, `a2`.`last_name` AS `actor2_last_name`, COUNT(`fa1`.`film_id`) AS `co_stars_count`
	FROM `film_actor` AS `fa1`                 -- Selecciono el nombre y el apellido del primer, segundo actor y Utilizo COUNT para contar el número de películas en las que han actuado juntos / I select the first name and last name of the first and second actor, and I use COUNT to count the number of movies they have acted in together.
		JOIN `film_actor` AS `fa2` 
			ON `fa1`.`film_id` = `fa2`.`film_id` AND `fa1`.`actor_id` <> `fa2`.`actor_id` -- Aseguro que no se cuente al mismo actor / I ensure that the same actor is not counted.
		JOIN `actor` AS `a1`
			ON `fa1`.`actor_id` = `a1`.`actor_id`
		JOIN `actor` AS `a2` 
			ON `fa2`.`actor_id` = `a2`.`actor_id`
	GROUP BY `a1`.`actor_id`, `a2`.`actor_id`  -- Agrupo los resultados por los IDs de ambos actores para poder utilizar la funcion COUNT() / I group the results by the IDs of both actors in order to use the COUNT() function.
	HAVING COUNT(`fa1`.`film_id`) >= 1  --  filtro los resultados para incluir solo aquellos pares de actores que han trabajado juntos en al menos una película. / I filter the results to include only those pairs of actors who have worked together in at least one movie.
	ORDER BY `actor1_first_name`, `actor1_last_name`, `actor2_first_name`, `actor2_last_name`;  /* Ordeno alfabéticamente por el nombre y apellido del primer actor, y luego por el nombre y apellido del segundo actor.
																								   I sort alphabetically by the first name and last name of the first actor, and then by the first name and last name of the second actor.*/