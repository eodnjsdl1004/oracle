--������ ��� �˻��� �ϰ�����
select * from employees;
--where ���Ǽ����Ͽ� �˻��ϱ�
select  first_name, last_name, email, job_id from employees where job_id ='IT_PROG';
select * from employees where last_name = 'King'; 

select * from employees where hire_date = '04/01/30';--��¥ 
select * from employees where salary >= 15000;
select * from employees where department_id = 90;

SELECT * FROM employees where salary between 15000 and 30000;
SELECT * FROM employees where salary >=15000 and salary <=30000;
SELECT * FROM employees where hire_date between '03/01/01' and '03/12/31';

select * from employees where department_id in(30,60,90);
select * from employees where manager_id in(101,102,103,104,105);
select * from employees where  job_id in('IT_PROG','AC_MGR');

--like(%�� ���, _�� �ѱ��� ��Ÿ�� ��)
select first_name || ' ' || last_name as �̸�, hire_date as �Ի��� from employees where hire_date like '03%';--03��
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%15'; -- 15�� 
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%05%'; -- 05 ����
select first_name || ' ' || last_name, hire_date from employees where hire_date like '__/05%'; --05��

select first_name from employees where email like 'A%';
select first_name, email from employees where email like '__A%';

-- NOT, IS NULL, IS NOT NULL
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--AND, OR
select * from employees where job_id ='IT_PROG' and salary >=7000;
select * from employees where job_id ='IT_PROG' or salary >=7000;

select * from employees where job_id ='IT_PROG' or job_id='FI_MGR' and salary >= 7000; --and�� �켱������ ���Ƽ� ���� ó����
select * from employees where (job_id ='IT_PROG' or job_id='FI_MGR') and salary >= 7000;

--������ ����(select ������ ������)
select * from employees order by hire_date;
select * from employees order by hire_date desc;
select * from employees where job_id in('IT_PROG','SA_REP') order by first_name asc;
select * from employees where salary between 5000 and 10000 order by employee_id asc;
select * from employees where commission_pct is not null order by first_name asc;

select * from employees order by hire_date asc, first_name desc; --hire_date���� ��������, �׾ȿ��� first_name�� ���� ��������
select salary + salary * commission_pct as �޿� FROM employees order by �޿� asc;


