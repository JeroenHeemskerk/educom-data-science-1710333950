SELECT s.name, 
CASE 
    WHEN d.name = "Directie" THEN c.name
    ELSE "tav directie"
    END AS aanhef,
CASE 
    WHEN s.p_address <> "" THEN s.p_address
    ELSE s.straat
    END AS addres,
CASE
    WHEN s.p_postcode <> "" THEN s.postcode
    ELSE s.postcode
    END as postcode
FROM mhl_suppliers s
LEFT JOIN mhl_contacts c ON s.id = c.supplier_ID
LEFT JOIN mhl_departments d ON c.department = d.id
INNER JOIN mhl_cities ci ON s.city_ID = ci.id
INNER JOIN mhl_communes co ON ci.commune_ID = co.id
WHERE d.name = "Directie" or d.name IS NULL;
