SELECT tmp.name, COUNT(s.id) FROM
(SELECT b.id,
CASE
    WHEN a.name IS NULL THEN b.name
    ELSE CONCAT(a.name , " - " , b.name)
END as name
FROM mhl_rubrieken a 
RIGHT JOIN mhl_rubrieken b ON a.id = b.parent)
AS tmp
INNER JOIN mhl_suppliers_mhl_rubriek_view sr ON tmp.id = sr.mhl_rubriek_view_ID
INNER JOIN mhl_suppliers s ON sr.mhl_suppliers_ID = s.id
GROUP BY tmp.name;
