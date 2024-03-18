SELECT year, 
sum(CASE WHEN month IN (1, 2, 3) THEN 1 ELSE 0 END) AS eerste_kwartaal,
sum(CASE WHEN month IN (4, 5, 6) THEN 1 ELSE 0 END) AS tweede_kwartaal,
sum(CASE WHEN month IN (7, 8, 9) THEN 1 ELSE 0 END) AS derde_kwartaal,
sum(CASE WHEN month IN (10, 11, 12) THEN 1 ELSE 0 END) AS vierde_kwartaal,
sum(hitcount) AS totaal
FROM mhl_hitcount
GROUP BY year;
