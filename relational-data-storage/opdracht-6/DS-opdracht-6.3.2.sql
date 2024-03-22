SELECT 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
        REPLACE( name, '&eacute;', 'é'),
        '&ouml;', 'ö'),
    '&Uuml;', 'Ü'),
'&euml;','ë'),
'&egrave;','è'),
'&iuml;','ï'),
'&acirc;','â') 
AS modified_name
FROM 
    mhl_suppliers;
