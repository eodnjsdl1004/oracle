--�����Լ� round(�ø�), trunc(����)
select 45.123 from dual;
select round(45.123 , 1),
       round(45.123),
       round(45.123, 0),
       round(45.123, -1)
from dual;

select trunc(45.123, 1),
       trunc(45.123),
       trunc(45.123, 0),
       trunc(45.123, -1)
from dual;       

select ceil(34.1) from dual; --�ø�
select floor(34.9) from dual; --����

--��¥ �Լ� sysdate, systimestamp
select sysdate from dual;
select systimestamp from dual;

--��¥�� ������ �����մϴ�
select sysdate - 27 from dual;
select sysdate - hire_date from employees; -- �ϼ�

select first_name, hire_date, (sysdate - hire_date) / 7 from employees; --��
select first_name, hire_date, (sysdate - hire_date) / 365 from employees; -- 

--round, trunc ��¥�� ����
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; --�� �������� �ݿø�
select round(sysdate, 'month') from dual; --�� �������� �ݿø�
select round(sysdate, 'day') from dual; --�� �������� �ݿø�(�ش� ���� �Ͽ��� ��¥)

select trunc(sysdate) from dual;
select trunc(sysdate, 'year') from dual; --�� �������� ����
select trunc(sysdate, 'month') from dual; --�� �������� ����
select trunc(sysdate, 'day') from dual; -- �� �������� ����(�ش� ���� �Ͽ��� ��¥ ����) 
















