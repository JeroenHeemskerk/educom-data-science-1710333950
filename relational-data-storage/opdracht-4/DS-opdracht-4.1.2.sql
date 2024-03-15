SELECT a.name, a.straat, a.huisnr, a.postcode FROM `mhl_suppliers` a
INNER JOIN mhl_cities b ON a.city_id = b.id
INNER JOIN mhl_communes c ON b.commune_ID = c.id
WHERE c.name = 'steenwijkerland';
