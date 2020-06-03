--연습문제 1
select * from employees e JOIN departments d ON e.department_id = d.department_id;
select * from employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id;
select * from employees e RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

--연습문제 2
select 
    concat(last_name, first_name),
    d.department_id
from employees e
JOIN departments d ON e.department_id = d.department_id;

--연습문제 3
select * from jobs;
select * from employees;

select 
    concat(last_name, ' ' || first_name) as name,
    e.job_id,
    job_title
from employees e
JOIN jobs j ON e.job_id = j.job_id
order by name asc;

--문제 4
select * from jobs;
select * from job_history;

select *
from jobs j1
LEFT OUTER JOIN job_history j2 ON j1.job_id = j2.job_id;

--문제 5
select 
    first_name,
    last_name,
    department_name
from employees e
JOIN departments d ON e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

--문제 6
select * from employees CROSS JOIN departments;

--문제 7
select 
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    d.location_id --부서아이디
from employees e
JOIN departments d
ON e.department_id = d.department_id
where job_id = 'SA_MAN';

--문제8
select 
    employee_id,
    first_name,
    last_name,
    job_title
from employees e
JOIN jobs j ON e.job_id = j.job_id
where job_title in ('Stock_Manager', 'Stock Clerk');

--문제9
select 
    d.department_id,
    d.department_name,
    e.employee_id
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
where employee_id is null;

--문제 10
select * from employees;

select 
    e1.employee_id as 사원번호,
    e1.first_name as 이름,
    e1.manager_id as 매니저번호,
    e2.first_name as 매니저이름
from employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id;

--문제 11
select 
    e1.employee_id as 사원번호,
    e1.first_name as 사원이름,
    e1.salary as 급여,
    e1.manager_id as 매니저아이디,
    e2.first_name as 매니저이름,
    e2.salary as 매니저급여
from employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id
where e1.manager_id is not null
order by e1.salary desc;









    
