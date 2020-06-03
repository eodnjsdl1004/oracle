--inner join
select * 
from info i 
join 
auth a 
on i.auth_id = a.auth_id;

--left join , 컬럼이 중복된다면 지칭[.]을 사용해서 가져올 것
--일반적으로 table 엘리어스를 지정해서 사용가능
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

--조건절
select 
    i.id as 아이디, 
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

--right 오른쪽 기준
select 
    i.id as 아이디, 
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
    i.id as 아이디, 
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

-----------------서로 연결되어있음---------------------
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

-- 테이블 엘리어스 auth,info를 사용해서 job 컬럼이 scientist인 사람의 id, title,content,job 출력

select i.id, 
       i.title, 
       i.content, 
       a.job
from auth a
left outer join 
info i 
on i.auth_id = a.auth_id
where a.job = 'scientist';

--right인경우 안나옴
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
