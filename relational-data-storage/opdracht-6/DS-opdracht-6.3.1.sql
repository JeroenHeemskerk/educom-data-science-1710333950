SELECT name,
CONCAT(UPPER(LEFT(name, 1)), SUBSTRING(name, 2)) AS better_name
FROM mhl_cities  
