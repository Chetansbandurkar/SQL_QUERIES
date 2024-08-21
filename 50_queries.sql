
 CREATE DATABASE ORGANIZATION;

 USE ORGANIZATION;
CREATE TABLE Worker 
( 
  Worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,  
  First_Name CHAR(25),
  Last_Name CHAR(25),
  Salary INT(15),
  Joining_Date DATETIME,
  Department CHAR(25)
);  
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

-- single column retrieve
SELECT Salary FROM worker;

-- multiple column retrieve by comma separated (not case sensitive_
select first_name,Salary from worker;

-- Q.can we use select  without from ->YES ex.(DRL)
select 44+11;
select now();

-- Q.WHERE condition
select *from Worker ;
select *from worker where salary>80000;
   -- string hr in SINGLE COATED
select *from worker where department='hr';

-- Q.BETWEEN  (INCLUSIVE)
select *from worker where salary between 80000 and 300000;

-- Q.  (OR) reduce or statement
-- HR,ADMIN
select *from worker where department='HR' OR department ='Admin';
-- agar apne ko aur dept add karne rahe to add krte jana padega 

-- BETTER WAY ->TO USE (IN) query
select *from worker where department IN('HR','ADMIN','ACCOUNT');

-- Q. NOT 
select *from worker where department NOT IN('HR','ADMIN');

-- Q is NULL
 select *from worker where department is null;
 
 -- Q.WILDCARD pattern searching include in '%vi%';
 select * from worker where first_name like '%vi%';
 -- pattern search means vi present in any position 
 -- for single character at specific positon we USE _i
 select *from worker where first_name like '_i%';
 
 -- Q Sorting 
 select *from worker order by salary;
select *from worker order by salary asc;
select *from worker order by salary desc;

-- Q. DISTINCT KEYWORD
select  DISTINCT department from worker;

 -- coalesce(val,0->default value-- 
Q DATA GROUPING GROUPBY
-- find no of employee working in diff dept  hr,admin, acoount
-- without aggregate functions it will works as distinct 
 select department from worker group by department ;
 select department ,count(department) from worker group by department;
 
 -- find AVG salary per department
 select department, avg(salary) from worker group by department;
 
 -- find min salry in each dept 
select department, MIN(salary) from worker group by department;

-- MAX salary in eac dept
select department, MAX(salary) from worker group by department;

-- SUM of each dept salary
select department ,SUM(salary) from worker group by department;

-- Q. GROUP BY HAVING
select  department ,count(department) from worker group by department having count(department)>2;

 
 