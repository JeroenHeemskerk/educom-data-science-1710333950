SELECT b.name, b.straat, b.huisnr, b.postcode FROM `mhl_cities` a LEFT JOIN `mhl_suppliers` b on a.id=b.p_city_id; 
