--서브쿼리 사용방법
--()안에 명시함, 서브쿼리의 리턴행이 1줄 이하여야합니다. 서브쿼리 먼저 해석

--nancy 보다 많은 급여의 사원찾기
select salary from employees where first_name = 'Nancy';
select * 
from employees
where salary >= 
                (select salary 
                 from employees 
                 where first_name = 'Nancy');
                 
--job 아이디가 103인 사람
select job_id from employees where employee_id=103;
--job 아이디가 103인 사람과 동일 한 직무의 사람들
select first_name, 
       job_id, 
       hire_date
from employees
where job_id = (select job_id from employees where employee_id=103);

--다중행의 경우 in any all의 키워드를 사용하여 서브쿼리를 활용한다.
select job_id from employees where job_id = 'IT_PROG';

--에러 구문
select *
from employees
where job_id = (select job_id 
                from employees 
                where job_id = 'IT_PROG');
--서브쿼리의 리턴행이 여러개라면 일반적인 비교 연산자를 처리할 수 없습니다.
                
--3개의 값과 하나라도 일치하면 출력
select salary from employees where first_name = 'David';
select * 
from employees
where salary in (select salary 
                 from employees 
                 where first_name = 'David');

-- 3개중에서 최솟값 보다 크다면
select * 
from employees
where salary > any (select salary 
                    from employees 
                    where first_name = 'David');

-- 3개중에서 최대값 보다 작다면
select * 
from employees
where salary < some (select salary 
                    from employees 
                    where first_name = 'David');
--all은 3개중에서 최대값보다 크거나, 최솟값 보다 작거나
select * 
from employees
where salary > all (select salary 
                    from employees 
                    where first_name = 'David');

select job_id from employees where department_id = 90;
select *
from employees
where job_id in (select job_id 
                from employees 
                where department_id = 90);
                
--스칼라 쿼리
select * from employees;
select * from departments;
 --left outer join과 같은 결과지만
select 
       e.first_name,
       d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id;
--실행과정이 더 단축됨. 서브쿼리가 연속으로 들어갈 수도 있음
select first_name,
       (select department_name 
        from departments d
        where d.department_id = e.department_id)department_name,
       (select department_id 
        from departments d
        where d.department_id = e.department_id) department_id
from employees e;
---------------------------------------------------------------------
select * from employees;
select * from jobs;

select 
       e.employee_id,
       e.job_id,
       j.job_title
from employees e
left outer join jobs j
on e.job_id = j.job_id;
                
select 
       e.employee_id,
       e.job_id,
       (select j.job_title 
       from jobs j
       where e.job_id = j.job_id) job_title
from employees e;

--인라인 뷰 from구문에 서브쿼리가 오는 것
-- 특정알고리즘으로 조회하면서 rownum이 붙어버림, order by를 마지막에 실행하기 때문
select rownum, first_name, salary from employees order by salary desc;
--그래서 정렬해놓은 테이블을 from의 서브쿼리로 넣고 사용하면 됨.
select rownum, 
       first_name, 
       salary 
from (select first_name,
             salary 
from employees 
order by salary desc);
--where rownum>11 and rownum<=20; 중간값은 추출할 수가없다.
--그래서 한번더 select로 한번더 감싸서 2번째 서브쿼리 안의 rownum에 alias를 붙여 그것을 바깥의 where절의 조건으로 사용하면 됨
--바깥의 쿼리들은 alias[.]을 붙이지 않는다.
select rownum, 
       rn,
       first_name,
       salary       
from (
select rownum rn, 
       first_name, 
       salary 
from (select first_name,
             salary 
from employees 
order by salary desc))
where rn>10 and rn<20;

-- join에 결합할 부분에도 서브쿼리를 쓸수 있다.
select *
from employees e
join (select
             department_id,
             department_name
      from departments) d
on d.department_id = e.department_id;
