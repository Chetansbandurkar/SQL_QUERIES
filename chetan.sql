create database temp1;
use temp1;

create table chetan(
id INT primary key,
name VARCHAR(255)
);

insert into chetan values(1,'ram');

select * from chetan;
drop database if exists temp1;