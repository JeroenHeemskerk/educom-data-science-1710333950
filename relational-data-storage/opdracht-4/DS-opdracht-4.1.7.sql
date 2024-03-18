SELECT a.name, b.name, a.id, b.id, a.commune_ID FROM mhl_cities a 
INNER JOIN mhl_communes b ON a.commune_ID = b.id
ORDER BY a.name;
