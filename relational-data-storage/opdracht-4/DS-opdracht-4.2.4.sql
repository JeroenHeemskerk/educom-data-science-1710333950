#Ends up with no results

SELECT a.name AS company_name, c.name, IFNULL(b.content, "NOT SET") AS Value, c.proptype, d.name AS city FROM mhl_suppliers a
JOIN mhl_properties b on a.id = b.supplier_ID
JOIN mhl_propertytypes c on b.supplier_ID = c.id 
JOIN mhl_cities d on a.city_id = d.id
WHERE d.name = "amsterdam" AND c.proptype = "A";
