--insert 데이터추가
desc departments;
select * from departments;

--첫번째 방법(모든 컬럼을 한번에 저장)
insert into departments values(280, 'developer', null, 1700);
rollback;

--두번째 방법(직접 칼럼을 지정하고 저장)
insert into departments(department_id, department_name, location_id) values(280,'개발자',1700);
insert into departments(department_id, department_name, location_id) values(290,'디자이너',1800);
insert into departments(department_id, department_name, location_id) values(300,'DB관리자',1900);
insert into departments values(310,'데이터분석가',200,1800);
insert into departments values(320,'서버관리자',200,1800);
rollback;

--sub_query

create table managers as (select*from employees where 1=2); --형식만 같은 사본  테이블 만들기
select * from managers;
insert into managers (select * from employees where job_id = 'IT_PROG');
insert into managers (employee_id, first_name, last_name, job_id, salary, hire_date,email)
(select employee_id,first_name, last_name, job_id, salary, hire_date, email from employees);
rollback;

create table emps as (select * from employees where 1=1);--내용물까지 같은 복사
select *from emps;
update emps set salary = 30000;
update emps set salary = 30000 where  employee_id = 100;
update emps set salary = salary+salary*0.2 where  employee_id = 100; --set뒤에 연산결과도 가능
update emps set phone_number ='515.213.4242', hire_date = sysdate, manager_id=102 where employee_id =100;
rollback;
select * from employees;
update emps set(job_id, salary, manager_id)=(select job_id, salary, manager_id from employees where employee_id = 100)
where employee_id =101;

--항상 select로 내가 지우려는 것을 확인하자

select * from emps where employee_id = 103;
delete from emps where employee_id = 103;
select * from emps where employee_id in (select employee_id from employees where department_id>90);
delete from emps where employee_id in (select employee_id from employees where department_id>90);
select * from emps where department_id = (select department_id from departments where department_name = 'Shipping');
delete from emps where department_id = (select department_id from departments where department_name = 'Shipping');

--merge
drop table managers;
 delete from emps where employee_id <>103;
 select *from emps;
 
 update emps set first_name ='길동', last_name ='홍', hire_date = sysdate where employee_id =103;
 
 merge into emps a --타켓 테이블
        using (select * from employees where job_id = ★여기★) b
        on (a. employee_id = b.employee_id)
when matched then
    update set
    a.first_name = b.first_name,
    a.last_name = b.last_name,
    a.hire_date = b.hire_date,
    a.salary = b.salary,
    a.commission_pct = b.commission_pct,
    a.manager_id = b.manager_id
when not matched then
    insert values 
    (b.employee_id, b.first_name, b.last_name, b. email,
     b.phone_number, b.hire_date, b.job_id, b.salary, b.commission_pct,
     b.manager_id, b.department_id);     
rollback;
 
 
 