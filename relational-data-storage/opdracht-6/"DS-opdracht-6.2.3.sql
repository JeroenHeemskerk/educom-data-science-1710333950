SELECT dag, COUNT(id) AS 'aantal meldingen'
FROM (SELECT id, DAYNAME(joindate) as dag
FROM mhl_suppliers)
AS tmp
GROUP BY dag
