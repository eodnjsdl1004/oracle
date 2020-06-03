--����ȯ �Լ� to_char, to_date, to_number

--��¥ -> ����
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD PM HH:MI:SS') from dual;

select to_char(hire_date, 'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YYYY"��"-MM"��"-DD"��"') from employees; --Ư�� ���ڴ� " "�����ϴ�

--���� -> ����
select to_char(20000, '99999') from dual;
select to_char(20000, '9999') from dual; --�ڸ��� ����
select to_char(20000.21, '99999') from dual;
select to_char(20000.21, '99999.99') from dual; -- .�� �Ҽ����� ��Ÿ����
select to_char(20000, '999,99') from dual; --, �� �޸��� ǥ�� ����
select salary from employees;
select to_char(salary, '$999,999') as salary from employees; 

--���� -> ���� to_number
select '2000' + 2000 from dual; --�ڵ�����ȯ
select to_number('2000') + 2000 from dual; --���������ȯ

select '$3,300' + 2000 from dual; -- ����
select to_number('$3,300', '$9,999') + 2000 from dual; --���� fmt�� ����ؼ� ����� ����ȯ

--���� -> ��¥ to_date

select to_date('2020/01/31') + 7 from dual; --��¥����ȯ
select to_date('2020-01-31') + 7 from dual; --��¥����ȯ
select to_date('2020-02-03', 'YY/MM/DD') from dual;
select to_date('2020-03-03 12:23:03', 'YY/MM/DD HH:MI:SS') from dual; --��¥ fmt�� ����ؼ� ����� ����ȯ

--NULL���� NVL, NVL2 ��
--NVL(�÷�, NULL�ϰ�� ��ȯ�Ұ�)

select null from dual;
select NVL(null, 0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, NVL(commission_pct, 0) as commission_pct from employees; 

--NVL(�÷�, NULL�� �ƴҰ�찪, NULL�ϰ�찪) ��
select NVL2(null, '���� �ƴմϴ�', '���Դϴ�') from dual;
select first_name, NVL2(commission_pct, 'true', 'false') from employees;
select first_name, NVL2(commission_pct, salary + salary * commission_pct, salary) as �޿� from employees;

--DECODE  �� (else if��)
select DECODE('C', 'A', 'A�Դϴ�',
                   'B', 'B�Դϴ�',
                   'C', 'C�Դϴ�',
                        '���ξƴմϴ�'
              ) as result
from dual;

select * from employees;
select first_name, job_id, salary,
       DECODE(job_id, 'IT_PROG', salary * 1.1,
                      'FI_MGR', salary * 1.2,
                      'FI_ACCOUNT', salary * 1.3,
                      'AD_VP', salary * 1.4,
                               salary
              ) as result
from employees;              

--case when then end
select first_name, job_id, salary,
       (case job_id when 'IT_PROG' then salary * 1.1
                   when 'FI_MGR' then salary * 1.2
                   when 'FI_ACCOUNT' then salary * 1.3
                   when 'AD_VP' then salary * 1.4
                   else salary
       END) as result
from employees;       

-----------------------------------------------------------------------------------
--�������� 1
select employee_id as �����ȣ,
       concat(first_name, last_name) as �����,
       hire_date as �Ի�����,
       trunc( (sysdate - hire_date)/365 ) as �ټӳ��
from employees
where (sysdate - hire_date)/365 >= 10
order by �ټӳ�� desc;
                
--��������
select first_name,
       manager_id,
       DECODE(manager_id, 100, '���',
                         120, '����',
                         121, '�븮',
                         122, '����',
                              '�ӿ�') as ����
from employees
where department_id = 50;










