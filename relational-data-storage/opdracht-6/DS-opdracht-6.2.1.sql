SELECT DATE_FORMAT(joindate, '%d.%m.%Y') AS joindate, id  FROM mhl_suppliers
WHERE joindate >= LAST_DAY(joindate) - INTERVAL 7 DAY
  AND joindate <= LAST_DAY(joindate);
