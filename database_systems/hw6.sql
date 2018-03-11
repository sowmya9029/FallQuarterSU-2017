 delimiter |
CREATE PROCEDURE setRelocationFee(employeeID int(11),relocationfee int())
BEGIN
 DECLARE state INT;
 Select state into state from offices where officeCode = (select officeCode from employees where employeeNumber = employeeID);
ALTER TABLE employees
ADD relocationfee;
 IF state='SanFransisco'
  UPDATE employees SET relocationfee = 10000 where employeeCode = employeeID;
 END IF;
END
|
