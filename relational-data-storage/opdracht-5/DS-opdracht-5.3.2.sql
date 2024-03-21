CREATE VIEW VERZENDLIJST AS
SELECT s.id,
CASE 
    WHEN s.p_address <> "" THEN s.p_address
    ELSE CONCAT(s.straat, " ", s.huisnr)
    END AS addres,
CASE
    WHEN s.p_postcode <> "" THEN s.p_postcode
    ELSE s.postcode
    END as postcode,
CASE 
    WHEN s.p_address <> "" THEN c2.name
    ELSE c1.name
    END AS stad
FROM mhl_suppliers s
INNER JOIN mhl_cities c1 ON s.city_ID = c1.id
LEFT JOIN mhl_cities c2 ON s.p_city_ID = c2.id;
