SELECT e.hitcount, a.name, b.name, c.name, d.name FROM mhl_suppliers a
INNER JOIN mhl_cities b ON a.city_ID = b.id
INNER JOIN mhl_communes c ON b.commune_ID = c.id
INNER JOIN mhl_districts d ON c.district_ID = d.id
INNER JOIN mhl_hitcount e ON a.id = e.supplier_ID
WHERE year = 2014 
AND month = 1 
AND d.name = 'Limburg' 
OR  year = 2014 
AND month = 1 
AND d.name = 'Breda' 
OR year = 2014 
AND month = 1 
AND d.name = 'Zeeland';
