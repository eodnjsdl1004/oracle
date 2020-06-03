--lower (�ҹ���)  initcap(�ձ���) upper(�빮��)
select 'asdDEF' from dual; -- dual ��� Ȯ���ϴ� ���� ���̺�
select 'asdDEF', lower('asdDEF'), upper('asdDEF') from dual;

select last_name, lower(last_name), upper(last_name), initcap(last_name) from employees;
select * from employees where lower(last_name) = 'abel';

--length(����), instr(���ڿ� ã��)
select 'abcdef' as example, length ('abcdef'), instr('abcdef','b') from dual;
select first_name, length(first_name), instr(first_name,'a') from employees;

--substr(���ڿ� �ڸ���),  concat(���ڸ� ����)
select 'abcdef' as example, substr('abcdef',1,3), concat('�ȳ�','�ϼ���') from dual;
select first_name, substr(first_name,1,2), concat(first_name,last_name) from employees;

-- LPAD, RPAD �¿� ���� ���ڿ� ä���
select LPAD('abc',10,'*') from dual;
select RPAD('abc',10,'*') from dual;

-- LTRIM, RTRIM TRIM ��������
select Ltrim('JavaScript_Java','Java') from dual;
select Rtrim('JavaScript_Java','Java') from dual;
select trim('      Java      ') from dual;

-- replace ���ڿ� ��ü
select replace('my dream is a president', 'president', 'doctor') from dual;
select replace('my dream is a president', ' ', '') from dual;
select replace(replace('my dream is a president', 'president', 'doctor'),' ','') from dual;
select replace(concat('hello', 'world'), ' ', '') from dual;

--���� 1. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���. 
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�) 
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. �� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�) 
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. �� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
SELECT rpad(substr(first_name,1,3),length(first_name),'*') as ����̸�, lpad(salary,10,'*') as �޿� from employees where lower(job_id) ='it_prog';


--���� 1. EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�. 
--���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�. 
--���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
select first_name || ' ' || last_name as �̸�, replace(hire_date,'/','') as �Ի����� from employees order by �̸� asc;
--���� 2. EMPLOYEES ���̺� ���� phone_number�÷��� ###.###.####���·� ����Ǿ� �ִ� 
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
select phone_number from employees;
select replace(lpad(substr(phone_number,4,length(phone_number)),length(phone_number),'*'),'***','02') as �����ȣ from employees;
select concat('02',substr(phone_number,4,length(phone_number))) as �����ȣ from employees;

--���� 3. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���. 
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. �� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�) 
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. �� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
select rpad(substr(first_name,1,3),length(first_name),'*') as �̸�, lpad(salary,10,'*') as �޿� from employees where lower(job_id) = 'it_prog';



