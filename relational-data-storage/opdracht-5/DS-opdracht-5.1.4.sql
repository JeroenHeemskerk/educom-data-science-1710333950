SELECT b.name, SUM(a.hitcount) AS numhits, count(a.month) AS nummonth, ROUND(AVG(a.hitcount), 0) AS avghitcount
 FROM `mhl_hitcount` a 
INNER JOIN mhl_suppliers b ON a.supplier_ID = b.id
GROUP BY b.name;
