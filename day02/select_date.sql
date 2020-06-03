--숫자함수 round(올림), trunc(절삭)
select 45.123 from dual;
select round(45.123,1),round(45.123),round(45.123,0),round(45.123,-1) from dual;
--숫자함수 trunch(내림)
select trunc(45.123,1), trunc(45.123), trunc(45.123,0), trunc(45.123,-1) from dual;

SELECT ceil(34.1) from dual; -- 올림
SELECT floor(34.9) from dual; -- 내림

--날짜
select sysdate from dual;
select systimestamp from dual;
select sysdate -17 from dual;
select sysdate - hire_date from employees;

select first_name,hire_date,(sysdate-hire_date)/7 from employees;
select first_name,hire_date,(sysdate-hire_date)/12 from employees;
select first_name,hire_date,(sysdate-hire_date)/365 from employees;

--round, trunc 날짜에 적용
select round(sysdate) from dual;
select round(sysdate, 'year') from dual; -- -> 년기준으로 반올림
select round(sysdate, 'month') from dual; -- -> 월기준으로 반올림
select round(sysdate,'day') from dual; -- -> 일요일 기준으로 반올림

select trunc(sysdate) from dual;
select trunc(sysdate,'year') from dual; -- -> 년기준으로 내림
select trunc(sysdate,'month') from dual; -- -> 월기준으로 내림
select trunc(sysdate,'day') from dual; -- -> 일요일기준으로 내림