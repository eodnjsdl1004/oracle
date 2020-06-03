--�������� �����
--()�ȿ� �����, ���������� �������� 1�� ���Ͽ����մϴ�. �������� ���� �ؼ�

--nancy ���� ���� �޿��� ���ã��
select salary from employees where first_name = 'Nancy';
select * 
from employees
where salary >= 
                (select salary 
                 from employees 
                 where first_name = 'Nancy');
                 
--job ���̵� 103�� ���
select job_id from employees where employee_id=103;
--job ���̵� 103�� ����� ���� �� ������ �����
select first_name, 
       job_id, 
       hire_date
from employees
where job_id = (select job_id from employees where employee_id=103);

--�������� ��� in any all�� Ű���带 ����Ͽ� ���������� Ȱ���Ѵ�.
select job_id from employees where job_id = 'IT_PROG';

--���� ����
select *
from employees
where job_id = (select job_id 
                from employees 
                where job_id = 'IT_PROG');
--���������� �������� ��������� �Ϲ����� �� �����ڸ� ó���� �� �����ϴ�.
                
--3���� ���� �ϳ��� ��ġ�ϸ� ���
select salary from employees where first_name = 'David';
select * 
from employees
where salary in (select salary 
                 from employees 
                 where first_name = 'David');

-- 3���߿��� �ּڰ� ���� ũ�ٸ�
select * 
from employees
where salary > any (select salary 
                    from employees 
                    where first_name = 'David');

-- 3���߿��� �ִ밪 ���� �۴ٸ�
select * 
from employees
where salary < some (select salary 
                    from employees 
                    where first_name = 'David');
--all�� 3���߿��� �ִ밪���� ũ�ų�, �ּڰ� ���� �۰ų�
select * 
from employees
where salary > all (select salary 
                    from employees 
                    where first_name = 'David');

select job_id from employees where department_id = 90;
select *
from employees
where job_id in (select job_id 
                from employees 
                where department_id = 90);
                
--��Į�� ����
select * from employees;
select * from departments;
 --left outer join�� ���� �������
select 
       e.first_name,
       d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id;
--��������� �� �����. ���������� �������� �� ���� ����
select first_name,
       (select department_name 
        from departments d
        where d.department_id = e.department_id)department_name,
       (select department_id 
        from departments d
        where d.department_id = e.department_id) department_id
from employees e;
---------------------------------------------------------------------
select * from employees;
select * from jobs;

select 
       e.employee_id,
       e.job_id,
       j.job_title
from employees e
left outer join jobs j
on e.job_id = j.job_id;
                
select 
       e.employee_id,
       e.job_id,
       (select j.job_title 
       from jobs j
       where e.job_id = j.job_id) job_title
from employees e;

--�ζ��� �� from������ ���������� ���� ��
-- Ư���˰������� ��ȸ�ϸ鼭 rownum�� �پ����, order by�� �������� �����ϱ� ����
select rownum, first_name, salary from employees order by salary desc;
--�׷��� �����س��� ���̺��� from�� ���������� �ְ� ����ϸ� ��.
select rownum, 
       first_name, 
       salary 
from (select first_name,
             salary 
from employees 
order by salary desc);
--where rownum>11 and rownum<=20; �߰����� ������ ��������.
--�׷��� �ѹ��� select�� �ѹ��� ���μ� 2��° �������� ���� rownum�� alias�� �ٿ� �װ��� �ٱ��� where���� �������� ����ϸ� ��
--�ٱ��� �������� alias[.]�� ������ �ʴ´�.
select rownum, 
       rn,
       first_name,
       salary       
from (
select rownum rn, 
       first_name, 
       salary 
from (select first_name,
             salary 
from employees 
order by salary desc))
where rn>10 and rn<20;

-- join�� ������ �κп��� ���������� ���� �ִ�.
select *
from employees e
join (select
             department_id,
             department_name
      from departments) d
on d.department_id = e.department_id;
