# Retrieve first and last name of actors who played in AFRICAN EGG
SELECT first_name, last_name from actor WHERE actor_id IN (SELECT actor_id FROM film_actor WHERE film_id IN (SELECT film_id from film WHERE film.title = "AFRICAN EGG"));

# Retrieve names of movies starting with A.
SELECT title FROM film WHERE title LIKE 'A%';

# Retrieve data of all actors whose names are not starting with Z.
SELECT * FROM actor WHERE first_name NOT LIKE 'Z%';

# Retrieve rental and return date for the movie ALASKA PHANTOM.
SELECT rental_date, return_date FROM rental WHERE inventory_id IN (SELECT inventory_id FROM inventory WHERE film_id IN (SELECT film_id from film WHERE film.title = "ALASKA PHANTOM"));

# Find and display the Income (payments) generated during August 2005. Sort them in the descending order.
SELECT amount FROM payment WHERE payment_date LIKE '2005-08%' ORDER BY amount DESC;

# Extract information of actors whose names ends with character ‘T’
SELECT * FROM actor WHERE last_name LIKE '%T';