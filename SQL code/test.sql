select * from t_employees;


select * from t_salaries;
select count(*)
from t_employees;

select * from t_dept_emp;

#########################################################

# Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
# calender year, gender , number of years

Select * from t_employees;

Select * from t_dept_manager;
###############################################################################################
Select year(de.from_date) as calender_year, e.gender , count(e.emp_no) as num_of_employees
from t_employees as e
join  t_dept_emp as de
on e.emp_no = de.emp_no
group by e.gender , calender_year
having calender_year >= 1990
order by calender_year;
###############################################################################################
Select year(de.from_date)
from t_dept_emp as de
where year(de.from_date) > 1990;
#########################################################


# dept_name, gender, emp_no,from_date, to_date, calender_year, active

# Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.

Select de.dept_name , ee.gender , ee.emp_no , tde.from_date, tde.to_date , ee.calender_year,
   CASE 
   when 
   year(tde.to_date) >= ee.calender_year AND year(tde.from_date) <= ee.calender_year then 1
   else 0 
   END as Active
from
   (Select Distinct year(hire_date) as calender_year
    from t_employees ee
    group by calender_year
    ) as e CROSS JOIN 
    t_dept_manager
join t_dept_emp tde
on ee.emp_no =  tde.emp_no
join t_departments de
on tde.dept_no = de.dept_no
order by calender_year;


Select de.dept_name, e.gender, dm.emp_no , dm.from_date,dm.to_date, e.calender_year,
  CASE year(.to_date) >= e.calender_year AND year(e.from_date) <=e.calender_year
  THEN 1
  Else 0 END AS active
From
(Select Distinct year(hire_date) as calender_year
  from t_employees 
)e
 CROSS JOIN 
 t_dept_manager dm
 JOIN t_departments de
 ON de.dept_no = dm.dept_no
 JOIN t_dept_emp tde
 ON tde.emp_no = e.emp_np
 ORDER by e.calender_year;
  

SELECT 

    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        Distinct YEAR(hire_date) AS calendar_year
    FROM
        t_employees 
    ) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
       JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;

Select * from t_salaries;

Select * from t_employees;

select * from t_dept_emp;

select * from t_departments;

Select e.gender, ROUND(AVG(s.salary), 2), d.dept_name,year(s.from_date) as calender_year
from 
t_employees e
cross join 
t_departments d 
join t_salaries s 
on e.emp_no = s.emp_no
JOIN t_dept_emp de 
ON de.emp_no = e.emp_no
group by d.dept_name, e.gender, calender_year
having calender_year <= 2002
order by d.dept_name;
######################################################################
Select e.gender, avg(s.salary), d.dept_name,year(s.from_date) as calender_year
from 
t_employees e
cross join 
t_departments d 
join 
t_salaries s
on s.emp_no = e.emp_no
group by e.gender, d.dept_name;

######################################################################
SELECT 
    e.gender,
    d.dept_name,
    ROUND(AVG(s.salary), 2) AS salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no , e.gender , calendar_year
HAVING calendar_year <= 2002
ORDER BY d.dept_no;

#################################################################

# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department 
# within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure.

drop procedure emp_salary;

DELIMITER $$
USE employees_mod $$
CREATE PROCEDURE emp_salary(IN p_l_range float , IN p_u_range float)
BEGIN
DECLARE low_limit float;
DECLARE high_limit float;
set low_limit = p_l_range;
set high_limit = p_u_range;
SELECT d.dept_name, avg(s.salary) as salary, e.gender 
from t_departments d
join t_dept_emp de 
on d.dept_no = de.dept_no
join t_salaries s
on de.emp_no = s.emp_no
join t_employees e
on s.emp_no = e.emp_no
where salary between low_limit and high_limit
group by e.gender, d.dept_name;
END $$
DELIMITER ; 
##################################################################

			