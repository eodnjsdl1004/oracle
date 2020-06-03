--union(합집합, 중복x)  
select employee_id, first_name from employees where hire_date like '04%'
union
select employee_id, first_name from employees where department_id = 20
union
select employee_id, first_name from employees where job_id = 'IT_PROG';


--union all(합집합, 중복o)
select employee_id, first_name from employees where hire_date like '04%'
union all
select employee_id, first_name from employees where department_id = 20;

--intersect(교집합)
select employee_id, first_name from employees where hire_date like '04%'
intersect
select employee_id, first_name from employees where department_id = 20;

--minus(차집합)
select employee_id, first_name from employees where hire_date like '04%'
minus
select employee_id, first_name from employees where department_id = 20;

---
select employee_id, first_name, last_name from employees where salary >=5000
union all
select employee_id, first_name, last_name from employees where department_id =20
union all
select 300 ,'홍', '길동'  from dual
union all
select 400 ,'홍' , '길자'  from dual;

