create database st;

use st;

CREATE TABLE dept1 (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);

INSERT INTO dept1 (empid, name, role) VALUES 
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

CREATE TABLE dept2 (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    role VARCHAR(50)
);

INSERT INTO dept2 (empid, name, role) VALUES 
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

-- list aout all the employee in the company 
select *from dept1
union 
select *from dept2;

-- list out all the employess in all departments who works as salesman
select *from dept1 where role="salesman"
union
select *from dept2 where role="salesman";

-- list out all the employees who work for both department
select *from dept1 inner join dept2 ;

-- intersect list out all the employees who work for both dept 
select *from dept1 inner join dept2 using(empid);

-- minus 
-- list of employees working in dept1 not in dept2
-- he SQL query you provided will return all rows from dept1 that do not have a matching empid in dept2. This query is useful for finding records that are in dept1 but not in dept2.
select *from dept1 left join dept2 using(empid)
where dept2.empid is null;


-- ZOOO SQL 12Q
-- To find all details of the prize won by Eugene O'Neill, you would need to query the database for records where the winner's name matches "EUGENE O'NEILL." Assuming the database table is called nobel and it contains columns for all the prize details, the SQL query would look like this:

-- sql
-- Copy code
-- SELECT *
-- FROM nobel
-- WHERE winner = 'EUGENE O\'NEILL';
-- This query selects all columns (*) from the nobel table where the winner column matches "EUGENE O'NEILL".

-- Note the escape character (\) used before the apostrophe in the name to handle special characters correctly. If your database system uses a different method for escaping characters or if the table or column names differ, you may need to adjust the query accordingly.



