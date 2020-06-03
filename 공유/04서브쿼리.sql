--서브쿼리
--서브쿼리 사용방법 ( )안에 명시함. 서브쿼리절의 리턴행이 1줄 이하여야 합니다.
--서브쿼리절을 먼저 해석하면 됩니다.
select salary from employees where first_name = 'Nancy';

select *
from employees
where salary >= (select salary 
                 from employees 
                 where first_name = 'Nancy');
                 

--사원번호가 103번인 사람과 직무가 동일한 사람을 찾는 서브쿼리
select job_id from employees where employee_id = 103;

select *
from employees
where job_id = (select job_id 
                from employees 
                where employee_id = 103);

--서브쿼리의 리턴행이 여러개라면 일반적인 비교 연산자로 처리할 수 없습니다.
select job_id from employees where department_id = 90;
select *
from employees
where job_id = (select job_id 
                from employees 
                where department_id = 90);
                
 --다중행 서브쿼리 (서브쿼리 결과 행이 여러개 나올 때, in, any, all               
select *
from employees
where job_id in (select job_id
                from employees
                where department_id = 90);
              
-- David는 3명(가장 작은값) 보다 급여가 큰 사람을 조회                
select salary from employees where first_name = 'David';                

select *
from employees
where salary > any (select salary from employees where first_name = 'David');

-- David는 3명(가장 큰값) 보다 급여가 큰 사람을 조회
select *
from employees
where salary > all (select salary from employees where first_name = 'David');
 
    
--스칼라서브쿼리(select 구문에 서브쿼리가 오는것, LEFT OUTER JOIN이랑 같은결과)
select * from employees;
select * from departments;

select 
    first_name,
    department_name
from employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

select 
    first_name,
    (select department_name from departments d where d.department_id = e.department_id ) as department_name
from employees e;


select * from employees;
select * from jobs;
------------------------------------------------------------
select 
    employee_id,
    e.job_id,
    job_title
from employees e
LEFT OUTER JOIN jobs j
ON e.job_id = j.job_id
order by employee_id ;

select
    employee_id,
    e.job_id,
    (select job_title from jobs j where j.job_id = e.job_id) as job_title
from employees e
order by employee_id ;

--인라인 뷰(from구문에 서브쿼리가 오는 것)

--select rownum ,first_name, salary from employees order by salary;
select 
    rownum,
    first_name,
    salary
from (select first_name, salary
      from employees
      order by salary
      )
where rownum > 0 and rownum <= 10;
--rownum의 시작은 1부터 시작되어 있어야 합니다.
select 
    rownum,
    first_name,
    salary
from (select first_name, salary
      from employees
      order by salary)
where rownum > 10 and rownum <= 20;

---------------3중 쿼리(페이징 쿼리)

select *
from (select rownum rn,
             employee_id,
             first_name,
             last_name,
             email
      from(select *
           from employees
           order by salary
           )
     )
where rn > 10 and rn <= 20;

----------------------------------------------------
select *
from(
    select 
        rownum rn,
        employee_id,
        first_name,
        last_name,
        department_name
    from(
        select
            employee_id,
            first_name,
            last_name,
            department_name
        from employees e
        JOIN departments d
        ON e.department_id = d.department_id
        order by employee_id asc)
    )
where rn > 20 and rn <= 30;

-----------------------------------------------------------
select *
from employees e
JOIN (select 
        department_id,
        department_name
      from departments) d
ON d.department_id =e.department_id;     












    
    
    
    
                 
                 