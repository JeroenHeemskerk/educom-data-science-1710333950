SELECT e.name, a.name, a.straat, a.huisnr, a.postcode, b.name FROM `mhl_suppliers` a 
INNER JOIN `mhl_cities` b on a.city_id=b.id
INNER JOIN `mhl_suppliers_mhl_rubriek_view` c on a.id=c.mhl_suppliers_ID
INNER JOIN `mhl_rubrieken` d on c.mhl_rubriek_view_ID=d.id
INNER JOIN `mhl_rubrieken` e on d.id=e.parent
WHERE d.name='drank' AND b.name='amsterdam'
ORDER BY e.name, a.name;
