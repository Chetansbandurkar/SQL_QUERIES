-- Main Table
-- Stores the details of the Workers
 CREATE DATABASE ORG;
-- SHOW SCHEMAS;
 -- ALTERNATE TO THE SHOW DATABASS
 USE ORG;
CREATE TABLE Worker 
( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
);  
select MAX(salary) from worker group by department;
-- inserting into the workker table
Insert INTO Worker 
    (Worker_id, First_Name, Last_Name, Salary, Joining_Date, Department) 
    VALUES
    (001, 'Monika' , 'Arora', 100000, '14-02-20 09:00:00'  , 'HR'),
    (002, 'Niharika' , 'Verma', 80000, '14-06-11 09:00:00' , 'Admin'),
    (003, 'Vishal' , 'Singhal', 300000, '14-02-20 09:00:00' , 'HR'),
    (004, 'Amitabh' , 'Singh', 500000, '14-02-20 09:00:00' , 'Admin'),
    (005, 'Vivek' , 'Bhati', 500000, '14-06-11 09:00:00' , 'Admin'), 
    (006, 'Vipul' , 'Diwan' , 200000 , '14-06-11 09:00:00' , 'Account'),
    (007, 'Satish' , 'Kumar' , 75000, '14-01-20 09:00:00' , 'Account'),
    (008, 'Geetika' , 'Chauhan' , 90000, '14-04-11 09:00:00' , 'Admin'); 
        
-- view of table
SELECT * FROM WORKER;

-- References from the Main Table 'Worker'
-- Stores the Amount of Bonus being given to some Worker Corresponding to their 'Worker_id'
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus
       (WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE)
       VALUES
       (001, 5000, '16-02-20'),
		   (002, 3000, '16-06-11'),
		   (003, 4000, '16-02-20'),
		   (001, 4500, '16-02-20'),
		   (002, 3500, '16-06-11');
		   
SELECT * FROM Bonus;

-- References the Main Table 'Worker'
-- Stores the Title assigned to a worker Corresponding to their 'Worker_id'
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title
         (WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM)
         VALUES
          (001, 'Manager', '2016-02-20 00:00:00'),
          (002, 'Executive', '2016-06-11 00:00:00'),
          (008, 'Executive', '2016-06-11 00:00:00'),
          (005, 'Manager', '2016-06-11 00:00:00'),
          (004, 'Asst. Manager', '2016-06-11 00:00:00'),
          (007, 'Executive', '2016-06-11 00:00:00'),
          (006, 'Lead', '2016-06-11 00:00:00'),
          (003, 'Lead', '2016-06-11 00:00:00');
    
SELECT * FROM Title;

--  Query1
-- Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as worker_name from worker;

-- Query 2
-- Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) as worker_name from worker;

-- Query 3
-- Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department  as diff from worker;
--  using group by
select department from worker group by department;

-- Query 4
-- Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
-- post processing 
-- SUBSTRING(string ,start ,lenght) 
-- The start position. The first position in string is 1.
select substring(first_name,1,3) as subpart from worker;

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY right(name,3), ID ASC;
-- it will search foar last 3 word of string 
-- Query 5
--  Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
/*
The Below Query Would give me the Entries where the first Name is Amitabh.
SELECT * FROM Worker 
WHERE first_name = 'Amitabh';

Now to find the position of a SubString in a String, we use INSTR Function
INSTR(string1, string2)
String1 - the main string to be searched in
String2 - The string to be searched in string1 - 0 returned if not found
Note: Ye Function Case Insensitive Search Karta Hai, meaning that case ka farak ni padta isse - both would be treated in a Similar Manner.
*/
select instr(first_name,'b') as find from worker where first_name='Amitabh';


-- Query 6
-- Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
-- LTRIM() would remove it from the left Side.
-- SELECT RTRIM('SQL Tutorial    ') AS RightTrimmedString;
-- SELECT LTrim("    GFG") AS LeftTrimmedString;
select rtrim(first_name)from worker;

-- Query 7
-- Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(first_name) from worker;


-- Query 8
-- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
-- Length() Function is used to find the length of the string in a Table.
select distinct department ,length(department) as len from worker;

-- Query 9
-- Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
-- REPLACE(string, from_string, new_string)
select replace(first_name,'a','A') from worker ;

-- Query 10
-- Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them and the concat Function can take Whatever number of Arguments are given to it.
-- CONCAT(expression1, expression2, expression3,...)
select concat(first_name,last_name) as full_name from worker;


-- Query 11
-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
-- By default, the Order that is given out would be in Ascending Order, therefore it is not important to mention the 'ASC' Clause
select *from worker order by first_name asc;

-- Query 12
-- Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending. DEFAULT ASC
-- The order by clause can be passed multiple statements & not just ordering by some single column!
select *from worker order by first_name , department  desc;

-- Query 13
-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
-- 'IN' Keyword can be used to pass Multiple Possible Arguments for the column being asked values from.
select *from worker where first_name in('vipul','satish');

