SELECT a.name, a.straat, a.huisnr, a.postcode
FROM mhl_suppliers a
JOIN mhl_cities b ON a.city_ID = b.id
JOIN mhl_cities c ON a.p_city_ID = c.id
WHERE b.name = 'amsterdam' AND c.name != 'amsterdam';
