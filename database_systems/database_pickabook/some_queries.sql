CREATE TABLE book_author (
    book_isbn int  ,
    auth_id int ,
    PRIMARY KEY (book_isbn,auth_id),
    
    FOREIGN KEY (auth_id) REFERENCES authors(auth_id),
FOREIGN KEY (book_isbn) REFERENCES books(book_isbn)
);

CREATE TABLE shipping_address (
    ship_id int primary key  ,
    user_id int ,
    ship_street_addr varchar(100),
   ship_zip_code int,
ship_state varchar(45),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE book_review (
    br_id int primary key  ,
    book_isbn int ,
     user_id int,
    br_comment varchar(100), 
   br_rating int not null,
ship_state varchar(45),
    FOREIGN KEY (book_isbn) REFERENCES books(book_isbn),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE orders (
    order_id int primary key  ,
    cart_id int ,
     order_date date not null,
    order_shipping_cost double not null,
   order_tax double not null,
    order_total double not null,
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id)
);
CREATE TABLE order_status (
    os_id int primary key  ,
    order_id int ,
     os_payment_status varchar(45) not null,
    order_shipping_status varchar(45) not null,
    os_est_arrival_date date,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO `pickabook_schema`.`authors`
(`auth_id`,
`auth_first_name`,
`auth_city`,
`auth_last_name`)
VALUES(7,
'Thomos',
'New Jersey',
'Cormen');
INSERT INTO `pickabook_schema`.`authors`
(`auth_id`,
`auth_first_name`,
`auth_city`,
`auth_last_name`)
VALUES(10,
'alane',
'Oregon',
'moore');
