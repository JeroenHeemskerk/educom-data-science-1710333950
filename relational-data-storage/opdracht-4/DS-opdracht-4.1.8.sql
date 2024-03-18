#Incomplete

SELECT a.name AS name, a.id AS c1id, b.id as c2id, a.commune_ID as c1_c_id, b.commune_ID as c2_c_id, c.id as c1_g_id, d.id as c2_g_id, c.name as c1_gemeente, d.name as c2_gemeente
FROM mhl_cities a
INNER JOIN mhl_cities b ON a.name = b.name
INNER JOIN mhl_communes c on a.commune_ID = c.id
INNER JOIN mhl_communes d on b.commune_ID = d.id
WHERE a.id != b.id  