-- Query 14
-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
-- The 'NOT' Keyword would exclude the values given in the Arguments mentioned by the user.
select *from worker where first_name NOT in ('vipul','satish');

-- Query 15
-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
-- The '*' means that after the 'admin' text you can have any text & it would be still shown in the results.
-- Therefore, we'll be using Wildcards here.
-- administat,adminstt ye bhi a jate
select *from worker where department like 'admin%';

-- Query 16
-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
-- The '%' sign is helpul where there are no characters [NULL Character] or even when they are there, there can be n number of characters
select *from worker where first_name like'%a%';


-- Query 17
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
-- % replace with null any no of cahr before a=%;
select *from worker where first_name like '%a';


-- Query 18
-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
-- Now here, we can't place '%' because it can then be replaced with any number of characters - but here all we want are 6 total alphaberts in the output.
-- Since we are sure about the number of alphabets, we'll be using the '_'.
-- Therefore, the h character would be placed at the 6th position in the String like -> '_____ h'
select *from worker where first_name like '_____h';

-- Query 19
-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
-- We'll be using the 'BETWEEN' Keyword.
-- The BETWEEN operator is INCLUSIVE: begin and end values are included. 
select *from worker where salary between 100000 and 500000;

-- Query 20
-- Write an SQL query to print details of the Workers who have joined in Feb’2014.
select *from worker where year(joining_date)=2014 and MONTH(joining_date)=02;

-- Query 21
-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
-- We'll Have to use the 'Aggregate' functions here - they perform calculations on a set of values & return a single value.
select department ,count(department) from worker where department='admin';

-- Query 22
-- Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(first_name,' ',last_name) as full_name from worker where salary between 50000 and 100000;


-- Query 23
-- Write an SQL query to fetch the no. of workers for each department in the descending order.
-- Clearly, Grouping requires to be done here!
select department ,count(worker_id) as cnt from worker group by department order by cnt desc;

-- Query 24
-- Write an SQL query to print details of the Workers who are also Managers.
-- We've the worker details in the 'Workers' table & all the title details in the 'titles' table.
-- We'll apply an inner join on 'Workers' table with 'title' table
-- Since after applying Join, we would get all the column titles from both the tables, if you want to get only one table's columns, you can write it like
-- 'SELECT w.*' FROM ...
select distinct w.*, t.worker_title from worker as w
 inner join 
title as t on w.worker_id=t.worker_ref_id
 where t.worker_title='manager' ;


-- Query 25
-- Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
-- We clearly need the Aggregation Function to Group the same worker tiles together
-- And if we've to put the filtering on the group values being returned, we'll be using the 'Having' Keyword.
select worker_title ,count(*) as tot from title group by worker_title having tot>1 order by tot desc;

-- Query 26 [An IMPORTANT interesting Query]
-- Write an SQL query to show only odd rows from a table.
-- To do this, we'll be using the MOD Keyword 
-- The MOD() function returns the remainder of a number divided by another number.
-- Syntax: MOD(x,y) or (x MOD y) or (x%y)
select *from worker where mod(worker_id,2)!=0;
-- not equal <> this sign work same as not=

-- We did the Mod with 'Worker ID' as it was Auto Incremented, so we'll get the odd ones out easily!
-- Also, there is one more sign that behaves exactly similar to the 'not equal to' sign which is '<>'

-- Query 27
-- Write an SQL query to show only even rows from a table.
select *from worker where mod(worker_id,2)=0;

-- Query 28
-- Write an SQL query to clone a new table from another table.
-- The 'Like' Clause can be used to create the clone of one table from some other.
-- It would completely copy the Schems but not the values!
create table worker_clone like worker;-- it will not insert data 
insert into worker_clone select *from worker;
select *from worker_clone;
-- If you also wish to insert the same data into the clone from the parent table (the one you cloned this table from), you can write the following query

-- Query 29
-- Write an SQL query to fetch INTERSECTING records of two tables.
-- There is no Keyword like Intersect in SQL, & therefore we'lll be using the JOIN Keyword.
select worker.* from worker inner join worker_clone using(worker_id);


-- Query 30
-- Write an SQL query to show records from one table that another table does not have.
-- Here, we'll use the MINUS SET Operation
-- The result Set where the Match doesn't happen for the WORKER_IDs get shown.
select worker.* from worker left join worker_clone on worker.worker_id=worker_clone.worker_id;


-- Query 31
-- Write an SQL query to show the current date and time.
-- For current Date And Time Operation, we are going to use the Dual Table.
-- The DUAL is special one row, one column table present by default in all Oracle databases.
select curdate();
select now();

-- For time, we use the now() function - but it gives the complete date & time [the timestamp]
-- The time returned back are that of the server, it might not necessarily be similar to that of your current Location.


-- Query 32
-- Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- The 'Limit' Keyword restricts the number of values being returned.
select *from worker order by salary desc limit 5;


