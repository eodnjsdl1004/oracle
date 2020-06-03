--�������� 1
select * from employees e JOIN departments d ON e.department_id = d.department_id;
select * from employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id;
select * from employees e RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

--�������� 2
select 
    concat(last_name, first_name),
    d.department_id
from employees e
JOIN departments d ON e.department_id = d.department_id;

--�������� 3
select * from jobs;
select * from employees;

select 
    concat(last_name, ' ' || first_name) as name,
    e.job_id,
    job_title
from employees e
JOIN jobs j ON e.job_id = j.job_id
order by name asc;

--���� 4
select * from jobs;
select * from job_history;

select *
from jobs j1
LEFT OUTER JOIN job_history j2 ON j1.job_id = j2.job_id;

--���� 5
select 
    first_name,
    last_name,
    department_name
from employees e
JOIN departments d ON e.department_id = d.department_id
where first_name = 'Steven' and last_name = 'King';

--���� 6
select * from employees CROSS JOIN departments;

--���� 7
select 
    e.employee_id,
    e.first_name,
    e.salary,
    d.department_name,
    d.location_id --�μ����̵�
from employees e
JOIN departments d
ON e.department_id = d.department_id
where job_id = 'SA_MAN';

--����8
select 
    employee_id,
    first_name,
    last_name,
    job_title
from employees e
JOIN jobs j ON e.job_id = j.job_id
where job_title in ('Stock_Manager', 'Stock Clerk');

--����9
select 
    d.department_id,
    d.department_name,
    e.employee_id
from departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
where employee_id is null;

--���� 10
select * from employees;

select 
    e1.employee_id as �����ȣ,
    e1.first_name as �̸�,
    e1.manager_id as �Ŵ�����ȣ,
    e2.first_name as �Ŵ����̸�
from employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id;

--���� 11
select 
    e1.employee_id as �����ȣ,
    e1.first_name as ����̸�,
    e1.salary as �޿�,
    e1.manager_id as �Ŵ������̵�,
    e2.first_name as �Ŵ����̸�,
    e2.salary as �Ŵ����޿�
from employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id
where e1.manager_id is not null
order by e1.salary desc;









    
