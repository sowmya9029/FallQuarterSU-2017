-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
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