create table users(user_id int NOT NULL UNIQUE,name varchar(40),email varchar(30) UNIQUE,password varchar(20) NOT NULL, user_type varchar(10));

create table orders(order_id int,order_cost int,date date,primary key(order_id));

 create table products(product_id int,product_name varchar(25),color varchar(15),foreign key(product_id) references items(product_id));

create table items(product_id int ,price int(10),primary key(product_id));

create table ordered(order_id int,product_id int,quantity int,sale_price int);

create table customer(user_id int,order_id int,primary key(user_id));


insert INTO users(user_id,name,email,password, user_type) values (1,"Bob","bob@gmail.com","bob12345","seller");

insert INTO users(user_id,name,email,password, user_type) values (2,"Tom","tom@gmail.com","tom12345","seller");

insert INTO users(user_id,name,email,password, user_type) values (3,"ran","ran@gmail.com","ran12345","seller");

insert INTO users(user_id,name,email,password, user_type) values (4,"abc","abc@gmail.com","abc12345","buyer");

insert INTO users(user_id,name,email,password, user_type) values (5,"sam","sam@gmail.com","sam12345","buyer");


 insert into products(product_id,product_name,color)values(1,"pen","pink");

insert into products(product_id,product_name,color)values(2,"bottle","red");

 insert into products(product_id,product_name,color)values(3,"watch","blue");

insert into products(product_id,product_name,color)values(4,"watch","black");


nsert into orders(order_id,order_cost,date)values(1,1000,'2016/1/1');

insert into orders(order_id,order_cost,date)values(2,1500,'2016/2/14');

 insert into orders(order_id,order_cost,date)values(3,2000,'2016/2/20');


insert into items(product_id,price)values(1,100);

insert into items(product_id,price)values(2,200);

insert into items(product_id,price)values(3,500);

insert into items(product_id,price)values(4,1000);


insert into ordered(order_id,product_id,quantity,sale_price)values(1,1,6,660);
insert into ordered(order_id,product_id,quantity,sale_price)values(1,2,2,440);
insert into ordered(order_id,product_id,quantity,sale_price)values(2,3,3,1650);
insert into ordered(order_id,product_id,quantity,sale_price)values(3,4,2,2500);

insert into customer(user_id,order_id)values(1,1);
 insert into customer(user_id,order_id)values(2,2);
insert into customer(user_id,order_id)values(3,3);
insert into customer(user_id,order_id)values(4,1);
insert into customer(user_id,order_id)values(5,2);
insert into customer(user_id,order_id)values(5,3);
