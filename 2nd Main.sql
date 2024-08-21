create database temp;

use temp;

--  for the uniq value of atribute and the check constraints
-- create table account(
-- id int primary key,
-- name varchar(255) unique,
-- balance INT,
-- constraint acc_balance_chk check(balance>1000)
-- );
 -- balance INT CHECK (balance > 1000)
 
 -- Q for default values
 
 create table account(
id int primary key,
name varchar(255) unique,
balance INT not null default 0
);
 
insert into account (id, name, balance)
values (1,'A',10000);

-- we can insert value in the table in any particular column with other values are null
insert into account (id)
values (3);

insert into account (id, name)
values (2,'B');

-- Q. ALTER COMMANDS
--  ADD COLUMN 
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- Q. MODIFY ATA TYPE OF ATRIBUTE changing data type value of interest
ALTER TABLE account MODIFY interest double not null default 0;

-- Q to check what i change in data types
desc account;

--  Q change column RENAME THE COLUMN, 
alter table account change column  interest saving_interest float not null default 0;
 
 -- Q drop column 
 alter table account drop column saving_interest ;
 
 -- Q Rename Table nam
 alter table account rename to account_detail;

drop table account;
select *from account;