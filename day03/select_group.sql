--�׷��Լ� sum, max, min, avg, count
select avg(salary), max(salary), min(salary), sum(salary), count(*) from employees;

select count(*) from employees; --�� �� ����
select count(first_name) from employees; --�� null�� �ƴ� �̸��� ����
select count(commission_pct) from employees;
select count(manager_id) from employees;

--select department_id, avg(salary) from employees; --�׷��Լ��� �Ϲ� �÷��� ���ÿ� ����� �� ����
select department_id, avg(salary) from employees group by department_id; --�׷����� ������ �ش� ��Ͽ� ���Ͽ� �����

--select job_id, department_id  from employee group by department_id; --groupby�� �������� Į���� ������ �� ����
select department_id, job_id, avg(salary) from employees group by department_id,job_id; --�߰��ϰ���� Į���� group by�� �߰��������

--group by �� �ɰ���
select department_id from employees GROUP by department_id order by department_id; --12������ ����
select department_id,job_id from employees GROUP by department_id, job_id order by department_id; -- 20���� �þ

--count(*) over() �÷��� �� ���� ���� �ٿ��� ��� ����
select department_id, first_name , job_id, count(*)over() from employees; --�̷��͵� ����.

--Having
select department_id, sum(salary)
from employees
group by department_id
having sum(salary)>=100000;

select job_id,count(*)
from employees
group by job_id
having count(*) >= 30;

-- �μ� ���̵� 50�̻��� �͵��� �׷�ȭ ��Ű��, �׷������ 10000�̻� ȣ��
select department_id, avg(salary)
from employees
where department_id >= 50
group by department_id
having round(avg(salary),2)>=10000;

--���� 1. ��� ���̺��� JOB_ID�� ��� ���� ���ϼ���. ��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
select job_id, count(*) as �����, avg(salary) as �������
from employees 
group by job_id
order by ������� desc;

--���� 2. ��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
select to_char(hire_date,'YY') as �Ի�⵵, count(*) as �����
from employees
group by to_char(hire_date,'YY');

--���� 3. �޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 2000�̻��� �μ��� ���
select department_id,
       round(avg(salary))
from employees
where salary >=1000
group by department_id
having avg(salary)>=2000;

--���� 4. ��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� ������� department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�. ���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
select * from employees where commission_pct is NOT null;
select department_id as �μ�, 
       trunc(avg(salary+salary*commission_pct),2) as ���, 
       sum(salary) as �հ�, 
       count(*) as ��
from employees  
where commission_pct is NOT null 
group by department_id;
