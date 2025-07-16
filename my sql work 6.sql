USE sakila;

SELECT *
FROM customer
;

SELECT
	first_name,
    last_name,
    email
FROM customer
;

SET SQL_SAFE_UPDATES = 0;

SELECT
	SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', 1), '.', -1) AS email_last_name
FROM customer;

ALTER table customer
ADD COLUMN email_last_name VARCHAR(50) 
;

UPDATE customer
SET email_last_name = SUBSTRING_INDEX(SUBSTRING_INDEX(email, '@', 1), '.', -1)
;

UPDATE customer
SET email_full_name = 		CONCAT(
							CONCAT(UPPER(LEFT(first_name,1)),
							 LOWER(SUBSTRING(first_name, 2))),
							' ',
					  CONCAT(UPPER(LEFT(email_last_name, 1)),
							 LOWER(SUBSTRING(email_last_name, 2)))
                             );