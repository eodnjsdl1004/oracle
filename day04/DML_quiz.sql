--���� 1. DEPTS���̺��� ������ �߰��ϼ���
--DEPARTMENT_ID DEPARTMENT_NAME MANAGER_ID LOCATION_ID 
--280���� null 1800 
--290ȸ��� null 1800 
--300���� 301 1800 
--310�λ� 302 1800 
--320���� 303 1700
drop table depts;
create table depts as select*from departments;
desc depts;
select * from depts;
insert into depts values(280,'����',null,1800);
insert into depts values(290,'ȸ��',null,1800);
insert into depts values(300,'����',301,1800);
insert into depts values(301,'�λ�',302,1800);
insert into depts values(320,'����',303,1700);
commit;
rollback;
--���� 2. DEPTS���̺��� �����͸� �����մϴ� 
--1. department_name �� IT Support �� �������� department_name�� IT bank�� ���� 
update depts set department_name = 'IT bank' where department_name = 'IT Support';

--2. department_id�� 290�� �������� manager_id�� 301�� ���� 
update depts set manager_id = 301 where department_id = 290;

--3. department_name�� IT Helpdesk�� �������� �μ����� IT Help�� , �Ŵ������̵� 303����, �������̵� 1800���� �����ϼ��� 
update depts set department_name = 'IT Help', manager_id = 303, LOCATION_ID = 1800  where department_name = 'IT Helpdesk';
commit; -- ���Ի������� �ѵڿ��� Ŀ���� ����� ������ �ȴ�.
--4. �̻�, ����, ����, �븮  �� �Ŵ������̵� 301�� �ѹ��� �����ϼ���.
update depts set manager_id = 301 where department_name in('����','����','�λ�','����');
commit;


--���� 3. ������ ������ �׻� primary key�� �մϴ�, ���⼭ primary key�� department_id��� �����մϴ�. 
--1. �μ��� �����θ� ���� �ϼ��� 2. �μ��� NOC�� �����ϼ���
delete from depts where department_id = 320;
delete from depts where department_id = 220;
commit;

--����4 1. Depts �纻���̺��� department_id �� 200���� ū �����͸� �����ϼ���.
delete from depts where department_id>200;
commit;
rollback;
--2. Depts �纻���̺��� manager_id�� null�� �ƴ� �������� manager_id�� ���� 100���� �����ϼ���. 
update depts set manager_id = 100 where manager_id is not null;
commit;
--3. Depts ���̺��� Ÿ�� ���̺� �Դϴ�. 
--4. Departments���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� Depts�� ���Ͽ� ��ġ�ϴ� ���
-- Depts�� �μ���, �Ŵ���ID, ����ID�� ������Ʈ �ϰ� �������Ե� �����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���.

merge into depts a --Ÿ�� ���̺�
        using (select * from departments) b --��ȸ�� ����
        on (a. department_id = b.department_id)
when matched then
    update set
    a.department_name = b.department_name,
    a.manager_id = b.manager_id,
    a.LOCATION_ID = b.LOCATION_ID
when not matched then
    insert values 
    (b.department_id,
     b.department_name,
     b.manager_id,
     b.LOCATION_ID);    



--���� 5
--1. jobs_it �纻 ���̺��� �����ϼ��� (������ min_salary�� 6000���� ū �����͸� �����մϴ�) 

select * from jobs;
create table jobs_it as (select * from jobs where min_salary>6000);
select * from jobs_it;
--2. jobs_it ���̺� ���� �����͸� �߰��ϼ���
insert into jobs_it values('IT_DEV', '����Ƽ������',6000,20000);
insert into jobs_it values('NET_DEV', '��Ʈ��ũ������',5000,20000);
insert into jobs_it values('SEC_DEV', '���Ȱ�����',6000,19000);

--JOB_ID JOB_TITLE MIN_SALARY MAX_SALARY 
--IT_DEV ����Ƽ������ 6000 20000 
--NET_DEV ��Ʈ��ũ������ 5000 20000 
--SEC_DEV ���Ȱ����� 6000 19000
--3.   jobs_it�� Ÿ�� ���̺� �Դϴ� 
--4.   jobs���̺��� �Ź� ������ �Ͼ�� ���̺��̶�� �����ϰ� jobs_it�� ���Ͽ� min_salary�÷��� 0���� ū ���
--������ �����ʹ� min_salary, max_salary�� ������Ʈ �ϰ� ���� ���Ե� �����ʹ� �״�� �߰����ִ� merge���� �ۼ��ϼ���

merge into jobs_it a
      using (select * from jobs where min_salary > 0) b
      on (a.job_id = b.job_id)
when matched then
     update set
     a.min_salary = b.min_salary,
     a.max_salary = b.max_salary
when not matched then
     insert values
     (b.job_id,
      b.JOB_TITLE,
      b.MIN_SALARY,
      b.MAX_SALARY);
commit;
select * from jobs_it;