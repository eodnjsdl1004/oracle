--INNER JOIN
select * 
from info 
INNER JOIN auth 
ON info.auth_id = auth.auth_id;
--auth_id�÷��� ���� ����ϸ�, ��ȣ�ϴ� ��� �߰� �˴ϴ�. �� ������ ���� ���̺� auth_id�� ��� �����ϱ� �����Դϴ�
--�̷� �� �÷��� ���̺��̸�.�÷����� ��Ī�ؼ� ���������� ��ȸ�� �� �ֽ��ϴ�
select 
    id,
    title,
    content,
    regdate,
    info.auth_id,
    name
from info
INNER JOIN auth
ON info.auth_id = auth.auth_id;
--�Ϲ������� table ������� ��Ī�ؼ� ��밡�� �մϴ�.
select 
    i.id,
    i.title,
    i.content,
    i.regdate,
    i.auth_id,
    a.name
from info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;
--������ where����
select
    id,
    title,
    content,
    regdate,
    i.auth_id,
    name
from info i
INNER JOIN auth a
ON i.auth_id = a.auth_id
where i.auth_id = 1;

--�ƿ��� ����
select * 
from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select *
from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id;

select *
from info i
FULL OUTER JOIN auth a
ON i.auth_id = a.auth_id;

--cross join
select *
from info i
CROSS JOIN auth a;

--------------------------------------------------------
select * from employees;
select * from departments;
select * from locations;

select *
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
LEFT OUTER JOIN locations i
ON d.location_id = i.location_id
where department_name = 'Finance';

------------------------------------------------------------
-- ���̺� auth, info���̺��� job�÷��� scientist�� ����� id, title, content, job�� ���
select
    id,
    title,
    content,
    job
from info i
LEFT OUTER JOIN auth a
ON i.auth_id = a.auth_id
where job = 'scientist';

-- RIGHT OUTER JOIN���� �޶����� ����� Ȯ���ϼ���.
select
    id,
    title,
    content,
    job
from info i
RIGHT OUTER JOIN auth a
ON i.auth_id = a.auth_id;













