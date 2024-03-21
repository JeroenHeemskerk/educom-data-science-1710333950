SELECT tmp.name, SUM(h.hitcount)
FROM
(SELECT r1.id,
CASE
    WHEN r1.name IS NULL THEN r2.name
    WHEN r2.name IS NULL then r1.name
    ELSE CONCAT(r2.name , " - " , r1.name)
END as name
FROM mhl_rubrieken r1
LEFT JOIN mhl_rubrieken r2 ON r1.parent = r2.id)
AS tmp
INNER JOIN mhl_suppliers_mhl_rubriek_view sr ON tmp.id = sr.mhl_rubriek_view_ID
INNER JOIN mhl_suppliers s ON sr.mhl_suppliers_ID = s.id
INNER JOIN mhl_hitcount h ON s.id = h.supplier_ID
GROUP BY tmp.name
