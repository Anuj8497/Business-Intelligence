SELECT 
    first_name, last_name
FROM
    employees; 
    
Select count(*)
from employees ; 

Select dept_no from Departments;    


Select * from employees
where first_name = 'Denis';

Select * from employees
where first_name = 'Elvis';


Select * from employees
where first_name = 'Denis' and (gender = 'm' or gender = 'f');

select * from employees
where gender = 'f' and (first_name = "kellie" or first_name = "aruna");

select * from employees
where first_name in ('cathie' , 'aruna' , 'kellie');

select * from employees
where first_name in ('dennis','elvis');

select * from employees
where first_name not in('john','mark','jacob'); 

select * from employees
where first_name like ('mar%');

select * from employees
where first_name like ('%a%');

select * from employees
where first_name like('mar_');

select * from employees
where first_name not like('mar_');

select * from employees
where first_name like('mark%');

select * from employees
where hire_date like('2000%');

select * from employees
where hire_date like('%2000%');


select * from employees
where first_name like('%jack%');



select * from employees
where first_name not like('jack%');


select * from employees
where emp_no like('1000_');

SELECT * from salaries
WHERE salary BETWEEN 66,000 AND 70,000;

SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT * FROM EMPLOYEES
WHERE EMP_NO 
NOT BETWEEN '10004' AND '10012';

SELECT * FROM DEPARTMENTS
WHERE DEPT_NO BETWEEN 'D003' AND 'D006';


Select * 
from employees
where first_name is Not Null;

SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
select * from 
employees
where first_name != 'mark';    

select * from
employees
where hire_date > '2000-01-01';

select * from employees
where gender = 'F'
and hire_date > '1999-12-31' and hire_date < '2000-12-31';

select * from salaries
where salary > 150000;

SELECT DISTINCT
    gender
FROM
    employees;

SELECT DISTINCT
    hire_date
FROM
    employees;    
    
SELECT 
    COUNT(hire_date)
FROM
    employees;
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;    

select count(emp_no)
from salaries
where salary >= 100000; 

select * from dept_manager;

select count(*)
from dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;


select first_name,count(first_name) AS occurences from employees
group by first_name
order by first_name;

select * 
from salaries;


select salary
from salaries 
where salary > 80000;


select first_name from employees
group by first_name
order by first_name;


Select salary, count(emp_no) as emps_with_same_salary  
from salaries
where salary > 80000
group by emp_no
having emps_with_same_salary > 10;

Select emp_no,avg(salary) as average
from salaries
group by; 

select distinct emp_no, avg(salary) as average
from salaries
group by  salary
having salary > 120000;

select * from salaries;

select * from employees;

#######################################
select distinct emp_no , avg(salary) as average
from salaries
group by emp_no
having average > 120000;
#######################################

SELECT *, AVG(salary)
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;
###########################
SELECT *, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;
###########################
 
select first_name , count(first_name) as number_of_hires 
from employees
where hire_date > '1999-01-01'
group by first_name
having number_of_hires <200
order by first_name DESC;
 
select * from
salaries;

Select emp_no , count(from_date) as number_of_contract_signed 
from salaries 
where from_date > '2000-01-01'
group by emp_no 
having  number_of_contract_signed > 1;

select * 
from salaries
order by emp_no DESC
limit 10;

select *  
from dept_emp
limit 10;

select 
count(salary)
from salaries;

select * 
from dept_emp;

select count(distinct dept_no)
from dept_emp;

select sum(salary) as total_amount_spent 
from salaries
where from_date > '1997-01-01';

select AVG(salary)
from salaries;

select ROUND(AVG(Salary),1)
from salaries;
###############################################
Drop table departments_dup;


CREATE TABLE departments_dup
(
    dept_no CHAR(4) ,
    dept_name VARCHAR(40) 
);

#################################################
INSERT INTO departments_dup (dept_no, dept_name)
VALUES ('1','Public Relations'),
 ('2','Comps'),
 ('3','ETRX'),
 ('4','EXTC');
