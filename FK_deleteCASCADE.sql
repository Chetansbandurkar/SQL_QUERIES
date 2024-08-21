create database FK;
-- on delete cascade aplication

use fk;

create table Customer(
id integer PRIMARY KEY,
cname varchar(255),
Address varchar(255),
Gender char(2),
city varchar(255),
Pincode integer
);
select *from customer;
 insert into customer values(12,'git','main road','M','rmapur','123');

 
 create table Order_det(
 order_id int primary key,
 delivery_data DATE,
 cust_id int,
 foreign key(cust_id)references Customer(id) on delete set null
 -- foreign key(cust_id)references Customer(id) on delete cascade
 );
 
 -- on delete cascade data from both paren and the chidl table 
 -- for the correspndin id get deleted
 delete from customer where id=12;
 
 -- on delete null when the delete oeration perform 
 --  data in child tavle will be marked with null i.e value at FK =null 
 
 select *from order_det;
 
  insert into Order_det
 values (7,'2024-08-01',12),
  (8,'2024-08-23',12)
