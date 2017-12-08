use platform;
-- Create Table User (
--     u_id Integer,
--     login_name Char(20) Unique,
--     password Char(20),
--     email Text(50),
--     user_pic_link Char(50),
-- 	primary key (u_id));-- 


Create Table Product ( 	#added column category
	p_id Integer,
    sellerid varchar(150),
    p_name Char(100),
    p_quantity Integer, 
    p_description Text(500),
    p_date DATETIME,
    product_pic_link Text,
    category Text,
    price float,
    primary key (p_id, sellerid),
    foreign key (sellerid) references auth_user(username));


Create Table OrderRecord (
	o_id Integer,
    productid integer Not Null,
    tradeinfo Text,
    trade_result integer,
    productseller varchar(150),
    o_quantity integer,
    buyerid varchar (150),
    o_date Date,
    primary key (o_id),
    foreign key (productid, productseller) references Product(p_id, sellerid),
    foreign key (buyerid) references auth_user(username));

    
Create Table Feedback (
	f_id Integer,
    FeedbackUser varchar (150),
    Product Integer Not Null,
    Seller varchar(150),
    f_content Text(500),
    f_score Integer check (0 <= f_score <= 10),
    f_date Date,
    unique (FeedbackUser, Product),
    primary key (f_id),
    foreign key (FeedbackUser) references auth_user(username),
    foreign key (Product, Seller) references Product (p_id, sellerid));
    

    
Create Table Rating (
	r_id Integer,
    r_score Integer check (r_score = 0 or r_score = 1 or r_score = 2),
    r_date Date,
    RatingUser varchar(150),
    FeedbackUser varchar(150),
    FeedbackProduct Integer Not Null,
    Feedback_id Integer,
    Unique (RatingUser, Feedback_id),
    primary key (r_id),
    foreign key (RatingUser) references auth_user(username),
    foreign key (Feedback_id) references Feedback (f_id),
    foreign key (FeedbackUser, FeedbackProduct) references Feedback (FeedbackUser, Product),
    Check (RaringUser <> FeedbackUser)); 
    
Create Table Search_Record(
	user varchar(150),
    content varchar(300),
    time timestamp,
    Primary Key (user, content, time),
    FOREIGN KEY (user) references auth_user(username)
);