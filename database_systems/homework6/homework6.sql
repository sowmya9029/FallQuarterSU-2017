-- --------------------------------------------------------------------------------
-- Routine setRelocationFee
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setRelocationFee`(in employeeID int,inout relocationfee int  )
begin 
DECLARE city INT;
select city into city from offices where officeCode = (select officeCode from employees where employeeNumber = @employeeID);
case city
 when 'san francisco' THEN
set relocationfee= 10000;
when city ='Boston' THEN
set relocationfee= 8000;
when city ='London' THEN
set relocationfee= 20000;
else
set relocationfee= 15000;
End case;
end


-- --------------------------------------------------------------------------------
-- Routine changeCreditLimit
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `changeCreditLimit`(in customer int,in totalpayment double)
BEGIN
DECLARE payment double;
DECLARE currentlimit double;

SELECT count(amount) INTO payment
FROM payments 
WHERE customerNumber = @customer group by customerNumber; 
IF payment < totalpayment THEN
update customers set creditLimit = 2000+creditLimit  where customerNumber =@customer ;
 END IF;
END

-- --------------------------------------------------------------------------------
-- Routine insertOdd

-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOdd`()
BEGIN
DECLARE first  INT;
DECLARE last  INT;
DECLARE step INT;
set first = 1;
SET step = 2;
SET last = 20;
loop_label: LOOP

IF first=5 or first=15 THEN
SET first =first+step;
ITERATE loop_label; 

end if;
IF (first>last) THEN
LEAVE loop_label;
ELSE
INSERT INTO odd set number=first;
SET first =first+step; 
ITERATE loop_label;
end IF;
 END loop;
END

