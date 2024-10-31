
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

SELECT `rating`, COUNT(*) AS `total_movies`  /* 
FROM `film`
GROUP BY `rating`;  /* GROUP BY: agrupa los resultados por la columna rating. Por cada clasificación, se calculará el recuento de películas que pertenecen a esa clasificación.
					   GROUP BY: Groups the results by the rating column. For each rating, the count of movies belonging to that classification will be calculated.  */


/* 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
   10. Find the total number of movies rented by each customer and display the customer ID, their first and last name, along with the count of rented movies. */

SELECT c.`customer_id`, c.`first_name`, c.`last_name`, COUNT(r.`rental_id`) AS `total_rentals`
FROM `customer` AS  `c`
LEFT JOIN `rental` AS `r` 
ON c.`customer_id` = r.`customer_id`
GROUP BY c.`customer_id`, c.`first_name`, c.`last_name`
ORDER BY `total_rentals` DESC;


/* 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
   11. Find the total number of rentals by category and display the category name along with the rental count. */

/* 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
   12. Find the average runtime of movies for each rating category in the film table and show the rating along with the average runtime. */

/* 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
   13. Find the first and last name of the actors appearing in the movie titled "Indian Love." */

/* 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
   14. Display the title of all movies containing the word "dog" or "cat" in their description. */

/* 15. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
   15. Is there any actor or actress not appearing in any movie in the film_actor table? */

/* 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
   16. Find the title of all movies released between 2005 and 2010. */

/* 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".
   17. Find the title of all movies in the same category as "Family." */

/* 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
   18. Display the first and last name of actors who appear in more than 10 movies. */

/* 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.
   19. Find the title of all movies rated "R" and with a runtime longer than 2 hours in the film table. */

/* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
   20. Find movie categories with an average runtime over 120 minutes and display the category name along with the average runtime. */

/* 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
   21. Find actors who have appeared in at least 5 movies and show the actor's name along with the number of movies they've appeared in. */

/* 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
   22. Find the title of all movies rented for more than 5 days. Use a subquery to find rental_ids with a duration over 5 days and then select the corresponding movies. */

/* 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
   23. Find the first and last name of actors who haven't acted in any "Horror" category movies. Use a subquery to find actors who have appeared in "Horror" movies and exclude them from the list of actors. */

/* ----------------------------------------- BONUS ----------------------------------------- */

/* 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
   24. Find the titles of movies that are comedies and have a runtime over 180 minutes in the film table. */

/* 25. Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.
   25. Find all actors who have acted together in at least one movie. The query should display the first and last name of the actors and the number of movies they've acted in together. */

