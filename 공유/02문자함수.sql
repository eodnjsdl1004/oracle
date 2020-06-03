--lower(소문자), initcap(앞글자만 대문자로) , upper(대문자)
select 'asdDEF' from dual;
select 'asdDEF', lower('asdDEF'), upper('asdDEF') from dual; 

select last_name, lower(last_name), upper(last_name), initcap(last_name) from employees;
select * from employees where lower(last_name) = 'abel';

--length(길이), instr(문자 찾기)
select 'abcdef' as example, length('abcdef'), instr('abcdef', 'b') from dual;
select first_name, length(first_name), instr(first_name, 'a') from employees;

--substr(문자열 자르기), concat(문자열 연결)
select 'abcdef' as example, substr('abcdef', 1, 3), concat('안녕', '하세요') from dual;
select first_name, substr(first_name, 1, 2), concat(first_name, last_name) from employees;

--LPAD, RPAD (좌 우측 지정문자열로 채우기)
select LPAD('abc', 10, '*') from dual;
select RPAD('abc', 10, '*') from dual;

--LTRIM, RTRIM, TRIM (공백제거)
select LTRIM('javascript_java', 'java') from dual; --좌측 제거
select RTRIM('javascript_java', 'java') from dual; --우측 제거
select TRIM('   java   ') from dual; --양 옆 공백을 제거

--replace(문자열)
select replace('my dream is a president', 'president', 'doctor') from dual;
select replace('my dream is a president', ' ', '') from dual;
select replace(  replace('my dream is a president', 'president', 'doctor') , ' ', '') from dual;
select replace(  concat('hello ', 'world'),' ' , '' ) from dual;



----------------------------------------------------------------------------------------------------
--문제 1
select 
    concat(first_name, last_name) as 이름,
    replace(hire_date, '/', '') as 입사일자 
from employees order by 이름 asc;

--문제2
select  concat( '(02)', substr(phone_number, 4, length(phone_number)) ) from employees;

--문제3
select  
    RPAD( substr(first_name, 1, 3), length(first_name) , '*' ) as name,
    LPAD( salary, 10, '*') as salary
from employees where lower(job_id) = 'it_prog';


