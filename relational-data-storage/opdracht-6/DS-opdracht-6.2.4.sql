SELECT jaar, 
maand, 
COUNT(id) AS aantal
FROM(
SELECT YEAR(joindate) AS jaar,
MONTHNAME(joindate) AS maand,
id
FROM mhl_suppliers)
AS tmp
GROUP BY jaar, maand
