--문제 1. -EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 데이터를 출력 하세요 ( AVG(컬럼) 사용) 
---EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 수를 출력하세요 
---EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들을 데이터를 출력하세요
select count(*)
from employees
where salary>(select avg(salary) from employees);

select count(*)
from employees
where salary>(select 
                    avg(salary) 
              from employees
              where job_id='IT_PROG');
              

--문제 2. -DEPARTMENTS테이블에서 manager_id가 100인 사람의 department_id와 
--EMPLOYEES테이블에서 department_id가 일치하는 모든 사원의 정보를 검색하세요.

select d.department_id
from departments d
where manager_id=100;

select * 
from employees e
where e.department_id =(select d.department_id
from departments d
where manager_id=100);



--문제 3. -EMPLOYEES테이블에서 “Pat”의 manager_id보다 높은 manager_id를 갖는 모든 사원의 데이터를 출력하세요
---EMPLOYEES테이블에서 “James”(2명)들의 manager_id와 갖는 모든 사원의 데이터를 출력하세요.

select *
from employees
where manager_id >(select manager_id
                   from employees
                   where first_name = 'Pat');
select * 
from employees
where manager_id in(select manager_id
                   from employees
                   where first_name = 'James');

--문제 4. -EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력하세요
select rn, 
       이름
from(select 
        rownum rn,
        이름
     from (select 
                    concat(concat(first_name, ' '), last_name) as 이름
           from employees e
           order by first_name desc))
where rn>40 and rn<=50;

--문제 5. -EMPLOYEES테이블에서 hire_date기준으로 오름차순 정렬하고, 31~40번째 데이터의 행 번호, 사원id, 이름, 번호, 입사일을 출력하세요.

select rn,
       employee_id,
       이름,
       phone_number,
       hire_date     
from(select rownum rn,
            employee_id,
            concat(concat(first_name, ' '), last_name) as 이름,
            phone_number,
            hire_date        
from(select 
            *
     from  employees
     order by hire_date))
where rn>30 and rn<=40;


--문제 6. employees테이블 departments테이블을 left 조인하세요 
--조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다. 조건) 직원아이디 기준 오름차순 정렬 
select e.employee_id,
       concat(concat(e.first_name, ' '), e.last_name) as 이름,
       e.department_id as 부서아이디,
       d.department_name as 부서명
from employees e
left outer join departments d
on e.department_id = d.department_id
order by employee_id;

--문제 7. 문제 6의 결과를 (스칼라 쿼리)로 동일하게 조회하세요

select e.employee_id,
       concat(concat(e.first_name, ' '), e.last_name) as 이름,
       e.department_id as 부서아이디,
      (select d.department_name 
       from departments d
       where e.department_id = d.department_id) as 부서명
from employees e 
order by employee_id;

--문제 8. departments테이블 locations테이블을 left 조인하세요 
--조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트 코드, 시티 만 출력합니다 조건) 부서아이디 기준 오름차순 정렬

select * from locations;
select * from departments;
select d.department_id as 부서아이디, 
       d.department_name as 부서명,
       d.manager_id,
       d.location_id,
       l.street_address,
       l.postal_code,
       l.city
from departments d
left outer join locations l
on d.location_id = l.location_id
order by d.department_id;
       

--문제 9. 문제 8의 결과를 (스칼라 쿼리)로 동일하게 조회하세요

select d.department_id as 부서아이디, 
       d.department_name as 부서명,
       d.manager_id,
       d.location_id,
       (select 
            l.street_address
       from locations l
       where d.location_id = l.location_id),
       (select             
            l.postal_code
       from locations l
       where d.location_id = l.location_id),      
       (select 
            l.city
       from locations l
       where d.location_id = l.location_id)
from departments d
order by d.department_id;



--문제 10. locations테이블 countries 테이블을 left 조인하세요 
--조건) 로케이션아이디, 주소, 시티, country_id, country_name 만 출력합니다 조건) country_name기준 오름차순 정렬

select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       c.country_name
from locations l
left outer join countries c
on l.country_id = c.country_id
order by country_name;

--문제 11. 문제 10의 결과를 (스칼라 쿼리)로 동일하게 조회하세요

select l.location_id,
       l.street_address,
       l.city,
       l.country_id,
       (select c.country_name
       from countries c
       where l.country_id = c.country_id) as 국가
from locations l
order by 국가;

--문제 12. (매우어려움) employees테이블, departments테이블을 left조인 hire_date를 오름차순 기준으로 1-10번째 데이터만 출력합니다 
--조건) rownum을 적용하여 번호, 직원아이디, 이름, 전화번호, 입사일, 부서아이디, 부서이름 을 출력합니다. 
--조건) hire_date를 기준으로 오름차순 정렬 되어야 합니다. rownum이 틀어지면 안됩니다

select *    
from (select 
            employee_id,
            concat(concat(first_name, ' '), last_name) as 이름,      
            phone_number,
            hire_date,
            e.department_id,
            department_name as 부서명
from employees e
left outer join departments d
on e.department_id = d.department_id
order by hire_date)
where rownum>=1 and rownum<=10;



--문제 13. --EMPLOYEES 과 DEPARTMENTS 테이블에서 JOB_ID가 SA_MAN 사원의 정보의 LAST_NAME, JOB_ID,
--DEPARTMENT_ID,DEPARTMENT_NAME을 출력하세요

select e.last_name,
       e.job_id,
       e.department_id,
       (select department_name
        from departments d
        where e.department_id = d.department_id) as 부서명
from employees e
where job_id = 'SA_MAN';

--문제 14 --DEPARTMENT테이블에서 각 부서의 ID, NAME, MANAGER_ID와 부서에 속한 인원수를 출력하세요. 
--인원수 기준 내림차순 정렬하세요. --사람이 없는 부서는 출력하지 뽑지 않습니다.

select  d.department_id,
        d.department_name,
        d.manager_id,
        인원수
from departments d
left outer join(select department_id, 
                       count(*)as 인원수 
                from employees 
                group by department_id) e
on d.department_id = e.department_id
where 인원수 is not null
order by 인원수 desc;

--문제 15 --부서에 대한 정보 전부와, 주소, 우편번호, 부서별 평균 연봉을 구해서 출력하세요 --부서별 평균이 없으면 0으로 출력하세요
select * from departments;

select  d.department_id,
        d.department_name,
        d.manager_id,
        d.location_id,
        l.street_address,
        l.postal_code,
        nvl(평균,0)
from departments d
left outer join(select department_id,
                      trunc(avg(salary))as 평균 
                from employees 
                group by department_id) e
on d.department_id = e.department_id
left outer join locations l
on d.location_id = l.location_id;


--문제 16 -문제 15결과에 대해 DEPARTMENT_ID기준으로 내림차순 정렬해서 ROWNUM을 붙여 1-10데이터 까지만 출력하세요

select rn,
       부서아이디,
       부서명,
       메니저아이디,
       지역아이디,
       주소,
       우편번호,
       평균
from(select 
       rownum rn,
       department_id as 부서아이디,
       department_name as 부서명,
       manager_id as 메니저아이디,
       location_id as 지역아이디,
       street_address as 주소,
       postal_code as 우편번호,
       평균
from(select  d.department_id,
             d.department_name,
             d.manager_id,
             d.location_id,
             l.street_address,
             l.postal_code,
             nvl(평균,0) as 평균
from departments d
left outer join(select department_id,
                      trunc(avg(salary))as 평균 
                from employees 
                group by department_id) e
                on d.department_id = e.department_id
left outer join locations l
on d.location_id = l.location_id
order by department_id desc))
where rn>=1 and rn<=10;
