--���̺� �⺻�� ��ȸ
select * from employees;
--��ҹ��� �������
select * from EMPLOYEES;

select employee_id from employees;
select employee_id, first_name, last_name, email from employees;

--�÷��� ��ȸ�ϴ� ��ġ���� *+-/ ���� ����
select employee_id, first_name, last_name, salary, salary + salary*0.1 from employees;
--null�� Ȯ��
select commission_pct, manager_id from employees;
--Į�� �����
select employee_id as ���̵�, first_name as �̸�, last_name as ��, salary+salary*0.1 as ���ʽ� from employees;
select first_name || ' ' || last_name || '''s salary is $' || salary as �޿� from employees;
--||������
SELECT first_name || ' ' || last_name as ���� from employees;
--distinct �ߺ�����
select distinct department_id from employees;
select department_id from employees;
--ROWNUM�� ROWID query �ο���� ���� ����� ���� ���ȣ
select rownum,rowid employee_id, first_name || last_name from employees;
select rownum, email from employees;