################################################
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
);

Select * from dept_manager_dup; 

Drop table dept_manager_dup;


INSERT INTO dept_manager_dup 
VALUES (100,'2','2017-01-01','2019-08-04'),
(101,'2', '2017-01-01','2020-12-09'), 
(102,'3','2017-01-01','2021-11-6'),
(103,'3','2017-01-01','2009-10-9');

################################################################

SELECT * FROM departments_dup;

Select * from dept_manager_dup; 

Select * from employees;
################################################################

Select  e.emp_no, e.first_name,e.last_name,e.hire_date, d.dept_no 
from dept_manager_dup d
left join
employees e
on e.emp_no = d.emp_no
group by emp_no;

################################################################
select * from dept_emp;

Select * from employees;

Select * from dept_manager; 




Select e.emp_no, e.first_name, e.last_name, d.dept_no,d.from_date
from employees e
left join 
dept_emp d
on e.emp_no = d.emp_no
where e.last_name = 'Markovitch'
order by d.dept_no DESC,e.emp_no;


SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
FROM employees e
LEFT JOIN
dept_manager dm ON e.emp_no = dm.emp_no
WHERE
e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC, e.emp_no;


###################################################################################
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
###################################################################################

select * from dept_manager;


select * from departments;

Select * 
from dept_manager dm
cross join 
departments d;

Select dm.*,d.*
from dept_manager dm
cross join
departments d
where d.dept_no <> dm.dept_no;


Select e.*,d.*
from departments d 
Cross join 
dept_manager dm
join 
employees e on dm.emp_no= e.emp_no;

Select* from departments;
Select * from dept_manager;

Select d.*,dm.*
from departments d
cross join dept_manager dm
where dm.dept_no = 'd009';


Select * from employees;
Select * from departments
order by dept_no;

Select e.* , d.* from 
employees e 
cross join departments d
where e.emp_no = 10001;

SELECT

    e.*, d.*

FROM

    employees e

        CROSS JOIN

    departments d

WHERE

    e.emp_no < 10011

ORDER BY e.emp_no, d.dept_name;
######################################################################

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no  = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;

select * from salaries;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;

Select count(distinct emp_no) as count 
from employees
group by gender;

SELECT e.gender, COUNT(dm.emp_no)
FROM employees e
JOIN
dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;


select d.dept_name , avg(salary) as average
from departments d  
join dept_emp de
on d.dept_no = de.dept_no
join dept_manager dm
on de.emp_no = dm.emp_no
join salaries 
on dm.emp_no = salaries.emp_no
group by d.dept_name
order by average; 

/*
Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.
*/

select * from dept_manager;
select * from employees;

Select * 
from employees
where hire_date in ('1990-01-01', '1995-01-01') 
AND
employees.emp_no in 
( select  employees.emp_no 
from employees
join titles
on 
employees.emp_no = titles.emp_no
where titles.title = "Manager"
);

Select * 
from employees
where 
employees.emp_no in
( select  employees.emp_no 
from employees
join titles
on 
employees.emp_no = titles.emp_no
where titles.title = "Manager"
)
AND employees.hire_date between '1990-01-01' AND '1995-01-01';

SELECT *
FROM
    dept_manager
