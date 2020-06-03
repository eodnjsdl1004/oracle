--테이블 기본적 조회
select * from employees;
--대소문자 상관없음
select * from EMPLOYEES;

select employee_id from employees;
select employee_id, first_name, last_name, email from employees;

--컬럼을 조회하는 위치에서 *+-/ 연산 가능
select employee_id, first_name, last_name, salary, salary + salary*0.1 from employees;
--null값 확인
select commission_pct, manager_id from employees;
--칼럼 엘리어스
select employee_id as 아이디, first_name as 이름, last_name as 성, salary+salary*0.1 as 보너스 from employees;
select first_name || ' ' || last_name || '''s salary is $' || salary as 급여 from employees;
--||연결자
SELECT first_name || ' ' || last_name as 성함 from employees;
--distinct 중복제거
select distinct department_id from employees;
select department_id from employees;
--ROWNUM과 ROWID query 로우넘은 쿼리 결과에 대한 행번호
select rownum,rowid employee_id, first_name || last_name from employees;
select rownum, email from employees;

