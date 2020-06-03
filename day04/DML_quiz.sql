--문제 1. DEPTS테이블의 다음을 추가하세요
--DEPARTMENT_ID DEPARTMENT_NAME MANAGER_ID LOCATION_ID 
--280개발 null 1800 
--290회계부 null 1800 
--300재정 301 1800 
--310인사 302 1800 
--320영업 303 1700
drop table depts;
create table depts as select*from departments;
desc depts;
select * from depts;
insert into depts values(280,'개발',null,1800);
insert into depts values(290,'회계',null,1800);
insert into depts values(300,'재정',301,1800);
insert into depts values(301,'인사',302,1800);
insert into depts values(320,'영업',303,1700);
commit;
rollback;
--문제 2. DEPTS테이블의 데이터를 수정합니다 
--1. department_name 이 IT Support 인 데이터의 department_name을 IT bank로 변경 
update depts set department_name = 'IT bank' where department_name = 'IT Support';

--2. department_id가 290인 데이터의 manager_id를 301로 변경 
update depts set manager_id = 301 where department_id = 290;

--3. department_name이 IT Helpdesk인 데이터의 부서명을 IT Help로 , 매니저아이디를 303으로, 지역아이디를 1800으로 변경하세요 
update depts set department_name = 'IT Help', manager_id = 303, LOCATION_ID = 1800  where department_name = 'IT Helpdesk';
commit; -- 삽입삭제수정 한뒤에는 커밋을 해줘야 변경이 된다.
--4. 이사, 부장, 과장, 대리  의 매니저아이디를 301로 한번에 변경하세요.
update depts set manager_id = 301 where department_name in('개발','재정','인사','영업');
commit;


--문제 3. 삭제의 조건은 항상 primary key로 합니다, 여기서 primary key는 department_id라고 가정합니다. 
--1. 부서명 영업부를 삭제 하세요 2. 부서명 NOC를 삭제하세요
delete from depts where department_id = 320;
delete from depts where department_id = 220;
commit;

--문제4 1. Depts 사본테이블에서 department_id 가 200보다 큰 데이터를 삭제하세요.
delete from depts where department_id>200;
commit;
rollback;
--2. Depts 사본테이블의 manager_id가 null이 아닌 데이터의 manager_id를 전부 100으로 변경하세요. 
update depts set manager_id = 100 where manager_id is not null;
commit;
--3. Depts 테이블은 타겟 테이블 입니다. 
--4. Departments테이블은 매번 수정이 일어나는 테이블이라고 가정하고 Depts와 비교하여 일치하는 경우
-- Depts의 부서명, 매니저ID, 지역ID를 업데이트 하고 새로유입된 데이터는 그대로 추가해주는 merge문을 작성하세요.

merge into depts a --타켓 테이블
        using (select * from departments) b --조회할 구문
        on (a. department_id = b.department_id)
when matched then
    update set
    a.department_name = b.department_name,
    a.manager_id = b.manager_id,
    a.LOCATION_ID = b.LOCATION_ID
when not matched then
    insert values 
    (b.department_id,
     b.department_name,
     b.manager_id,
     b.LOCATION_ID);    



--문제 5
--1. jobs_it 사본 테이블을 생성하세요 (조건은 min_salary가 6000보다 큰 데이터만 복사합니다) 

select * from jobs;
create table jobs_it as (select * from jobs where min_salary>6000);
select * from jobs_it;
--2. jobs_it 테이블에 다음 데이터를 추가하세요
insert into jobs_it values('IT_DEV', '아이티개발팀',6000,20000);
insert into jobs_it values('NET_DEV', '네트워크개발팀',5000,20000);
insert into jobs_it values('SEC_DEV', '보안개발팀',6000,19000);

--JOB_ID JOB_TITLE MIN_SALARY MAX_SALARY 
--IT_DEV 아이티개발팀 6000 20000 
--NET_DEV 네트워크개발팀 5000 20000 
--SEC_DEV 보안개발팀 6000 19000
--3.   jobs_it은 타겟 테이블 입니다 
--4.   jobs테이블은 매번 수정이 일어나는 테이블이라고 가정하고 jobs_it과 비교하여 min_salary컬럼이 0보다 큰 경우
--기존의 데이터는 min_salary, max_salary를 업데이트 하고 새로 유입된 데이터는 그대로 추가해주는 merge문을 작성하세요

merge into jobs_it a
      using (select * from jobs where min_salary > 0) b
      on (a.job_id = b.job_id)
when matched then
     update set
     a.min_salary = b.min_salary,
     a.max_salary = b.max_salary
when not matched then
     insert values
     (b.job_id,
      b.JOB_TITLE,
      b.MIN_SALARY,
      b.MAX_SALARY);
commit;
select * from jobs_it;