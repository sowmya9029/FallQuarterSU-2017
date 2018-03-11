
#(1)Queries involvinginnerjoin on two or more tables
#this query populates user name, order details ,status from different tables for a particular user and orders by date of purchase.
SELECT user_first_name, user_last_name,orders.cart_id, orders.order_id, order_date,order_total,order_shipping_status,os_payment_status FROM users, orders, order_status,cart
WHERE cart.cart_id = orders.cart_id
AND orders.order_id = order_status.order_id
AND users.user_id = cart.user_id  AND users.user_id =4 order by orders.order_date ASC;


#populates  all shipping addreses and details  for a user. 
select  * from shipping_address,users where shipping_address. user_id = users.user_id and user_id='4' ;
#all the book details including the auth name  based book genre; 
select books.book_isbn,book_price,book_title,book_short_desc,auth_first_name from books,authors,book_author where authors.auth_id=book_author.auth_id and books.book_isbn=book_author.book_isbn and books.book_genre ='comic';

#this query fetches all the books with isbn and there respective author names
select b.book_isbn,b.book_title,b.auth_id,a.auth_first_name,a.auth_last_name from book_author b, authors a where a.auth_id =b.auth_id order by a.auth_first_name ASC;




#(2)Queries involving aggregate functions, such as SUM, COUNT, AVG etc.

# a) this sql query helps in retrieving the  number of items in the cart of a particular user. Which can be shown to user as total number of  items in their cart in cart   
select count(*) from line_item where order_id = (select order_id from orders where cart_id=(select cart_id from cart where user_id =18));

# b)this sql query  gets the price total from  cart of a user for a particular day.
select sum(order_total) from orders where cart_id = '1' group by order_date ;

#c)this sql query  gets the total price for  items in cart based on the order id.
select sum(line_item_total) from line_item where order_id = '4' group by order_id ;

#counts all the users for the application who are both byers and sellers 
select  count(*) from users where user_type like '%seller'  ;

#(3)Queries involving subqueries

#populates all books there in the cart of a user ,
select * from books where book_isbn in (select book_isbn from book_cart where cart_id  in (select cart_id from cart where user_id='4'));

# a) this sql query helps in retrieving the  number of items in the cart of a particular user. Which can be shown to user as total number of  items in their cart in cart   
select count(*) from line_item where order_id = (select order_id from orders where cart_id=(select cart_id from cart where user_id =18));

#(4)Queries involving GROUP BY and HAVING clause

#this sql statement fetches  the avgerage of best books whose rating is more than =4 
select  avg(br_rating),book_isbn from book_review group by book_isbn having avg(br_rating)>=4 ;

#creates view for viewing the count of line_items,and total price  for a order based on order_id
CREATE VIEW line_item_detials  as
select order_id,sum(line_item_quantity),sum(line_item_price), count(order_id) AS number_of_items
FROM line_item GROUP BY order_id;

#get the inforamation of  all the users  who are buyer s
select * from users where user_type like 'buyer' or 'buyer%'  order by user_first_name ASC;



#(5)Queries involving left outer join or right outer join of two tables
#this query populates all the books with its name,price,rating and comments
SELECT books.book_isbn, books.book_title, book_genre,book_price,book_short_desc,book_publisher,book_language,br_rating,br_comment FROM book_review
RIGHT JOIN books
ON books.book_isbn = book_review.book_isbn;


#populates all the cards of a user. which helps in showing total cards a user.  
SELECT cc_num, users.user_first_name,user_last_name,user_email FROM users
LEFT JOIN credit_card
ON credit_card.user_id = Users.user_id where users.user_id=15;







