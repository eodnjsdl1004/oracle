--그룹함수 sum, max, min, avg, count
select avg(salary), max(salary), min(salary), sum(salary), count(*) from employees;

select count(*) from employees; --총 행 개수
select count(first_name) from employees; --총 null이 아닌 이름의 개수
select count(commission_pct) from employees;
select count(manager_id) from employees;

--select department_id, avg(salary) from employees; --그룹함수는 일반 컬럼과 동시에 출력할 수 없음
select department_id, avg(salary) from employees group by department_id; --그룹으로 묶으면 해당 목록에 대하여 사용함

--select job_id, department_id  from employee group by department_id; --groupby로 묶지않은 칼럼은 집계할 수 없음
select department_id, job_id, avg(salary) from employees group by department_id,job_id; --추가하고싶은 칼럼을 group by에 추가해줘야함

--group by 절 쪼개기
select department_id from employees GROUP by department_id order by department_id; --12개였던 행이
select department_id,job_id from employees GROUP by department_id, job_id order by department_id; -- 20개로 늘어남

--count(*) over() 컬럼의 총 행의 수를 붙여서 출력 가능
select department_id, first_name , job_id, count(*)over() from employees; --이런것도 있음.

--Having
select department_id, sum(salary)
from employees
group by department_id
having sum(salary)>=100000;

select job_id,count(*)
from employees
group by job_id
having count(*) >= 30;

-- 부서 아이디가 50이상인 것들을 그룹화 시키고, 그룹평균중 10000이상만 호출
select department_id, avg(salary)
from employees
where department_id >= 50
group by department_id
having round(avg(salary),2)>=10000;

--문제 1. 사원 테이블에서 JOB_ID별 사원 수를 구하세요. 사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요
select job_id, count(*) as 사원수, avg(salary) as 월급평균
from employees 
group by job_id
order by 월급평균 desc;

--문제 2. 사원 테이블에서 입사 년도 별 사원 수를 구하세요.
select to_char(hire_date,'YY') as 입사년도, count(*) as 사원수
from employees
group by to_char(hire_date,'YY');

--문제 3. 급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 단 부서 평균 급여가 2000이상인 부서만 출력
select department_id,
       round(avg(salary))
from employees
where salary >=1000
group by department_id
having avg(salary)>=2000;

--문제 4. 사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의 department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
--조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다. 조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
select * from employees where commission_pct is NOT null;
select department_id as 부서, 
       trunc(avg(salary+salary*commission_pct),2) as 평균, 
       sum(salary) as 합계, 
       count(*) as 수
from employees  
where commission_pct is NOT null 
group by department_id;
