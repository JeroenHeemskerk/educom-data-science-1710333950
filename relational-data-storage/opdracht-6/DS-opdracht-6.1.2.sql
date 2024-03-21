SELECT * FROM (
SELECT co.name AS gemeente, 
s.name AS leverancier, 
SUM(h.hitcount) AS total_hitcount, 
AVG(h.hitcount) AS average_hitcount
FROM mhl_suppliers s
INNER JOIN mhl_hitcount h ON s.id = h.supplier_ID
INNER JOIN mhl_cities c ON s.city_ID = c.id
INNER JOIN mhl_communes co ON c.commune_ID = co.id
GROUP BY s.name)
AS tmp
WHERE total_hitcount > average_hitcount;
