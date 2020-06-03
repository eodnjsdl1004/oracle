--inner join
select * 
from info i 
join 
auth a 
on i.auth_id = a.auth_id;

--left join , �÷��� �ߺ��ȴٸ� ��Ī[.]�� ����ؼ� ������ ��
--�Ϲ������� table ������� �����ؼ� ��밡��
select 
    i.id, 
    i.title, 
    i.content, 
    i.regdate, 
    i.auth_id, 
    a.name,
    a.job
from info i 
left outer join 
auth a 
on i.auth_id = a.auth_id;

--������
select 
    i.id as ���̵�, 
    i.title, 
    i.content, 
    i.regdate, 
    i.auth_id, 
    a.name,
    a.job
from info i 
full outer join 
auth a 
on i.auth_id = a.auth_id
where i.auth_id is null;

--right ������ ����
select 
    i.id as ���̵�, 
    i.title, 
    i.content, 
    i.regdate, 
    i.auth_id, 
    a.name,
    a.job
from info i 
right outer join 
auth a 
on i.auth_id = a.auth_id
where i.auth_id is null;

--cross => cartesian product
select 
    i.id as ���̵�, 
    i.title, 
    i.content, 
    i.regdate, 
    i.auth_id, 
    a.name,
    a.job
from info i 
cross join 
auth a 
where i.auth_id is null;

-----------------���� ����Ǿ�����---------------------
select * from employees;
select * from departments;
select * from locations;

SELECT *
from employees e
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
where department_name = 'Finance';

-- ���̺� ����� auth,info�� ����ؼ� job �÷��� scientist�� ����� id, title,content,job ���

select i.id, 
       i.title, 
       i.content, 
       a.job
from auth a
left outer join 
info i 
on i.auth_id = a.auth_id
where a.job = 'scientist';

--right�ΰ�� �ȳ���
select i.id, 
       i.title, 
       i.content, 
       a.job
from auth a
right outer join 
info i 
on i.auth_id = a.auth_id
where a.job = 'scientist';

select count(*)
from auth a
join 
info i 
on i.auth_id = a.auth_id
where a.job = 'developer';
