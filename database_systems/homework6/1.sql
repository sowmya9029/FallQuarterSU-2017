
select courseName,credits
from  courses,registration
where registration.courseCode = courses.courseCode
 and registration.studentID='861103-2438';

select registration.studentid,students.firstname,students.lastname,sum(courses.credits) 
from students,courses,registration 
where registration.studentId=students.studentId 
and registration.courseCode= courses.courseCode 
group by registration.studentId;



 
 create view Student_Info 
 As select registration.studentid,students.firstname,students.lastname,avg(registration.grade) 
 As AVGGrade
 from students,registration where registration.studentId=students.studentId  
 group by registration.studentId;
 

 select studentid,lastname,firstname 
 from Student_Info 
 where avggrade = (select max(avggrade) from student_info );
 
(select firstname,lastname  from courses,registration,students 
where registration.studentId=students.studentId 
and registration.courseCode= courses.courseCode 
and courses.coursename = 'databasesystems');


SELECT DISTINCT students.firstname, students.lastname
FROM students,
(SELECT registration.studentId FROM registration NATURAL JOIN courses WHERE courseName = 'DatabaseSystems') s1, 
(SELECT studentID FROM registration NATURAL JOIN courses WHERE courseName = 'c++') s2 
where students.studentID=s1.studentID and s2.studentID=s1.studentID;


SELECT DISTINCT students.studentID, firstname, lastname,courses.courseName,registration.grade FROM 
students JOIN registration USING (studentId)
Left JOIN courses USING (courseCode);

SELECT DISTINCT  firstname, lastname,courses.courseName FROM 
students  JOIN registration USING (studentId)
 JOIN courses USING (courseCode) where registration.courseCode Like 'CS%';


delimiter $$
CREATE TRIGGER insert_inventory
AFTER insert ON Inventory
FOR EACH ROW
BEGIN
INSERT INTO Inventory_history
SET action = 'dd an item',
itemid = NEW.itemid, oldprice = null,
changedOn = NOW();
END$$



delimiter $$
CREATE TRIGGER change_quantity
AFTER insert ON  Transaction
FOR EACH ROW
BEGIN
UPDATE Inventory SET quantity = quantity - NEW.quantity   WHERE itemid = NEW.itemid;
END$$



delimiter $$
CREATE TRIGGER change_price
before Update  ON  Inventory
FOR EACH ROW
BEGIN
INSERT INTO Inventory_history
SET action = 'price change',
itemid = OLD.itemid, oldprice = OLD.price,
changedOn = NOW();
END$$

