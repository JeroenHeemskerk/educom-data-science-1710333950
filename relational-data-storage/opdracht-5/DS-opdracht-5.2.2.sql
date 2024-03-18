SELECT b.name, 
SUM(CASE WHEN c.name = "gold" THEN 1 ELSE 0 END) as gold,
SUM(CASE WHEN c.name = "silver" THEN 1 ELSE 0 END) as silver,
SUM(CASE WHEN c.name = "bronze" THEN 1 else 0 END) as bronze,
SUM(CASE WHEN c.name NOT IN ("gold", "silver", "bronze") THEN 1 else 0 END) as other
FROM mhl_suppliers a
INNER JOIN mhl_cities b ON a.city_ID = b.id
INNER JOIN mhl_membertypes c ON a.membertype = c.id
GROUP BY b.name
ORDER BY b.name
