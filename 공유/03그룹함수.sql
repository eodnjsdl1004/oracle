--�׷��Լ� AVG, MAX, MIN, SUM, COUNT
select avg(salary), max(salary), min(salary), sum(salary), count(*) from employees;

select count(*) from employees; --�� �� �������� ��
select count(first_name) from employees; --null�� �ƴ� ���� ��
select count(commission_pct) from employees; --null�� �ƴ� ���� ��
select count(manager_id) from employees; -- null�� �ƴ� ���� ��

-- �μ����� �׷�ȭ, �׷��Լ��� ���
select department_id, avg(salary) from employees group by department_id; 
--�׷��Լ��� �Ϲ� �÷��� ���ÿ� ����� �� �����ϴ�.
select department_id, avg(salary) from employees; 
--group by���� ����� �� group���� ������ ������ �ٸ� �÷��� ��ȸ�� �� �����ϴ�
select job_id, department_id from employees group by department_id; 


--group by�� 2�� �̻� ���
select department_id from employees group by department_id order by department_id;
select department_id, job_id from employees group by department_id, job_id order by department_id;

--count(*) over() �������� ���������� �÷���, �� ���� ���� �ٿ��� Ȯ���� �����մϴ�.
select department_id, first_name, last_name, count(*) over() from employees;

--group by ���� ���� having��
select department_id, sum(salary) 
from employees
group by department_id
having sum(salary) > 100000;

select job_id, count(*)
from employees
group by job_id
having count(*) >= 20;

--�μ����̵� 50�̻��� �͵��� �׷�ȭ ��Ű��, �׷������ 5000�̻� ��ȸ
select department_id, avg(salary) as ���
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000;

----------------------------------------------------------------------------------
select * from employees;
--����1
select job_id, count(*) as total
from employees
group by job_id;

select job_id, avg(salary) as �޿����
from employees
group by job_id
order by �޿����;

--����2
select 
    to_char(hire_date, 'YY') as �Ի�⵵,
    count(*) as �����
from employees
group by to_char(hire_date, 'YY');

--�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���
select 
    department_id, 
    trunc(avg(salary))
from employees
where salary >= 1000
group by department_id
having trunc(avg(salary)) >= 2000;
/*����4
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� ������� department_id(�μ���) salary(����)�� 
���, �հ�, count�� ���մϴ�
*/

select 
    department_id,
    trunc(avg( salary + salary * commission_pct  ), 2) as �޿����,
    sum(salary + salary * commission_pct) as �޿��հ�,
    count(*) as �����
from employees
where commission_pct is not null
group by department_id;





















