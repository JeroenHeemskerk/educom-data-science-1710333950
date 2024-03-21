SELECT year AS jaar, 
CASE 
    WHEN month = 1 THEN 'Januari'
    WHEN month = 2 THEN 'Februari'
    WHEN month = 3 THEN 'Maart'
    WHEN month = 4 THEN 'April'
    WHEN month = 5 THEN 'Mei'
    WHEN month = 6 THEN 'Juni'
    WHEN month = 7 THEN 'Juli'
    WHEN month = 8 THEN 'Augustus'
    WHEN month = 9 THEN 'September'
    WHEN month = 10 THEN 'October'
    WHEN month = 11 THEN 'November'
    WHEN month = 12 THEN 'December'
END AS maand,
COUNT(supplier_ID) AS 'Aantal leveranciers', 
SUM(hitcount) AS 'Totaal aantal hits'
FROM mhl_hitcount
GROUP BY year DESC, month DESC;
