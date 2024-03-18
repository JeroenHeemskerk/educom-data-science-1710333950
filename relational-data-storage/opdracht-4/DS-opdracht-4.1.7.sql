SELECT * FROM mhl_cities a 
INNER JOIN mhl_communes b ON a.commune_ID = b.id 
WHERE a.name = b.name; 
