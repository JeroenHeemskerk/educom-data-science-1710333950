CREATE TRIGGER employee_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN 
    IF OLD.date_fired IS NULL AND NEW.date_fired IS NOT NULL THEN
    INSERT INTO employeearchive(employeenumber, date_fired) 
    VALUES(OLD.employeenumber, NEW.date_fired);
    END IF;
END;

DELIMITER $$

CREATE FUNCTION fired_check(
    status TIMESTAMP
)
RETURNS VARCHAR(5)
DETERMINSTIC
BEGIN
    DECLARE status_fired VARCHAR(5)
    IF status IS NOT NULL THEN
        SET status_fired = "FIRED";
    ELSEIF status IS NULL THEN
        SET status_fired = "";
    END IF;
    RETURN (status_fired);
END$$

DELIMITER ; 

DROP VIEW FIREDSTATUS;

CREATE VIEW FIREDSTATUS AS
SELECT 
employeenumber,
lastname,
firstName, 
fired_check(date_fired) AS status
FROM employees;
