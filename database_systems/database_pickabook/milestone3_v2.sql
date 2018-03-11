#################################################################################
#  ASSIGNNMENT: Milestone #3
#
#  DESCRIPTION: Creates the tables for our "Pickabook" ERD, populates them with
#  dummy data, and performs queries on the database.
#
#  FILE: milestone3_v2.sql
#
#  AUTHOR: Sowmya Satyavada (satyavad@seattleu.edu) and Scott Moser 
#          (mosers1@seattleu.edu)
#################################################################################

# Drop tables if they exist so we can run this script repeatedly
DROP TABLE IF EXISTS `book_author`;
DROP TABLE IF EXISTS `book_review`;
DROP TABLE IF EXISTS `book_cart`;
DROP TABLE IF EXISTS `book_review`;
DROP TABLE IF EXISTS `credit_card`;
DROP TABLE IF EXISTS `line_item`;
DROP TABLE IF EXISTS `order_status`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `shipping_address`;
DROP TABLE IF EXISTS `authors`;
DROP TABLE IF EXISTS `books`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `Users`;

#################################################################################
# PARTS I: Write SQL statements to create tables for your database application. 
# Pick suitable data types for each attribute. For each table, specify primary 
# key and indicate foreign key if any.
################################################################################# 
CREATE TABLE Users (
  user_id int(11) NOT NULL,
  user_first_name varchar(45) DEFAULT NULL,
  user_last_name varchar(45) DEFAULT NULL,
  user_password varchar(45) DEFAULT NULL,
  user_email varchar(45) DEFAULT NULL,
  user_type varchar(45) DEFAULT NULL,
  user_username varchar(45) DEFAULT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE authors (
  auth_id int(11) NOT NULL,
  auth_first_name varchar(45) NOT NULL,
  auth_city varchar(45) DEFAULT NULL,
  auth_last_name varchar(45) NOT NULL,
  PRIMARY KEY (auth_id)
);

CREATE TABLE books (
  book_isbn int(11) NOT NULL,
  user_seller_id int(11) DEFAULT NULL,
  book_title varchar(45) NOT NULL,
  book_edition_num int(11) DEFAULT NULL,
  book_short_desc varchar(145) NOT NULL,
  book_long_desc varchar(1000) DEFAULT NULL,
  book_genre varchar(45) NOT NULL,
  book_cover_type varchar(45) NOT NULL,
  book_price double NOT NULL,
  book_publisher varchar(45) NOT NULL,
  book_publish_year varchar(45) NOT NULL,
  book_language varchar(45) NOT NULL,
  PRIMARY KEY (book_isbn),
  FOREIGN KEY (user_seller_id) 
  REFERENCES Users (user_id) 
);

CREATE TABLE book_author (
  book_isbn int(11) NOT NULL,
  auth_id int(11) NOT NULL,
  PRIMARY KEY (book_isbn,auth_id),
  FOREIGN KEY (auth_id) REFERENCES authors(auth_id),
  FOREIGN KEY (book_isbn) REFERENCES books (book_isbn)
);

CREATE TABLE book_review (
  br_id int(11) NOT NULL,
  book_isbn int(11) DEFAULT NULL,
  user_id int(11) DEFAULT NULL,
  br_comment varchar(1000) DEFAULT NULL,
  br_rating int(11) NOT NULL,
  PRIMARY KEY (br_id),
  FOREIGN KEY (book_isbn) REFERENCES books (book_isbn),
  FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE cart (
  cart_id int(11) NOT NULL,
  user_id int(11) DEFAULT NULL,
  cart_shiping_speed varchar(45) NOT NULL,
  PRIMARY KEY (cart_id),
  FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE book_cart (
  book_isbn int(11) NOT NULL,
  cart_id int(11) NOT NULL,
  PRIMARY KEY (book_isbn,cart_id),
  FOREIGN KEY (book_isbn) REFERENCES books (book_isbn) ,
  FOREIGN KEY (cart_id) REFERENCES cart (cart_id) 
);

CREATE TABLE credit_card (
  user_id int(11) DEFAULT NULL,
  cc_holdername varchar(45) NOT NULL,
  cc_num int(30) NOT NULL,
  cc_exp_date varchar(45) NOT NULL,
  cc_bill_street_addr varchar(45) NOT NULL,
  cc_bill_zip_code int(11) NOT NULL,
  cc_bill_state varchar(45) NOT NULL,
  cc_cvv int(3) NOT NULL,
  PRIMARY KEY (cc_num),
  FOREIGN KEY (user_id) REFERENCES Users (user_id)
);

CREATE TABLE orders (
  order_id int(11) NOT NULL,
  cart_id int(11) DEFAULT NULL,
  order_date date NOT NULL,
  order_shipping_cost double NOT NULL,
  order_tax double NOT NULL,
  order_total double NOT NULL,
  PRIMARY KEY (order_id),
  KEY cart_id (cart_id),
  FOREIGN KEY (cart_id) REFERENCES cart (cart_id)
);

CREATE TABLE line_item (
  order_id int(11) NOT NULL,
  line_item_num int(11) NOT NULL,
  book_isbn int(11) NOT NULL,
  line_item_price double NOT NULL,
  line_item_quantity int(11) NOT NULL,
  line_item_total double NOT NULL,
  PRIMARY KEY (order_id,line_item_num),
  FOREIGN KEY (order_id) REFERENCES orders (order_id) 
);

CREATE TABLE order_status (
  os_id int(11) NOT NULL,
  order_id int(11) DEFAULT NULL,
  os_payment_status varchar(45) NOT NULL,
  order_shipping_status varchar(45) NOT NULL,
  os_est_arrival_date date DEFAULT NULL,
  PRIMARY KEY (os_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

CREATE TABLE shipping_address (
  ship_id int(11) NOT NULL,
  user_id int(11) DEFAULT NULL,
  ship_street_addr varchar(100) DEFAULT NULL,
  ship_zip_code int(11) DEFAULT NULL,
  ship_state varchar(45) DEFAULT NULL,
  PRIMARY KEY (ship_id),
  FOREIGN KEY (user_id) REFERENCES Users (user_id)
);


#################################################################################
# PART II: Write SQL statements to populate each table in your database with at
# least 10records.
#################################################################################

INSERT INTO Users VALUES 
	(1,'sowmya','satyavada','1234','sowmya@gmail.com','seller/buyer',NULL),
    (2,'scott','moser','1234','scott@gmail.com','buyer',NULL),
    (3,'harsha','sree','1234','harsha@gmail.com','seller/buyer',NULL),
    (4,'john','P','1234','jonh@gmail.com','buyer',NULL),
    (5,'Li','Lin','1234','li@seattleu.edu','buyer',NULL),
    (6,'Zin','Zhu','1223','zin@su.edu','seller',NULL),
    (7,'Oh','sheila','4568','oh@su.edu','buyer',NULL),
    (8,'shivani','patinani','9876','shivani.yahoo.co.in','seller/buyer',NULL),
    (9,'rutu','bhatt','7654','rutu@gmail.com','seller',NULL),
    (10,'adam','tanaous','3456','adam@gmail.com','buyer',NULL),
    (11,'osama','johma','9873','osama@gmail.com','buyer',NULL),
    (12,'mark','hu','3456','mark.hu@gmiail.com','buyer',NULL),
    (13,'chi','wang','3456','chi@expedia.com','seller',NULL),
    (14,'namesh','kair','4567','nameh@gmail.com','seller/buyer',NULL),
    (15,'dan','lao','2567','dan@gmail.com','buyer',NULL),
    (16,'liz','johnson','1234','liz@gmail.com','seller',NULL);

INSERT INTO authors VALUES 
	(1,'Henry','Bothell','Fielding'),
    (2,'Samuel','Bothell','Richardson'),
    (3,'Jonathan','Seattle','Swift'),
    (4,'Daniel','New York','Defoe'),
    (5,'John','New York','Bunyan'),
    (6,'Benjamin','New Jersey','Disraeli'),
    (7,'Thomos','New Jersey','Cormen'),
    (8,'sedney','Oregon','sheldon'),
    (9,'galye','Oregon','mcdowel'),
    (10,'alane','Oregon','moore'),
    (13,'jk','max','rowling');

INSERT INTO books VALUES 
	(1112,1,'java',1,'book short description2',NULL,'education','type1',100,'publisher1','1998','english'),
    (1234,6,'DatabaseSystems',2,'book short description1','testing ashdb tadsvv','education','cover type6',100,'publisher2','2001','engish'),
    (1314,1,'the hunger games',2,'awesome book ',NULL,'education','cover type1',600,'publisher1','2013','chinese'),
    (1516,3,'catching fire',34,'must read','aghshdgsv gfafsf','thriller','type2',300,'publisher12','2005','french'),
    (1718,8,'harry potter',65,'blah blah blah','ong descrption 1','tragedy','type4',100,'publisher4','1990','hindi'),
    (1920,14,'breadking dawn',4,'must read book',NULL,'fiction','type7',500,'publisher19','1907','english'),
    (2021,8,'mockingjay',32,'mind blowing suspense',NULL,'fiction','cover type9',200,'publisher9','1897','english'),
    (2223,13,'eclipse',7,'qwerty',NULL,'fiction','cover type1',200,'publisher6','1987','french'),
    (5678,13,'comic book1',3,'blah blah blah',NULL,'comic','type3',600,'publisher8','1865','hindi'),
    (8910,16,'horror book1',4,'testing 1234','dassas faddfd eafdfdfds asdda ','thriller','cover type12',400,'publisher0','2016','spanich'),(9876,6,'comic',6,'this is short description',NULL,'comic','non',53,'publisher6','2017','hindi');

INSERT INTO cart VALUES 
	(1,2,'6 days'),
    (2,4,'2 days'),
    (3,5,'7 days'),
    (4,11,'1 day'),
    (5,12,'1 day'),
    (6,15,'2 weeks'),
    (7,16,'3 days'),
    (8,11,'1 day'),
    (9,4,'1 day'),
    (10,2,'2 days');

INSERT INTO orders VALUES 
	(1,1,'2017-08-11',234,34,268),
    (2,2,'2016-08-13',45,5,50),
    (3,5,'2001-08-16',123,23,126),
    (4,7,'2013-08-09',543,43,586),
    (5,4,'2017-08-11',20,20,40),
    (6,10,'2012-07-06',290,12,302),
    (7,6,'2011-12-09',534,23,557),
    (8,9,'2019-08-16',876,31,907),
    (9,8,'2010-07-17',1345,54,1399),
    (10,3,'2006-05-06',32,1,33),
    (11,1,'2017-08-11',1111,23,1134);

INSERT INTO book_cart VALUES 
	(1234,1),
    (1314,2),
    (2223,2),
    (1314,3),
    (1718,4),
    (2223,5),
    (1718,6),
    (1516,7),
    (1920,8),
    (1112,9),
    (2223,9),
    (1112,10);

INSERT INTO book_author VALUES 
	(1112,1),
    (1234,2),
    (1920,3),
    (1314,4),
    (1516,5),
    (2021,6),
    (2223,7),
    (5678,8),
    (1718,9),
    (8910,10),
    (5678,13);

INSERT INTO book_review VALUES 
	(1,1112,2,'never read this book',3),
	(2,1234,4,'I dare you to try to find a boring portion of this book, because you won\'t--it is captivating from start to finish and able to be enjoyed by anyone. If you\'re looking for a great read for your vacation, a long ride in the car or just to read in bed each night-this is an excellent choice!\" Writing Tips',4),
    (3,1314,5,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',1),
    (4,1516,11,'A fan of Peter Savage novels since the release of the first novel by Dave Edlund, I couldn\'t pass up a great price for the four book set on iBooks. Now I have them on my iPad instead of carrying hard copies. With the holidays coming up, I couldn\'t think of a better gift for someone that likes action packed thrillers tied to current events. ',5),
    (5,1718,12,'experience it your self',5),(6,8910,14,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',4),
    (7,1920,2,'What an experience it has been to read these novels! I am very happy to have been able to read them all at once because to me they are really one long book broken into four physically manageable sizes. The story Ferrante tells is compelling and moving and interesting all the way through (and if, as a non-Italian reader, ',5),
    (8,5678,5,'I\'m halfway through this book and so far it\'s been pretty good. He explains things well although I would have liked more hands-on exercises that had real-world goals and examples. Many of the exercises (around 75%) use specific and/or real-world examples but there are a good number of them that are more conceptual and I found these hard to follow (around 25%). Still, overall, it seems to be a good \"Intro to Java\" book.',3),
    (9,2021,7,'I found her main character really irritating, self absorbed and unsympathetic . She shows virtually no warmth to her children and only once mentions playing with the youngest. I felt there were 2 books too many. The first book was lively and interesting with a full range of credible characters. The 2nd book was less so. By the 3rd I\'d had enough of Elena. ',5),
    (10,2223,1,'This author is a hard worker who does his research and the book\'s premise was interesting. Unfortunately, his writing never rises above cliche level. Sadly, after reading the first of the four books (I could not pass up the great price which I found on Bookbub.com) I never went back for books 2, 3 and 4. The first level thriller writers like Silva, Connelly and Childs can flat do it. This guy can\'t.',4);

INSERT INTO credit_card VALUES 
	(7,'oh sheila',9876567,'05/19/2021','address7',98765,'or',432),
    (1,'sowmya satyavda',87654390,'12/09/2008','address9',65432,'ca',667),
    (4,'john l',123457920,'11/08/2019','address1',78293,'ny',123),
    (2,'scott',345678902,'05/09/2025','address5',98012,'fl',111),
    (10,'adam',354728420,'04/19/2017','address2',12345,'nj',456),
    (5,'li lin',472467328,'11/18/2018','address3',98022,'wa',345),
    (15,'sree',763252830,'09/01/2013','address8',56793,'ca',123),
    (3,'harsha',765432190,'09/03/2022','address6',98011,'nv',908),
    (15,'dan lao',876540981,'01/08/2020','address8',56793,'ca',654),
    (12,'mark hu',1234567890,'05/19/2019','address4',56345,'tx',567),
    (8,'shivani',1276534987,'09/08/2016','address10',76534,'ar',898);

INSERT INTO line_item VALUES 
	(1,123,1112,100,3,300),
    (2,234,1234,100,2,200),
    (3,432,1718,100,1,100),
    (4,543,2223,200,6,1200),
    (4,610,9876,53,1,54),
    (5,546,1516,300,1,300),
    (6,876,5678,600,1,600),
    (7,367,8910,400,3,600),
    (8,234,1314,300,2,600),
    (9,543,1920,500,5,2500),
    (10,789,2021,200,5,2500);

INSERT INTO order_status VALUES 
	(1,2,'completed','delivered','2025-06-12'),
    (2,1,'cancelled','pending','2019-06-12'),
    (3,3,'cancelled','pending','2018-01-18'),
    (4,5,'completed','delivered','2012-12-11'),
    (5,6,'completed','shipping','2025-06-12'),
    (6,4,'completed','delivered','2017-04-21'),
    (7,7,'completed','shipping','2023-06-21'),
    (8,8,'cancelled','pending','2025-06-12'),
    (9,9,'completed','shipping','2017-04-21'),
    (10,10,'completed','delivered','2017-04-22');

INSERT INTO shipping_address VALUES 
	(1,3,'address8',12343,'wa'),
    (2,4,'address1',34565,'wa'),
    (3,5,'address1',34565,'wa'),
    (4,2,'address7',32455,'ca'),
    (5,7,'address1',34565,'wa'),
    (6,11,'address9',98003,'fl'),
    (7,12,'address6',98012,'ny'),
    (8,13,'address3',54678,'nj'),
    (9,14,'address1',34565,'or'),
    (10,15,'address2',23986,'ca');


#################################################################################
# PART III - SQL QUERIES
#################################################################################
	
#################################################################################
# Query #1: Queries involving inner join on two or more tables
#################################################################################
# This SQL query populates user first name, user last name, order details, status 
# from different tables for a particular user and orders by date of purchase.
SELECT user_first_name, user_last_name, orders.cart_id, orders.order_id, order_date, 
order_total,order_shipping_status,os_payment_status 
FROM Users, orders, order_status,cart
WHERE cart.cart_id = orders.cart_id
AND orders.order_id = order_status.order_id
AND Users.user_id = cart.user_id AND Users.user_id=4 ORDER BY orders.order_date ASC;

#################################################################################
# Query #2: Queries involving aggregate functions, such as SUM, COUNT, AVG etc.
#################################################################################
# This SQL query counts all of the users for the application who are both buyers
# and sellers.
SELECT COUNT(*) AS numBuyerANDSeller
FROM Users
WHERE user_type LIKE '%seller';

#################################################################################
# Query #3: Queries involving subqueries
#################################################################################
# This SQL query populates all books present in a customer's shopping cart.
SELECT * 
FROM books
WHERE book_isbn IN (
	SELECT book_isbn
    FROM book_cart
    WHERE cart_id  IN (
		SELECT cart_id
        FROM cart
        WHERE user_id='4')
	);

#################################################################################
# Query #4: Queries involving GROUP BY and HAVING clause
#################################################################################
# This SQL query fetches the average rating of highly rated books whose average
# rating is greater than or equal to 4. 
SELECT AVG(br_rating), book_isbn
FROM book_review
GROUP BY book_isbn
HAVING AVG(br_rating) >= 4 ;

#################################################################################
# Query #5: Queries involving left outer join or right outer join of two tables
#################################################################################
# This SQL query yields all books with its name, price, rating, and comments.
# Since this is a right outer join, all records are returned from books while
# matching records from book_review are returned. Any non-matching records in
# book_review are NULL.
SELECT books.book_isbn, books.book_title, book_genre, book_price, book_short_desc, 
book_publisher, book_language, br_rating, br_comment 
FROM book_review
RIGHT OUTER JOIN books USING (book_isbn);