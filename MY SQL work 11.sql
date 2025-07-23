USE samplestore;

SELECT *
FROM `employee attrition`
;


-- Method 1
SELECT 
	ROUND(
        (SELECT COUNT(MaritalStatus)
        FROM `employee attrition`
        WHERE MaritalStatus = 'Divorced') 
        * 100
        /
        (SELECT COUNT(MaritalStatus)
        FROM `employee attrition`),2)
         AS PercentageDivorced
        ;
        
-- Method 2
WITH Total_employees AS (
			 SELECT 
                         COUNT(MaritalStatus) AS TotalEmployees
                         FROM `employee attrition`
                         )
			 SELECT
			    ROUND(
                            (SELECT 
                            COUNT(MaritalStatus)
                            FROM `employee attrition`
                            WHERE MaritalStatus = 'Divorced') * 100
                            /
                            TotalEmployees,2) AS Percentage_Divorced
			    FROM Total_employees
                            ;
