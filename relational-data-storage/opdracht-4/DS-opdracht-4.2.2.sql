SELECT a.name, IFNULL(b.name, "INVALID") FROM mhl_cities a 
INNER JOIN mhl_communes b ON a.commune_ID = b.id  
