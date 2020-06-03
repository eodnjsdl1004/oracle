--��������
--�������� ����� ( )�ȿ� �����. ������������ �������� 1�� ���Ͽ��� �մϴ�.
--������������ ���� �ؼ��ϸ� �˴ϴ�.
select salary from employees where first_name = 'Nancy';

select *
from employees
where salary >= (select salary 
                 from employees 
                 where first_name = 'Nancy');
                 

--�����ȣ�� 103���� ����� ������ ������ ����� ã�� ��������
select job_id from employees where employee_id = 103;

select *
from employees
where job_id = (select job_id 
                from employees 
                where employee_id = 103);

--���������� �������� ��������� �Ϲ����� �� �����ڷ� ó���� �� �����ϴ�.
select job_id from employees where department_id = 90;
select *
from employees
where job_id = (select job_id 
                from employees 
                where department_id = 90);
                
 --������ �������� (�������� ��� ���� ������ ���� ��, in, any, all               
select *
from employees
where job_id in (select job_id
                from employees
                where department_id = 90);
              
-- David�� 3��(���� ������) ���� �޿��� ū ����� ��ȸ                
select salary from employees where first_name = 'David';                

select *
from employees
where salary > any (select salary from employees where first_name = 'David');

-- David�� 3��(���� ū��) ���� �޿��� ū ����� ��ȸ
select *
from employees
where salary > all (select salary from employees where first_name = 'David');
 
    
--��Į�󼭺�����(select ������ ���������� ���°�, LEFT OUTER JOIN�̶� �������)
select * from employees;
select * from departments;

select 
    first_name,
    department_name
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

select 
    first_name,
    (select department_name from departments d where d.department_id = e.department_id ) as department_name
from employees e;


select * from employees;
select * from jobs;
------------------------------------------------------------
select 
    employee_id,
    e.job_id,
    job_title
from employees e
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id
order by employee_id ;

select
    employee_id,
    e.job_id,
    (select job_title from jobs j where j.job_id = e.job_id) as job_title
from employees e
order by employee_id ;

--�ζ��� ��(from������ ���������� ���� ��)

--select rownum ,first_name, salary from employees order by salary;
select 
    rownum,
    first_name,
    salary
from (select first_name, salary
      from employees
      order by salary
      )
where rownum > 0 and rownum <= 10;
--rownum�� ������ 1���� ���۵Ǿ� �־�� �մϴ�.
select 
    rownum,
    first_name,
    salary
from (select first_name, salary
      from employees
      order by salary)
where rownum > 10 and rownum <= 20;

---------------3�� ����(����¡ ����)

select *
from (select rownum rn,
             employee_id,
             first_name,
             last_name,
             email
      from(select *
           from employees
           order by salary
           )
     )
where rn > 10 and rn <= 20;

----------------------------------------------------
select *
from(
    select 
        rownum rn,
        employee_id,
        first_name,
        last_name,
        department_name
    from(
        select
            employee_id,
            first_name,
            last_name,
            department_name
        from employees e
        JOIN departments d
        ON e.department_id = d.department_id
        order by employee_id asc)
    )
where rn > 20 and rn <= 30;

-----------------------------------------------------------
select *
from employees e
JOIN (select 
        department_id,
        department_name
      from departments) d
ON d.department_id =e.department_id;     












    
    
    
    
                 
                 