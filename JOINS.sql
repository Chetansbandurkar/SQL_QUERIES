create database joins;

use joins;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50)
);

CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client(id)
);

INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 36, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '4545', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'xyz.com', '77767', 'Mumbai', 2);

INSERT INTO Project (id, empID, name, startdate, clientID) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);


-- INNER JOIN 
-- enlist all the employee ID's name along with the Project Allocated to them 
    -- emp_id in project table and the id int he employee tabel
-- select *from employee as e pura table dega niche ke selected columns dege 
-- column of 1 + column of 2
select p.empID,e.id, e.fname,e.lname,p.id ,p.name from employee as e
INNER JOIN
project as p ON e.id=p.empID;

-- can we join without using join keyword ->YS wiil 
-- get same o/p as inner join 
select p.empID,e.id, e.fname,e.lname,p.id ,p.name from employee as e,
project as p where e.id=p.empID;


-- Q2 fetch out all the employeeID's and their contacct detail who have been working 
-- from jodhpur with the clients name working in Hyderabad

select e.id,e.emailID,e.phoneNo,c.first_name,c.last_name ,c.city,e.city from Employee as e
INNER JOIN 
Client as  c on e.id=c.empID
where e.city="jaipur" and c.city="Hyderabad";


-- LEFT JOIN
-- fetch Out each Project allocated to each employee left employee right project

select *from employee as e
left join project as p
on e.id=p.empId;

-- RIGHT JOIN
-- list out all the projects along with the employees name and their respective allocated emails
select p.id ,p.name,e.fname,e.lname,e.emailID from Employee as e
right join 
Project as p
on e.id=p.empID;

-- CROSS JOIN
-- list out all the combination possible for the employees name and project that can exist
select e.fname,e.lname, p.id,p.name from Employee as e
cross join project as p;


-- SUB QUERIES
-- where clause same tabel
select *from Employee where age in (select age from employee where age >30);

-- datadiff function is present  
emp detail working in more than 1 project
select *from employee where id in(
select empID from project group by empId having count(empid)>1
);

-- single value subwuery
-- emp having age >avg age
select *from employee where age>(select avg(age)  from employee);

-- FROM CLAUSE -- derived tables
-- select max age person whose first name contains a
select max(age) from (select *from employee where fname like '%a%' ) as temp;


-- Correlated Queries-- 
-- find the 3rd oldest employee
select *from employee e1
where 3=(
select count(e2.age)
from employee e2
where e2.age>=e1.age
);


-- VIEW 
select *from Employee;

-- crating a view  cutsom  view
create view custom_view as select fname ,age from employee;

-- viewing from custom view table
select *from custom_view;

-- droping view custom 
drop view if exists custom_view;

-- altering the view  will add lname
alter view custom_view as select fname, lname,age from employee;