-- Query 33
-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- There are two ways of doing it:
-- Way 1 [by using the limit keyword And the Offset Keyword]
-- The 'OFFSET' argument is used to identify the starting point to return rows from a result set. Basically, it excludes the first set of records.
-- The 'limit' keyword would be restricting the number of rows that should be given as an output.
-- The value of the OFFSET Keyword is 'n-1', it means that to get the nth highest record, you wish to start printing the values from n-1th row as indexing starts from 0.

-- forth se konsi chahiye 1st
select *from worker order by salary desc limit 4,1;


-- OR it can also be done by this 
-- SELECT DISTINCT(Salary) 
-- FROM Worker
-- ORDER BY Salary DESC
-- LIMIT n-1, 1;

-- Query 34
-- Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select *from worker w1
where 4=(
select count(distinct(w2.salary))
from worker w2
where w2.salary>=w1.salary
);

-- select count(distinct(w2.salary))
-- from worker w2
-- where w2.salary>50000;

-- Query 35
-- Write an SQL query to fetch the list of employees with the same salary.
-- The below query [a default Inner Join] would also do the comparison of the employee with himself/herself but we don't want this.
select *from worker w1,worker w2 where w1.salary =w2.salary and w1.worker_id!=w2.worker_id;


-- Query 36
-- Write an SQL query to show the second highest salary from a table using sub-query.

-- select *from worker order by salary limit 1,1;
select *from worker w1
where 1=(
select count(salary) from worker w2
where w1.salary>=w2.salary
);

select  max(salary)from worker 
where salary not in (select max(salary) from worker);

-- The Above Query can be rewritten as:


-- Query 37
-- Write an SQL query to show one row twice in results from a table. [Not a that useful query but it is useful in clearing the concept about Unions]
-- We know that When we take the 'Union' of two sets, we only get the Distinct values in the resulting set but to get all thos similar values in the resulting set we can use the 'UNION ALL' Clause - this would result in us getting those multiple values

select *from worker 
union all 
select *from worker order by worker_id;

-- Query 38
-- Write an SQL query to list worker_id who does not get bonus.
-- The 'Bonus' table is not storing the data of all the employees, therefore clearly if we know what employees 
-- are there in the bonus table, we'll get their data out;

select worker_id from worker 
where worker_id not in (select worker_ref_id from bonus);


-- Query 39
-- Write an SQL query to fetch the first 50% records from a table.
-- The worker table currently has 8 rows and we also know that the worker_id column is self-Incrementing therefore the actual ans would be where worker_id <= total count of worker ids in the 
select worker_id from worker where worker_id<=(select count(worker_id)/2 from worker);

SELECT *
FROM worker
limit (SELECT COUNT(*) FROM worker) / 2;

SELECT COUNT(*) FROM worker;
-- Query 40
-- Write an SQL query to fetch the departments that have less than 4 people in it.
select department,count(department) as cnt from worker group by department having cnt<4 ;

-- Query 41
-- Write an SQL query to show all departments along with the number of people in there.
select department,count(department) as cnt from worker group by department ;


-- Query 42 [Interesting]
-- Write an SQL query to show the last record from a table.
-- We know that the worker id  is self-Incrementing, therefore we'll find the the max worker_id first and print the data corresponding to it


-- Query 43
-- Write an SQL query to fetch the first row of a table.
-- Similar to the previous query, but here we find the Minimum value of Worker_id


-- Query 44
-- Write an SQL query to fetch the last five records from a table.
-- Again, we use the Auto Incrmenting Property of Worker_id & order them in the descending order & then limit the results

-- But the above query is actually reversing the order in which how the values were present in the table, so we need to correct this well & reverse its output to get the original way how the rows were stored in the Table

-- Query 45
-- Write an SQL query to print the name of employees having the highest salary in each department.


-- Another way of doing it by using Joins


-- Query 46
-- Write an SQL query to fetch three max salaries from a table using co-related subquery.

-- Its Limit Form:


-- Query 47
-- Write an SQL query to fetch three min salaries from a table using co-related subquery

-- For obtaining the 'n' Minimum salaries, we can have a general form for the query like below with just the comparison values changed:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary >= w1.Salary
-- ) ORDER By Salary;

-- Query 48
-- Write an SQL query to fetch nth max salaries from a table.
-- For obtaining the 'n' Maximum salaries, we can have a general form for the query like below:
-- Select Distinct(Salary)
-- From Worker as w1
-- where n>= (
--   SELECT COUNT(DISTINCT(Salary))
--   From Worker as w2
--   where w2.Salary <= w1.Salary
-- ) ORDER By Salary;

-- Query 49
-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT Department, SUM(salary) as depSal
FROM Worker
Group BY Department
ORDER BY depSal DESC;

-- Query 50
-- Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT first_name, salary
FROM Worker Where 
Salary = (
  SELECT Max(Salary)
  FROM Worker
  )
;

-- Query 51
-- Remove the Reversed Number Pair from the given Table
 
 

