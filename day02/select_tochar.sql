--����ȯ �Լ� to char, to date, to number
-- ��¥-> ���� to_char
select to_char(sysdate) from dual;
select to_char(sysdate,'YYYY-MM-DD HH:MI:SS') from dual;
select to_char(sysdate,'YY-MM-DD HH:MI:SS') from dual;

select to_char(hire_date,'YYYY-MM-DD HH:MI:SS') from employees;
select to_char(hire_date, 'YYYY"��" MM"��" DD"��"') from employees;

-- ���� -> ���� to_char
select to_char(20000,'99999')||to_char(1000,'$99999')from dual;
select to_char(20000,'9999') from dual; --�ڸ��� ����
select to_char(20000.21,'99999')from dual;--�Ҽ��� �ڸ� ǥ��������
select to_char(20000.21,'99999.99')from dual;--�Ҽ��� �ڸ� ǥ����� [.]
select to_char(20000,'99,999')from dual;-- [,]�� ǥ�������ϻ� �ǹ� ����

select salary from employees;
select to_char(salary,'$999,999') from employees;

--  ���� -> ���� to_number
select '2000' +2000 from dual;
SELECT to_number('2000')+2000 from dual;

select '$3,300' +2000 from dual; -- �޷���� ���ڿ� ������ ����ȯ�� ���־������ �ȴ�
select to_number('$3,300','$9,999') +2000 from dual; -- ���� fmt�� ����ؼ� ����� ����ȯ

--���� -> ��¥ to_date
select to_date('2020/01/31') from dual;
select to_date('2020-01-31') +7 from dual;
select to_date('2020-02-03', 'YY/MM/DD')from dual;
select to_date('2020-03-03 09:35:33', 'YY/MM/DD HH:MI:SS')from dual;
select first_name, hire_date from employees where hire_date = to_date('2003/06/17','YYYY-MM-DD');

-- lastdate ������ ��¥
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



