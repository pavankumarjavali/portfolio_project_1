/* SQL Skills : Sorting , Filtering , Average , SUM , Aliasing & 
				Joins , search operations , CASE statements,
				using temporary tables .

*/


-- This will display all the contents of film table  
SELECT *
FROM film

-- Lets FILTER movies by their ratings , this will only display the movies 
-- having R rating
-- It also demonstrates the use of aliasing .
SELECT title, rating AS r_rated_movies
FROM film
WHERE rating ='R';

-- Lets do Sorting and Filtering 
SELECT title , rental_rate ,replacement_cost
FROM film
WHERE replacement_cost < 25.00
ORDER BY rental_rate DESC

SELECT COUNT(title)
FROM film
WHERE replacement_cost < 25.00 AND rental_rate < 4

-- Searching operations 
SELECT *
FROM film
WHERE title LIKE 'Ace%'

-- Lets do some computations
SELECT AVG(rental_rate) AS average_rental_rate
FROM film

SELECT SUM(rental_rate) AS sum_rental_rate
FROM film

SELECT AVG(rental_duration) AS average_rental_duration_days
FROM film

-- Lets join two tables using inner join , 
/*  Inner join takes the values that are common in both the tables and 
	joins the table, it doesnt take all the values like the outer join function.
*/
SELECT first_name,last_name,address ,district 
FROM customer
INNER JOIN address
 ON customer.address_id = address.address_id

-- outer join
SELECT first_name,last_name,address ,district 
FROM customer
FULL OUTER JOIN address
 ON customer.address_id = address.address_id
 

-- Using CASE statements and also creating a temporary table .

SELECT title ,rental_rate,
CASE
	WHEN rental_rate > 2 THEN rental_rate -(rental_rate*0.10)
END AS festive_discount
FROM film
WHERE rental_rate > 2
ORDER BY rental_rate

CREATE TEMPORARY TABLE discount_prices (
	title varchar(200),
	rent_rate numeric,
	rate_after_discount numeric 
)

INSERT INTO discount_prices 
SELECT title ,rental_rate,
CASE
	WHEN rental_rate > 2 THEN rental_rate -(rental_rate*0.10)
END AS festive_discount
FROM film
WHERE rental_rate > 2
ORDER BY rental_rate

SELECT *
FROM discount_prices
