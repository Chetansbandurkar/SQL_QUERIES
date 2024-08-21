create database dml;

use dml;

create table Customer(
id integer PRIMARY KEY,
cname varchar(255),
Address varchar(255),
Gender char(2),
city varchar(255),
Pincode integer
);

select *from customer;

 -- DML QUERIES INSERT, UPDATE,DELETE,REPLACE
  -- Q. 2nd way to add in table 
  insert into customer values(12,'git','main road','M','rmapur','123');
  
  
  -- update query 
  UPDATE Customer SET Address='vilaspur road', Gender='F'WHERE id=100;
  
  -- update all rows pincode value to 11000 it will not happen
  -- until we set SQL_SAFE_UPDATES=0;
  SET SQL_SAFE_UPDATES=0;
  update customer set Pincode =11000;
  --  we also can increament the value in specific column
  update customer set pincode =pincode +1;
  
  -- Q.DELETE QUERY single tuple
  delete from customer where id=1;
    -- delete the table
delete from customer;

  
  -- if all values are not present or availbale then othe atribute values ara
  -- will be default or null;
  insert into customer (id,cname) values(1,'raksha');
  insert into customer (id,cname) values(100,'rakha');
  insert into customer (id,cname) values(99,'ramu');
  
--  Q.REPLACE will remove all values in that tuple and
--  and only two value will be there city and id all will be removed
replace into customer (id,city)
values(99,'nanded');

-- Q REPLACE work as insert if ID NOT PRESENt
replace into customer (id,cname,city)
values(20,'lokesh','zunka');

-- other than this all values will be replaced
replace into customer set id=124,cname='mac',city='window';


-- Q.only selected atribute value will remain ,except this all will be set to null
replace into customer (id,cname,city)
select id,cname,city
from customer where id=123;
  
  
-- insert query
INSERT INTO Customer
 value (123,'ram Kumar','Mumbai-highway','M','Jalandhar',442301),
  (124,'raj sharma','hgt road','M','pune',1232301),
  (125,'lakhan dada','jammu small','F','Jalandhar',445301),
  (126,'sameer tem','india gate','F','delhi',65301),
  (127,'chetan bandu','nagar haveli','M','patna',982301)
