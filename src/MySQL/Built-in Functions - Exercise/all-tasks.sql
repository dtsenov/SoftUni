-- 1. Find Names of All Employees by First Name
USE `soft_uni`;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE left(`first_name`, 2) LIKE 'Sa'
ORDER BY `employee_id`;


-- 2. Find Names of All Employees by Last Name

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `last_name` LIKE '%ei%'
ORDER BY `employee_id`;


-- 3. Find First Names of All Employess

SELECT 
    `first_name`
FROM
    `employees`
WHERE
    (YEAR(`hire_date`) BETWEEN 1995 AND 2005)
        AND `department_id` IN (3 , 10)
ORDER BY `employee_id`;


-- 4. Find All Employees Except Engineers

SELECT `first_name`, `last_name`
FROM `employees`
WHERE lower(`job_title`) NOT LIKE '%engineer%'
ORDER BY `employee_id`;


-- 5. Find Towns with Name Length

SELECT `name`
FROM `towns`
WHERE length(`name`) IN (5,6)
ORDER BY `name` ASC;


-- 6. Find Towns Starting With

SELECT `town_id`, `name`
FROM `towns`
WHERE left(lower(`name`), 1) IN ('m', 'k','b','e')
ORDER BY `name`;


-- 7. Find Towns Not Starting With

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    LEFT(LOWER(`name`), 1) != 'r'
        AND LEFT(LOWER(`name`), 1) != 'b'
        AND LEFT(LOWER(`name`), 1) != 'd'
ORDER BY `name`;


-- 8. Create View Employees Hired After

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`, `last_name`
FROM `employees`
WHERE YEAR(`hire_date`) > 2000;

SELECT * FROM `v_employees_hired_after_2000`;


-- 9. Length of Last Name

SELECT `first_name`, `last_name`
FROM `employees`
WHERE length(`last_name`) = 5;


-- 10. Countries Holding 'A'
USE `geography`;

SELECT `country_name`, `iso_code`
FROM `countries`
WHERE `country_name` LIKE '%a%a%a%'
ORDER BY `iso_code`; 


<<<<<<< Updated upstream
-- 11. Mix of Peak and River Names

SELECT 
    p.`peak_name`,
    r.`river_name`,
    LOWER(CONCAT(LEFT(p.peak_name,
                        CHAR_LENGTH(p.peak_name) - 1),
                    r.river_name)) AS 'mix'
FROM
    `peaks` AS p,
    `rivers` AS r
WHERE
    LEFT(r.river_name, 1) = RIGHT(p.peak_name, 1)
ORDER BY `mix`;


-- 12. Games From 2011 and 2012 Year
USE `diablo`;

SELECT 
`name`, DATE_FORMAT(`start`, "%Y-%m-%d") as 'start'
FROM  
`games`
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start`, `name`
LIMIT 50;


-- 13. User Email Providers

SELECT `user_name`, 
RIGHT(`email`, length(`email`)-INSTR(`email`, '@'))  AS 'email provider'
FROM `users`
ORDER BY `email provider`, `user_name`;


-- 14. Get Users with IP Address Like Pattern

SELECT `user_name`, `ip_address`
FROM `users`
WHERE `ip_address` LIKE ("___.1%.%.___")
ORDER BY `user_name`;


-- 15. Show All Games with Duration

SELECT 
`name` AS 'game',
CASE 
	WHEN HOUR(`start`) BETWEEN 0 AND 11 THEN 'Morning'
	WHEN HOUR(`start`) BETWEEN 12 AND 17 THEN 'Afternoon'
	WHEN HOUR(`start`) BETWEEN 18 AND 23 THEN 'Evening'
    END AS 'Part of the Day',
CASE
WHEN `duration` <= 3 THEN 'Extra Short'  
WHEN `duration` BETWEEN 4 AND 6 THEN 'Short'  
WHEN `duration` BETWEEN 7 AND 10 THEN 'Long'
ELSE 'Extra Long'
END AS 'Duration'
 FROM `games`;
 
 
 -- 16. Orders Table
 
 SELECT 
 `product_name`,
 `order_date`,
 DATE_ADD(`order_date`, INTERVAL 3 DAY) AS 'pay_due',
 DATE_ADD(`order_date`, INTERVAL 1 MONTH) AS 'deliver_due' 
 FROM `orders`;
=======
-- 11. Mix of Peak and River Names
>>>>>>> Stashed changes
