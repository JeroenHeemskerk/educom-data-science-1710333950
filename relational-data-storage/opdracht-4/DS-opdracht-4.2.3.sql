SELECT b.id,
CASE 
    WHEN a.name IS NULL THEN b.name
    ELSE a.name
END AS hoofdrubriek,
CASE
    WHEN a.name IS NULL THEN NULL
    ELSE b.name
END AS subrubriek
FROM mhl_rubrieken a 
RIGHT JOIN mhl_rubrieken b ON a.id = b.parent
ORDER BY hoofdrubriek
