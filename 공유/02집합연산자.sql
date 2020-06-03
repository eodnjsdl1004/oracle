--union(합집합 중복x), union all(합집합 중복o), intersect(교집합), minus(차집합)
select employee_id, first_name from employees where hire_date like '04%' --04년도 입사자
union
select employee_id, first_name from employees where department_id = 20
union
select employee_id, first_name from employees where job_id = 'IT_PROG';


--주의할점: 컬럼개수를 정확히 일치 시켜야 합니다
select employee_id, first_name, last_name from employees where salary >= 5000
union all
select employee_id, first_name, last_name from employees where department_id = 20
union all
select 300, '홍', '길동' from dual
union all
select 400, '김', '길자' from dual;


select * from employees;




