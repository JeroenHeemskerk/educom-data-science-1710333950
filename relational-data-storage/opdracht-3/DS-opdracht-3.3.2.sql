SELECT * FROM mhl_suppliers a
INNER JOIN mhl_cities b ON a.city_ID=b.id
ORDER BY a.membertype, b.name, a.postcode;
