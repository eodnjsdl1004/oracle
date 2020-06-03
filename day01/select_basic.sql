--시작은 모든 검색을 하고나서
select * from employees;
--where 조건설정하여 검색하기
select  first_name, last_name, email, job_id from employees where job_id ='IT_PROG';
select * from employees where last_name = 'King'; 

select * from employees where hire_date = '04/01/30';--날짜 
select * from employees where salary >= 15000;
select * from employees where department_id = 90;

SELECT * FROM employees where salary between 15000 and 30000;
SELECT * FROM employees where salary >=15000 and salary <=30000;
SELECT * FROM employees where hire_date between '03/01/01' and '03/12/31';

select * from employees where department_id in(30,60,90);
select * from employees where manager_id in(101,102,103,104,105);
select * from employees where  job_id in('IT_PROG','AC_MGR');

--like(%는 모든, _는 한글자 나타낼 때)
select first_name || ' ' || last_name as 이름, hire_date as 입사일 from employees where hire_date like '03%';--03년
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%15'; -- 15일 
select first_name || ' ' || last_name, hire_date from employees where hire_date like '%05%'; -- 05 포함
select first_name || ' ' || last_name, hire_date from employees where hire_date like '__/05%'; --05월

select first_name from employees where email like 'A%';
select first_name, email from employees where email like '__A%';

-- NOT, IS NULL, IS NOT NULL
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--AND, OR
select * from employees where job_id ='IT_PROG' and salary >=7000;
select * from employees where job_id ='IT_PROG' or salary >=7000;

select * from employees where job_id ='IT_PROG' or job_id='FI_MGR' and salary >= 7000; --and가 우선순위가 높아서 먼저 처리됨
select * from employees where (job_id ='IT_PROG' or job_id='FI_MGR') and salary >= 7000;

--데이터 정렬(select 구문의 마지막)
select * from employees order by hire_date;
select * from employees order by hire_date desc;
select * from employees where job_id in('IT_PROG','SA_REP') order by first_name asc;
select * from employees where salary between 5000 and 10000 order by employee_id asc;
select * from employees where commission_pct is not null order by first_name asc;

select * from employees order by hire_date asc, first_name desc; --hire_date기준 오름차순, 그안에서 first_name을 기준 내림차순
select salary + salary * commission_pct as 급여 FROM employees order by 급여 asc;



