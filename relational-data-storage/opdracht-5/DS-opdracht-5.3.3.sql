SELECT s.name, 
CASE 
    WHEN d.name = "Directie" THEN c.name
    ELSE "tav directie"
    END AS aanhef,
v.addres, v.postcode, v.stad FROM mhl_suppliers s
INNER JOIN verzendlijst v ON v.id = s.id
INNER JOIN directie d ON d.id = d.id
GROUP BY s.name;
