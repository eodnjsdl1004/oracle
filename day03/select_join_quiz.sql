--���� 1. -EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-- -EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ� ���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)

select count(*)
from employees e 
join departments d 
on e.department_id = d.department_id;

select count(*)
from employees e 
left outer join departments d 
on e.department_id = d.department_id;

select count(*) 
from employees e 
right outer join departments d 
on e.department_id = d.department_id;

select count(*) 
from employees e 
full outer join departments d 
on e.department_id = d.department_id;

--���� 2. -EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
--����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ��� ����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

select concat(concat(e.first_name, ' '),e.last_name) as �̸�, d.department_id
from employees e
join departments d
on e.department_id = d.department_id
where employee_id = 200;


--���� 3. -EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
--����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ���� HINT) � �÷����� ���� ����� �ִ��� Ȯ��

select concat(concat(e.first_name, ' '),e.last_name) as �̸�, 
       j.job_id, 
       j.job_title
from employees e 
join jobs j
on e.job_id = j.job_id
order by �̸�;


--���� 4. JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.
select * from jobs;
select * from job_history;
select *
from jobs j
left outer join job_history jh
on j.job_id = jh.job_id;


--���� 5. --Steven King�� �μ����� ����ϼ���.

select concat(concat(e.first_name, ' '),e.last_name) as �̸�, 
       d.department_name as �μ���
from employees e
left outer join departments d
on e.department_id = d.department_id
 where concat(concat(e.first_name, ' '),e.last_name)='Steven King';


--���� 6. --EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���

select count(*) from employees;
select count(*) from departments;

select count(*)
from employees e
cross join departments d;

--���� 7. --EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)

select e.employee_id as �����ȣ,
       concat(concat(e.first_name, ' '), e.last_name) as �̸�, 
       e.salary as �޿�,
       d.department_name as �μ���, 
       l.city as �ٹ���
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id;

--���� 8. -- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������ ����ϼ���.

select concat(concat(e.first_name, ' '), e.last_name) as �̸�,
       j.job_title as ����
from jobs j
join employees e
on j.job_id = e.job_id
where j.job_title='Stock Manager' or j.job_title='Stock Clerk';

--���� 9. -- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���

select d.department_name      
from departments d
left outer join employees e
on d.department_id = e.department_id
where e.employee_id is null;


--���� 10. -join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ��� ��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.

select concat(concat(a.first_name, ' '), a.last_name) as �̸�, 
       concat(concat(b.first_name, ' '), b.last_name) as �Ŵ����̸�      
from employees a
left outer join  employees b
on a.manager_id = b.employee_id;

-- ���� 11. --6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ��� 
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���

select concat(concat(a.first_name, ' '), a.last_name) as �̸�, 
       a.salary as �޿�,
       concat(concat(b.first_name, ' '), b.last_name) as �Ŵ����̸�,
       b.salary as �Ŵ����޿�
from employees a
left outer join  employees b --�̳� join�̸� where������ �ʿ����
on a.manager_id = b.employee_id
where a.manager_id is not null
order by b.salary desc;
