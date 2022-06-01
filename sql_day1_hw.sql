--Week 5 - Monday Questions



--Syntax -- ALWAYS need SELECT and FROM
SELECT
FROM
--JOIN
--ON
WHERE
GROUP BY 
HAVING 
ORDER BY 
OFFSET 
LIMIT



--1. How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(*)
FROM actor
WHERE last_name = 'Wahlberg';

--Answer: 2


--2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--Answer: 5,607


--3. What film does the store have the most of? (search in inventory)

SELECT film_id, COUNT(*) AS num_inventory
FROM inventory
GROUP BY film_id
ORDER BY num_inventory DESC;

--Answer: FILM ID 193


--COUNT + GROUP BY !!
SELECT num_inventory, COUNT(*)
FROM (
	SELECT film_id, COUNT(*) AS num_inventory
	FROM inventory
	GROUP BY film_id
	ORDER BY num_inventory DESC
) AS answer
GROUP BY num_inventory;



--4. How many customers have the last name ‘William’?

SELECT COUNT(0)
FROM customer
WHERE last_name = 'William';

--Answer: 0


--5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(*) AS num_sales
FROM payment
GROUP BY staff_id
ORDER BY num_sales DESC;

--Answer: Staff ID #2 made 7,304 sales

SELECT staff_id, COUNT(*) AS num_sales
FROM rental
GROUP BY staff_id
ORDER BY num_sales DESC;

--Answer: Staff ID #1 made 8,040 sales


--6. How many different district names are there?

SELECT DISTINCT district
FROM address;

--Answer: 378

SELECT district, COUNT(*)
FROM address
GROUP BY district;

--Answer: 378


--7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--Answer: Film ID 508


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(*)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

--Answer: 13


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

SELECT amount, COUNT(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250;

--Answer: three payment amounts -- $2.99, $4.99, $0.99


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

SELECT rating, COUNT(*)
FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC;

--Answer: 5 rating categories, the most common being PG-13



