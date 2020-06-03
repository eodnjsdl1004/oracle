-- null제거 nvl nvl2
--nvl (컬럼, null일경우 반환할 값)
select null from dual;
select nvl(null,0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, nvl(commission_pct,0) from employees;

--nvl2(컬럼, null이 아닐경우 반환할 값,null일 경우 반환할 값)
select nvl2(null,'null입니다','null이 아닙니다') from dual;
select first_name, nvl2(commission_pct,'true','false') from employees;
select first_name, nvl2(commission_pct, salary+salary*commission_pct,salary) as 급여 from employees;

--decode ★ else-if문
select decode('C','A', 'A입니다',
                  'B', 'B입니다',
                  'C', 'C입니다',
                        '전부 아닙니다.'
       )as result
from dual;
select * from employees;
select first_name, job_id, salary,
       decode(job_id, 'IT_PROG', salary*1.1,
                      'FI_MGR', salary*1.2,
                      'FI_ACCOUNT', salary*1.3,
                      'AD_VP', salary*1.4,
                                salary
                    ) as result
from employees;

-- case when then end
select first_name, job_id, salary,
       case job_id when 'IT_PROG' then salary*1.1
                   when 'FI_MGR' then salary*1.2
                   when 'FI_ACCOUNT' then salary*1.3
                   when 'AD_VP' then salary*1.4
                   else salary
      end as result
from employees;

--문제1. 현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 근속년수가 10년 이상인 사원을 근속년수가 높은 사원 순서대로
select employee_id as 사원번호,
       concat(first_name, last_name) as 사원명,
       hire_date as 입사일자,
       trunc((sysdate-hire_date)/365) as 근속년수 
from employees 
where (sysdate-hire_date)/365>=10 order by 근속년수 desc;

--문제2. EMPLOYEE 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다. 
--100이라면 ‘사원’, 120이라면 ‘주임’ 121이라면 ‘대리’ 122라면 ‘과장’ 나머지는 ‘임원’ 으로 출력합니다.
--조건 1) manager_id가 50인 사람들을 대상으로만 조회합니다
select * from employees;
select first_name, 
       manager_id, 
       decode(manager_id,100, '사원',
                         120, '주임',
                         121, '대리',
                         122, '과장',
                              '임원') as 직급 
from employees where department_id=50;


