-- null���� nvl nvl2
--nvl (�÷�, null�ϰ�� ��ȯ�� ��)
select null from dual;
select nvl(null,0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, nvl(commission_pct,0) from employees;

--nvl2(�÷�, null�� �ƴҰ�� ��ȯ�� ��,null�� ��� ��ȯ�� ��)
select nvl2(null,'null�Դϴ�','null�� �ƴմϴ�') from dual;
select first_name, nvl2(commission_pct,'true','false') from employees;
select first_name, nvl2(commission_pct, salary+salary*commission_pct,salary) as �޿� from employees;

--decode �� else-if��
select decode('C','A', 'A�Դϴ�',
                  'B', 'B�Դϴ�',
                  'C', 'C�Դϴ�',
                        '���� �ƴմϴ�.'
       )as result
from dual;
select * from employees;
select first_name, job_id, salary,
       decode(job_id, 'IT_PROG', salary*1.1,
                      'FI_MGR', salary*1.2,
                      'FI_ACCOUNT', salary*1.3,
                      'AD_VP', salary*1.4,
                                salary
                    ) as result
from employees;

-- case when then end
select first_name, job_id, salary,
       case job_id when 'IT_PROG' then salary*1.1
                   when 'FI_MGR' then salary*1.2
                   when 'FI_ACCOUNT' then salary*1.3
                   when 'AD_VP' then salary*1.4
                   else salary
      end as result
from employees;

--����1. �������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻��� ����� �ټӳ���� ���� ��� �������
select employee_id as �����ȣ,
       concat(first_name, last_name) as �����,
       hire_date as �Ի�����,
       trunc((sysdate-hire_date)/365) as �ټӳ�� 
from employees 
where (sysdate-hire_date)/365>=10 order by �ټӳ�� desc;

--����2. EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�. 
--100�̶�� �������, 120�̶�� �����ӡ� 121�̶�� ���븮�� 122��� �����塯 �������� ���ӿ��� ���� ����մϴ�.
--���� 1) manager_id�� 50�� ������� ������θ� ��ȸ�մϴ�
select * from employees;
select first_name, 
       manager_id, 
       decode(manager_id,100, '���',
                         120, '����',
                         121, '�븮',
                         122, '����',
                              '�ӿ�') as ���� 
from employees where department_id=50;


