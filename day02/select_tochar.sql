--형변환 함수 to char, to date, to number
-- 날짜-> 문자 to_char
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate,'YY-MM-DD HH:MI:SS') from dual;

select to_char(hire_date,'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YYYY"년" MM"월" DD"일"') from employees;

-- 숫자 -> 문자 to_char
select to_char(20000,'99999')||to_char(1000,'$99999')from dual;
select to_char(20000,'9999') from dual; --자리수 부족
select to_char(20000.21,'99999')from dual;--소수점 자리 표현안해줌
select to_char(20000.21,'99999.99')from dual;--소수점 자리 표현방법 [.]
select to_char(20000,'99,999')from dual;-- [,]는 표현형식일뿐 의미 없다

select salary from employees;
select to_char(salary,'$999,999') from employees;

--  문자 -> 숫자 to_number
select '2000' +2000 from dual;
SELECT to_number('2000')+2000 from dual;

select '$3,300' +2000 from dual; -- 달러라는 문자열 때문에 형변환을 해주어야지만 된다
select to_number('$3,300','$9,999') +2000 from dual; -- 숫자 fmt를 사용해서 명시적 형변환

--문자 -> 날짜 to_date
select to_date('2020/01/31') from dual;
select to_date('2020-01-31') +7 from dual;
select to_date('2020-02-03', 'YY/MM/DD')from dual;
select to_date('2020-03-03 09:35:33', 'YY/MM/DD HH:MI:SS')from dual;
select first_name, hire_date from employees where hire_date = to_date('2003/06/17','YYYY-MM-DD');

-- lastdate 마지막 날짜
select
to_char(Last_day(to_date('01','MM')),'dd') as "1",
to_char(Last_day(to_date('02','MM')),'dd') as "2",
to_char(Last_day(to_date('03','MM')),'dd') as "3",
to_char(Last_day(to_date('04','MM')),'dd') as "4",
to_char(Last_day(to_date('05','MM')),'dd') as "5",
to_char(Last_day(to_date('06','MM')),'dd') as "6",
to_char(Last_day(to_date('07','MM')),'dd') as "7",
to_char(Last_day(to_date('08','MM')),'dd') as "8",
to_char(Last_day(to_date('09','MM')),'dd') as "9",
to_char(Last_day(to_date('10','MM')),'dd') as "10",
to_char(Last_day(to_date('11','MM')),'dd') as "11",
to_char(Last_day(to_date('12','MM')),'dd') as "12"
from dual;



