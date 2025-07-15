Use world;
SELECT
	District,
    Population
FROM city
ORDER BY Population DESC
LIMIT 1
OFFSET 2
;

SELECT
	Name,
    District,
    Population
FROM city
WHERE Name LIKE 'F%'
;

SELECT
	Name,
    District,
    Population
FROM city
WHERE Name LIKE '%A'
;

SET SQL_SAFE_UPDATES = 0;

ALTER table emptable
ADD COLUMN formatted_hire_date DATE
;

UPDATE emptable
SET formatted_hire_date = str_to_date(hire_date,'%m/%d/%Y')
;

SELECT *
FROM emptable
;

ALTER table emptable
ADD COLUMN formatted_DOB DATE
;

UPDATE emptable
SET formatted_DOB = str_to_date(date_of_birth,'%m/%d/%Y')
;

ALTER table emptable
DROP COLUMN hire_date
;

ALTER table emptable
DROP COLUMN date_of_birth
;

ALTER table emptable
DROP COLUMN new_hire_date
;

SELECT *
FROM emptable
;

