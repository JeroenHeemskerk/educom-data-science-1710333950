SELECT a.name, a.straat, a.huisnr, a.postcode, b.lat, b.lng FROM `mhl_suppliers` a 
INNER JOIN `pc_lat_long` b ON a.postcode = b.pc6
ORDER BY b.lat DESC
LIMIT 5;
