CREATE TABLE Courses(
courseCode varchar(6)  primary key  ,
courseName varchar( 70) NOT NULL  ,
credits int NOT NULL ,
courseLevel char(2)  
);

CREATE TABLE Students (
    studentID char(11) primary key,
    lastName varchar(255) NOT NULL,
    firstName varchar(255) NOT NULL,
    gender char(1),
   dateofBirth date NOT NULL
);
CREATE TABLE Registration(
studentID char(11),
courseCode varchar(6),
FOREIGN KEY (studentID) REFERENCES Students(studentID) ,
FOREIGN KEY (courseCode) REFERENCES  Courses(courseCode) ,
grade decimal(2,1) NOT NULL 
);

 INSERT INTO Students(studentID, firstName, lastName, gender, dateofBirth)
VALUES ('861103-2438', 'Adam','Johnson ', 'M', '1990-10-01'),
('911212-1746', 'Eva ','Smith', 'F', '1991-08-20'),('950829-1848', 'Anna ','Washington', 'F', '1993-09-26'),
('123456-0980', 'Eric ','Alonzo', 'M', '1990-05-26'),
('908023-2456', 'Bo ','Ek', 'M', '1992-03-15'),
('098735-3456', 'Danny ','Goss', 'M', '1992-02-01')
,('124345-3430', 'Mike ','White', 'M', '1995-06-10')
,('124568-1345', 'Emily ','Young', 'F', '1995-04-28')
,('908409-0010', 'Cathy ','Lee', 'F', '1993-10-06')
,('124587-9088', 'Ben ','Woo', 'M', '1992-11-30')
,('120953-0909', 'Anna ','Washington', 'F', '1990-10-09')
,('120449-1008', 'John ','Goss', 'M', '1995-10-26')
;


INSERT INTO Courses(courseCode, courseName, courseLevel, credits)
VALUES ('CS056', 'DatabaseSystems ', 'G1', 5),
('CS010', 'C++ ','U1', 5),
('ENG111','English','U1',3),
('FIN052','Finance','G1',5),
('PHY210','Physics','U2',5),
('CHE350','Chemistry','U3',5),
('BIO001','Biology','U1',3),
('CS052','Operating Systems','G1',5);

INSERT INTO registration(studentID, courseCode, grade)
VALUES ('861103-2438', 'CS056',4),
('861103-2438', 'CS010',4),
('861103-2438', 'PHY210',3.5),
('911212-1746', 'ENG111 ',2),

('950829-1848', 'CHE350',3),
('950829-1848', 'BIO001',2.5),


('123456-0980', 'CS052',3.5),
('123456-0980', 'CS056',4),
('908023-2456', 'PHY210',3.0),

('908023-2456', 'CS056',1.0),
('908023-2456', 'CS010',2.0),


('124345-3430', 'FIN052',2.5)
,('124345-3430', 'CHE350',4)
,('908409-0010', 'CS052',2)
,('124587-9088', 'BIO001',4)
,('124587-9088', 'CS052',3.5)
;

SELECT lastName,firstName FROM students ORDER BY lastName ASC, firstName ASC;
       


SELECT studentID,lastName,firstName,dateofBirth from students where gender = 'F' AND dateofBirth < '1992-12-31'

SELECT COUNT(DISTINCT studentID) FROM registration WHERE courseCode = 'PHY210'

SELECT COUNT(courseCode) FROM courses WHERE courseCode LIKE 'CS%'

SELECT courseCode,courseName  FROM courses WHERE credits = 5 AND courseLevel = 'G1'

SELECT courseLevel ,Count(courseCode) FROM courses GROUP BY courseLevel

SELECT avg(grade) from registration where studentID='861103-2438'

SELECT studentID from registration where grade = ( SELECT MAX( grade ) FROM registration where courseCode = 'CS052' )  AND  courseCode = 'CS052'

SELECT distinct courseCode from registration where studentID IN ('861103-2438','123456-0980')

SELECT * from students where studentID not in (select distinct studentID from registration ) 

SELECT studentID,SUM(grade),AVG(grade) from registration GROUP BY studentID Having avg(grade)<3; 

SELECT studentID FROM registration GROUP BY studentID ORDER BY COUNT(studentID) DESC limit 1
  
SELECT studentId from registration where courseCode = 'PHY210' OR  courseCode ='BIO001'

SELECT lastName,firstName from students order by dateofBirth DESC limit 1

UPDATE courses SET credits = 6 WHERE courseCode Like 'CS%' 

DELETE FROM registration WHERE studentID = '908409-0010'

SELECT count(studentID) from students where studentID NOT IN (select studentID from registration where courseCode ='CS056' )

Which courses (course name, course credits) have been taken by the student with student ID 861103-2438?



#all product join sql statements 
Select * from Students,Registration;

Select * from Students cross join registration;

select StudentId,grade from student join registartion;

#all inner join 
Select * from Students natural join registration;

select courseCode,grade from Students,registration  where students.studentID = registration.StudentID order by grade;


