--그룹함수 AVG, MAX, MIN, SUM, COUNT
select avg(salary), max(salary), min(salary), sum(salary), count(*) from employees;

select count(*) from employees; --총 행 데이터의 수
select count(first_name) from employees; --null이 아닌 행의 수
select count(commission_pct) from employees; --null이 아닌 행의 수
select count(manager_id) from employees; -- null이 아닌 행의 수

-- 부서별로 그룹화, 그룹함수의 사용
select department_id, avg(salary) from employees group by department_id; 
--그룹함수는 일반 컬럼과 동시에 출력할 수 없습니다.
select department_id, avg(salary) from employees; 
--group by절을 사용할 때 group절에 묶이지 않으면 다른 컬럼을 조회할 수 없습니다
select job_id, department_id from employees group by department_id; 


--group by절 2개 이상 사용
select department_id from employees group by department_id order by department_id;
select department_id, job_id from employees group by department_id, job_id order by department_id;

--count(*) over() 구문에서 예외적으로 컬럼에, 총 행의 수를 붙여서 확인이 가능합니다.
select department_id, first_name, last_name, count(*) over() from employees;

--group by 절의 조건 having절
select department_id, sum(salary) 
from employees
group by department_id
having sum(salary) > 100000;

select job_id, count(*)
from employees
group by job_id
having count(*) >= 20;

--부서아이디가 50이상인 것들을 그룹화 시키고, 그룹평균중 5000이상만 조회
select department_id, avg(salary) as 평균
from employees
where department_id >= 50
group by department_id
having avg(salary) >= 5000;

----------------------------------------------------------------------------------
select * from employees;
--문제1
select job_id, count(*) as total
from employees
group by job_id;

select job_id, avg(salary) as 급여평균
from employees
group by job_id
order by 급여평균;

--문제2
select 
    to_char(hire_date, 'YY') as 입사년도,
    count(*) as 사원수
from employees
group by to_char(hire_date, 'YY');

--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력
select 
    department_id, 
    trunc(avg(salary))
from employees
where salary >= 1000
group by department_id
having trunc(avg(salary)) >= 2000;
/*문제4
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의 department_id(부서별) salary(월급)의 
평균, 합계, count를 구합니다
*/

select 
    department_id,
    trunc(avg( salary + salary * commission_pct  ), 2) as 급여평균,
    sum(salary + salary * commission_pct) as 급여합계,
    count(*) as 사원수
from employees
where commission_pct is not null
group by department_id;





