WHERE
    emp_no IN 
    (SELECT emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');



Select * from titles;

Select * from employees;







select  employees.emp_no 
from employees
join titles
on 
employees.emp_no = titles.emp_no
where titles.title = "Manager";

Select * 
from employees
where hire_date in ('1990-01-01' , '1995-01-01');

Select emp_no from titles
where title = 'Manager';
##############################################################3

create table sailors(
sid int ,
sname varchar(4),
rating int,
age int
);

insert into sailors values(1,'A',5 , 25); 
insert into sailors values(2,'B',5 , 21); 
insert into sailors values(3,'C',5 , 20); 
insert into sailors values(4,'D',4 , 19); 
insert into sailors values(5,'E',4 , 18); 
insert into sailors values(6,'F',4 , 17); 
insert into sailors values(7,'G',3 , 16); 
insert into sailors values(8,'H',3 , 15); 
insert into sailors values(9,'I',3 , 14); 

drop table sailors;

Select * from sailors;




select * from sailors;


select sid,sname,rating,age
from (
select * from sailors
group by rating,age
order by age) as s

;










select * from sailors
group by rating,age
order by age;

SELECT a.sid, a.sname, a.rating,a.age
 FROM sailors AS a 
 WHERE 
(SELECT COUNT(*) FROM sailors AS b 
 WHERE b.rating = a.rating AND b.age >= a.age) >= 2 
 group by a.rating,a.age
 ORDER BY a.age ASC; 

#############################################################
SELECT a.* FROM sailors AS a
  LEFT JOIN sailors AS a2 
    ON a.rating = a2.rating AND a.age >= a2.age
GROUP BY a.sname
HAVING COUNT(*) <= 2
ORDER BY a.sname, a.age ASC;

select * from sailors;


#############################################################

select * from employees
where exists(
select emp_no from titles
where title = "Assistant Engineer"
and employees.emp_no = titles.emp_no); 

##############################################################

Select * from dept_manager;
select * from employees;

Select 
emp_no 
from dept_manager
where emp_no = 110022;

# employee id , dept_code , manager_id


select * from employees;
select * from dept_emp;

Select A.* from
(Select 
e.emp_no as employee_ID,
MIN(de.dept_no) as Department_code,
(Select
       emp_no
       from 
       dept_manager
       where 
       emp_no = 110022) AS manager_id
from employees e
join dept_emp de 
on e.emp_no = de.emp_no
and e.emp_no <=10020
group by e.emp_no) AS A 

UNION

Select B.* from
(Select 
e.emp_no as employee_ID,
MIN(de.dept_no) as Department_code,
(Select
       emp_no
       from 
       dept_manager
       where 
       emp_no = 110039) AS manager_id
from employees e
join dept_emp de 
on e.emp_no = de.emp_no
and e.emp_no between 10021 AND 10040
group by e.emp_no) AS B ; 

##############################################

CREATE TABLE emp_manager (

   emp_no INT(11) NOT NULL,

   dept_no CHAR(4) NULL,

   manager_no INT(11) NOT NULL

);

################################################
Select * from emp_manager;

select * from employees;

Select * from dept_emp;

Select * from dept_manager;

################################################
Select A.*
from
(Select e.emp_no as emp_no, min(de.dept_no) as dept_no,
 (Select emp_no 
 from
 dept_manager
 where emp_no = 110022
 ) as manager_no
 from employees e
 join 
 dept_emp de 
 on
 e.emp_no = de.emp_no
 group by e.emp_no
 having e.emp_no <= 10020) as A
UNION
Select B.*
from
(Select e.emp_no as emp_no, min(de.dept_no) as dept_no,
 (Select emp_no 
 from
 dept_manager
 where emp_no = 110039
 ) as manager_no
 from employees e
 join 
 dept_emp de 
 on
 e.emp_no = de.emp_no
 group by e.emp_no
 having e.emp_no between  10021 AND 10040) as B
UNION
Select C.*
from(  
Select emp_no as emp_no , dept_no,
 ( Select e.emp_no
   from 
   dept_manager e
   where from_date = '1985-01-01' AND dept_no = 'd001'
 ) as manager_no 
from 
dept_manager
where dept_no = 'd001' AND from_date = '1991-10-01') AS C
UNION
Select D.*
from(  
Select emp_no as emp_no , dept_no,
 ( Select e.emp_no
   from 
   dept_manager e
   where from_date = '1991-10-01' AND dept_no = 'd001'
 ) as manager_no 
from 
dept_manager
where dept_no = 'd001' AND from_date = '1985-01-01') AS D ;

select * from dept_manager;

####################################################################################################



# Non parametrized procedure that returns first 1000 rows of the employees table.

Delimiter $$
Create procedure first()
Begin
  Select * 
  from 
  employees
  LIMIT 1000;
 END $$
 Delimiter ;

Call employees.first();

SELECT * FROM SALARIES;

DELIMITER $$
CREATE PROCEDURE AVERAGE()
BEGIN
SELECT EMP_NO , AVG(SALARY)
FROM SALARIES
GROUP BY EMP_NO;
END $$
DELIMITER ;

CALL AVERAGE();

####################################################### 
Select * from employees;
Select * from salaries;

DROP procedure emp_salary;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT
e.first_name, e.last_name,s.salary,s.from_date,s.to_date
from employees e 
join salaries s 
on e.emp_no = s.emp_no
WHERE e.emp_no = p_emp_no;
END $$
DELIMITER ;

CALL employees.emp_salary(10001);

DROP PROCEDURE AVG_SALARY;

DELIMITER $$
USE EMPLOYEES $$
CREATE PROCEDURE AVG_SALARY(IN P_EMP_NO INTEGER , OUT P_AVG_SALARY DECIMAL(10,2))
BEGIN 
SELECT 
  AVG(SALARY)
INTO P_AVG_SALARY
FROM SALARIES AS S
JOIN employees AS E
ON S.EMP_NO = E.EMP_NO
WHERE E.EMP_NO = P_EMP_NO;
END $$
DELIMITER ;

CALL EMPLOYEES.AVG_SALARY(10001,@P_AVG_SALARY);
SELECT @P_AVG_SALARY;


SELECT EMP_NO FROM EMPLOYEES
WHERE FIRST_NAME = 'GEORGI' AND LAST_NAME = 'FACELLO';

SELECT * FROM EMPLOYEES;



DROP PROCEDURE EMP_INFO;

DELIMITER $$
USE EMPLOYEES $$
CREATE PROCEDURE EMP_INFO(IN F_NAME CHAR(50), IN L_NAME CHAR(50), OUT E_NUMBER LONG)
BEGIN
SELECT DISTINCT EMP_NO
INTO E_NUMBER
FROM EMPLOYEES
WHERE FIRST_NAME = F_NAME AND LAST_NAME = L_NAME
LIMIT 1;
END $$
DELIMITER ;



CALL EMPLOYEES.EMP_INFO('GEORGI','FACELLO',@E_NUMBER);
SELECT @E_NUMBER;

#############################################################

DELIMITER $$
CREATE FUNCTION femp_avg_salary(p_emp_no INTEGER) returns decimal(10,2)
reads sql data   # can also write nosql, deterministic
begin 

declare v_avg_salary decimal(10,2);

Select 
 avg(s.salary)
into v_avg_salary from
 employees e
join
salaries s ON e.emp_no = s.emp_no
where e.emp_no = p_emp_no;

return v_avg_salary;
end $$
delimiter ;

select femp_avg_salary(10003);

######################################################################################
select * from employee;
select * from salaries;
#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

DELIMITER $$
CREATE FUNCTION emp_info(p_fname varchar(50), p_lname varchar(50)) returns decimal(10,2)
reads sql data   
begin 
declare v_salary decimal(10,2);
Select s.salary
into v_salary from
 salaries s
join
employees e ON s.emp_no = e.emp_no
where e.first_name = p_fname and e.last_name = p_lname
AND
from_date = 
 (select max(from_date) 
 from salaries s
 where s1.emp_no = s.emp_no)
AND to_date =
 (select max(to_date)
  from salaries s2
  where s2.emp_no = s.emp_no)
  group by e.emp_no;
return v_salary;
end $$
delimiter ;

select EMP_INFO('Aruna','Journel');


SELECT * FROM EMPLOYEES;

#############################################################
select s.salary, s.from_date,s.to_date,e.emp_no
from salaries s 
join employees e 
on e.emp_no = s.emp_no 
where from_date = 
(select max(from_date) 
 from salaries s1
 where s1.emp_no = s.emp_no)
 AND to_date =
 (select max(to_date)
  from salaries s2
  where s2.emp_no = s.emp_no)
  AND e.first_name = "Aruna" AND e.last_name = "Journel";

Select * from employees
where emp_no = 10002;




Select e.emp_no , s.salary
from employees e 
join salaries s 
on e.emp_no = s.emp_no
where e.first_name = 'Aruna' and e.last_name = 'Journel'; 

select * from employees
where emp_no = 55649;

###############################################  
  
select s.salary, s.from_date,s.to_date,s.emp_no
from salaries s 
where from_date = 
(select max(from_date) 
 from salaries s1
 where s1.emp_no = s.emp_no)
 AND to_date =
 (select max(to_date)
  from salaries s2
  where s2.emp_no = s.emp_no)
  group by s.emp_no;
  
########################################

Select 
 emp_no, 
 first_name, 
 last_name,
 CASE 
   when gender = 'M' then 'Male'
   ELSE 'Female'
  END AS gender
FROM 
employees;  
  
SELECT emp_no, first_name,last_name,
CASE
    WHEN gender = 'M' THEN 'Male'
    ELSE 'Female'
END AS gender
FROM employees; 


SELECT e.emp_no, e.first_name, e.last_name,
CASE dm.emp_no
    when NOT NULL THEN 'Manager'
    else 'Employee'
END as is_manager
from employees e 
left join dept_manager dm
on e.emp_no = dm.emp_no;

## the above query does not return correct result as NOT NULL is incorrect we have is null and is not null.

Select e.emp_no, e.first_name,e.last_name,
 CASE 
    when dm.emp_no IS NOT NULL THEN 'Manager'
    else 'Employee'
 END as is_manager
from employees e 
left join dept_manager dm
on e.emp_no = dm.emp_no;


## if() in sql

SELECT
   emp_no,
   first_name,   last_name,
   IF(gender ='M' , 'Male' , 'Female') AS gender
from 
   employees;   
   
select * from dept_manager;   
   
##############################################################

Select e.emp_no, e.first_name,e.last_name,
case
   when e.emp_no = dept_manager.emp_no then 'Manager'
   else 'Employee'
 End as is_employee_a_manager 
from employees e
join dept_manager on e.emp_no = dept_manager.emp_no
where e.emp_no > 109990; 

### the above line of code will only return managers.

SELECT e.emp_no, e.first_name, e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
Select e.emp_no, e.first_name, e.last_name, MAX(s.salary) - MIN(s.salary),
  case
     when MAX(s.salary) - MIN(s.salary) > 30000 then 'salary raise was greater than 30000'
     else 'salary raise was not greater than 30000'
  END as raise
from 
  employees e 
   join 
  salaries 
  on 
  e.emp_no = s.emp_no 
  group by e.emp_no;
  

  
select e.emp_no, e.first_name, e.last_name, MAX(s.salary) - MIN(s.salary)
from employees e 
join salaries s 
on e.emp_no = s.emp_no
group by e.emp_no;

select * from employees; 

select e.emp_no, e.first_name, e.last_name, (s.salary)
from employees e 
join salaries s 
on e.emp_no = s.emp_no
where first_name = 'Georgi' and last_name = 'Facello';

Select * from employees;
Select * from dept_emp;

Select e.emp_no,e.first_name,e.last_name,
 case
   when de.to_date > CURDATE() then 'is employed'
   else 'not employed'
 END AS is_employed  
from employees e 
join dept_emp de
on e.emp_no = de.emp_no
group by e.emp_no
LIMIT 100;   

SELECT

    e.emp_no,

    e.first_name,

    e.last_name,

    CASE

        WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'

        ELSE 'Not an employee anymore'

    END AS current_employee

FROM

    employees e

        JOIN

    dept_emp de ON de.emp_no = e.emp_no

GROUP BY de.emp_no

LIMIT 100;

