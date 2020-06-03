--���� 1. -EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���) 
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ��� 
---EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
select count(*)
from employees
where salary>(select avg(salary) from employees);

select count(*)
from employees
where salary>(select 
                    avg(salary) 
              from employees
              where job_id='IT_PROG');
              

--���� 2. -DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id�� 
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.

select d.department_id
from departments d
where manager_id=100;

select * 
from employees e
where e.department_id =(select d.department_id
from departments d
where manager_id=100);



--���� 3. -EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
---EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.

select *
from employees
where manager_id >(select manager_id
                   from employees
                   where first_name = 'Pat');
select * 
from employees
where manager_id in(select manager_id
                   from employees
                   where first_name = 'James');

--���� 4. -EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
select rn, 
       �̸�
from(select 
        rownum rn,
        �̸�
     from (select 
                    concat(concat(first_name, ' '), last_name) as �̸�
           from employees e
           order by first_name desc))
where rn>40 and rn<=50;

--���� 5. -EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, �Ի����� ����ϼ���.

select rn,
       employee_id,
       �̸�,
       phone_number,
       hire_date     
from(select rownum rn,
            employee_id,
            concat(concat(first_name, ' '), last_name) as �̸�,
            phone_number,
            hire_date        
from(select 
            *
     from  employees
     order by hire_date))
where rn>30 and rn<=40;


--���� 6. employees���̺� departments���̺��� left �����ϼ��� 
--����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�. ����) �������̵� ���� �������� ���� 
select e.employee_id,
       concat(concat(e.first_name, ' '), e.last_name) as �̸�,
       e.department_id as �μ����̵�,
       d.department_name as �μ���
from employees e
left outer join departments d
on e.department_id = d.department_id
order by employee_id;

--���� 7. ���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

select e.employee_id,
       concat(concat(e.first_name, ' '), e.last_name) as �̸�,
       e.department_id as �μ����̵�,
      (select d.department_name 
       from departments d
       where e.department_id = d.department_id) as �μ���
from employees e 
order by employee_id;

--���� 8. departments���̺� locations���̺��� left �����ϼ��� 
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ� ����) �μ����̵� ���� �������� ����

select * from locations;
select * from departments;
select d.department_id as �μ����̵�, 
       d.department_name as �μ���,
       d.manager_id,
       d.location_id,
       l.street_address,
       l.postal_code,
       l.city
from departments d
left outer join locations l
on d.location_id = l.location_id
order by d.department_id;
       

--���� 9. ���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

select d.department_id as �μ����̵�, 
       d.department_name as �μ���,
       d.manager_id,
       d.location_id,
       (select 
            l.street_address
       from locations l
       where d.location_id = l.location_id),
       (select             
            l.postal_code
       from locations l
       where d.location_id = l.location_id),      
       (select 
            l.city
       from locations l
       where d.location_id = l.location_id)
from departments d
order by d.department_id;



--���� 10. locations���̺� countries ���̺��� left �����ϼ��� 
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ� ����) country_name���� �������� ����

select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       c.country_name
from locations l
left outer join countries c
on l.country_id = c.country_id
order by country_name;

--���� 11. ���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���

select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       (select c.country_name
       from countries c
       where l.country_id = c.country_id) as ����
from locations l
order by ����;

--���� 12. (�ſ�����) employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ� 
--����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�. 
--����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�

select *    
from (select 
            employee_id,
            concat(concat(first_name, ' '), last_name) as �̸�,      
            phone_number,
            hire_date,
            e.department_id,
            department_name as �μ���
from employees e
left outer join departments d
on e.department_id = d.department_id
order by hire_date)
where rownum>=1 and rownum<=10;



--���� 13. --EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���

select e.last_name,
       e.job_id,
       e.department_id,
       (select department_name
        from departments d
        where e.department_id = d.department_id) as �μ���
from employees e
where job_id = 'SA_MAN';

--���� 14 --DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���. 
--�ο��� ���� �������� �����ϼ���. --����� ���� �μ��� ������� ���� �ʽ��ϴ�.

select  d.department_id,
        d.department_name,
        d.manager_id,
        �ο���
from departments d
left outer join(select department_id, 
                       count(*)as �ο��� 
                from employees 
                group by department_id) e
on d.department_id = e.department_id
where �ο��� is not null
order by �ο��� desc;

--���� 15 --�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ��� --�μ��� ����� ������ 0���� ����ϼ���
select * from departments;

select  d.department_id,
        d.department_name,
        d.manager_id,
        d.location_id,
        l.street_address,
        l.postal_code,
        nvl(���,0)
from departments d
left outer join(select department_id,
                      trunc(avg(salary))as ��� 
                from employees 
                group by department_id) e
on d.department_id = e.department_id
left outer join locations l
on d.location_id = l.location_id;


--���� 16 -���� 15����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������ ����ϼ���

select rn,
       �μ����̵�,
       �μ���,
       �޴������̵�,
       �������̵�,
       �ּ�,
       �����ȣ,
       ���
from(select 
       rownum rn,
       department_id as �μ����̵�,
       department_name as �μ���,
       manager_id as �޴������̵�,
       location_id as �������̵�,
       street_address as �ּ�,
       postal_code as �����ȣ,
       ���
from(select  d.department_id,
             d.department_name,
             d.manager_id,
             d.location_id,
             l.street_address,
             l.postal_code,
             nvl(���,0) as ���
from departments d
left outer join(select department_id,
                      trunc(avg(salary))as ��� 
                from employees 
                group by department_id) e
                on d.department_id = e.department_id
left outer join locations l
on d.location_id = l.location_id
order by department_id desc))
where rn>=1 and rn<=10;
