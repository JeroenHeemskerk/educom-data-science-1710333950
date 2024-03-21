CREATE VIEW DIRECTIE AS
SELECT 
c.supplier_ID AS id,
c.name AS name,
c.contacttype AS Functie,
d.name AS Department
FROM mhl_contacts c
INNER JOIN mhl_departments d ON c.department = d.id
WHERE d.name = "Directie" OR c.contacttype LIKE "%directeur%";
