--형변환 함수 to_char, to_date, to_number

--날짜 -> 문자
select to_char(sysdate) from dual;
select to_char(sysdate, 'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate, 'YY-MM-DD PM HH:MI:SS') from dual;

select to_char(hire_date, 'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YYYY"년"-MM"월"-DD"일"') from employees; --특정 문자는 " "묶습니다

--숫자 -> 문자
select to_char(20000, '99999') from dual;
select to_char(20000, '9999') from dual; --자리수 부족
select to_char(20000.21, '99999') from dual;
select to_char(20000.21, '99999.99') from dual; -- .은 소수점을 나타낸다
select to_char(20000, '999,99') from dual; --, 는 콤마의 표현 형식
select salary from employees;
select to_char(salary, '$999,999') as salary from employees; 

--문자 -> 숫자 to_number
select '2000' + 2000 from dual; --자동형변환
select to_number('2000') + 2000 from dual; --명시적형변환

select '$3,300' + 2000 from dual; -- 에러
select to_number('$3,300', '$9,999') + 2000 from dual; --숫자 fmt를 사용해서 명시적 형변환

--문자 -> 날짜 to_date

select to_date('2020/01/31') + 7 from dual; --날짜형변환
select to_date('2020-01-31') + 7 from dual; --날짜형변환
select to_date('2020-02-03', 'YY/MM/DD') from dual;
select to_date('2020-03-03 12:23:03', 'YY/MM/DD HH:MI:SS') from dual; --날짜 fmt를 사용해서 명시적 형변환

--NULL제거 NVL, NVL2 ★
--NVL(컬럼, NULL일경우 변환할값)

select null from dual;
select NVL(null, 0) from dual;
select first_name, salary, commission_pct from employees;
select first_name, salary, NVL(commission_pct, 0) as commission_pct from employees; 

--NVL(컬럼, NULL이 아닐경우값, NULL일경우값) ★
select NVL2(null, '널이 아닙니다', '널입니다') from dual;
select first_name, NVL2(commission_pct, 'true', 'false') from employees;
select first_name, NVL2(commission_pct, salary + salary * commission_pct, salary) as 급여 from employees;

--DECODE  ★ (else if문)
select DECODE('C', 'A', 'A입니다',
                   'B', 'B입니다',
                   'C', 'C입니다',
                        '전부아닙니다'
              ) as result
from dual;

select * from employees;
select first_name, job_id, salary,
       DECODE(job_id, 'IT_PROG', salary * 1.1,
                      'FI_MGR', salary * 1.2,
                      'FI_ACCOUNT', salary * 1.3,
                      'AD_VP', salary * 1.4,
                               salary
              ) as result
from employees;              

--case when then end
select first_name, job_id, salary,
       (case job_id when 'IT_PROG' then salary * 1.1
                   when 'FI_MGR' then salary * 1.2
                   when 'FI_ACCOUNT' then salary * 1.3
                   when 'AD_VP' then salary * 1.4
                   else salary
       END) as result
from employees;       

-----------------------------------------------------------------------------------
--연습문제 1
select employee_id as 사원번호,
       concat(first_name, last_name) as 사원명,
       hire_date as 입사일자,
       trunc( (sysdate - hire_date)/365 ) as 근속년수
from employees
where (sysdate - hire_date)/365 >= 10
order by 근속년수 desc;
                
--연습문제
select first_name,
       manager_id,
       DECODE(manager_id, 100, '사원',
                         120, '주임',
                         121, '대리',
                         122, '과장',
                              '임원') as 직급
from employees
where department_id = 50;










