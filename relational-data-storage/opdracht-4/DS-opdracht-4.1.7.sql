SELECT a.name AS C1_name, b.name AS C2_name, a.id AS C1_id, b.id AS C2_id, a.commune_id AS C1_commune_id, b.commune_id AS C2_commune_id
FROM mhl_cities a
INNER JOIN mhl_cities b ON a.name = b.name
WHERE a.commune_id != b.commune_id
ORDER BY a.name;
