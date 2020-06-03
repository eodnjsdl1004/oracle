--���̺� ����
create table dept(
    dept_no number(2),--number(2,0)
    dept_name varchar(14),
    loca varchar(13),
    dept_date date,
    dept_bonus number(10,0) -- �ι�°�� �Ҽ��� �ڸ���
);

desc dept;

insert into dept values(99,'����','����',sysdate,200000000);
select * from dept;

-- ���߰� (ADD)
alter table dept 
      add(
           dept_count number(3,0)
);

-- ���̸����� (rename column)
alter table dept rename column dept_count to emp_count;
desc dept;

--�� ���� modify
alter table dept modify(emp_count number(4));
desc dept;

--���콺 ���̺� ��Ŭ�� ������ ���� ���氡��

--�� ���� drop
alter table dept drop column emp_count;
desc dept;

--���̺� ���� drop table
drop table dept;
drop table dept cascade CONSTRAINTS; -- ��������

--���̺� ������ �������� --
-- ���̺� ������ �������� ( not null,unique,pk,fk,check)
--not null : null ��� x
--unique : �ߺ������Ͱ� �����°� ����
--pk : ���̺��� �����ĺ� �÷�
--fk : �ٸ����̺��� pk�� �����ϴ� �÷�
--check : ���ǵ� ���ĸ� �������� ���

create table dept2(
    dept_no number(2,0) constraint dept2_dept_no_pk primary key,
    dept_name varchar(14) not null,
    loca number(4,0)constraint dept2_loca_loc_locid_fk references locations (location_id),
    dept_date date constraint dept2_deptdate_uk unique,
    dept_bonus number(10,0),
    dept_gender varchar2(1) constraint dept2_deptgender_ck check(dept_gender in ('F','M'))
 );
 
 drop table dept2;
 --���̺� ���� �������� (��� �÷� ���� �Ŀ� ���������� �Ʒ����� �߰�)
 create table dept2(
     dept_no number(2,0),
     dept_name varchar2(14) not null,
     loca number (4,0),
     dept_date date,
     dept_bonus number(10,0),
     dept_gender varchar2(1),
     --���̺� ���� ���� ����
     CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
     CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
     CONSTRAINT dept2_deptdate UNIQUE (dept_date),
     CONSTRAINT dept2_deptgender_ck CHECK (dept_gender in ('F','M'))
 );
 -- foreign key �� �θ����̺� ������ �Ұ���.
 insert into dept2 values(10,'gg',3300,sysdate,123123,'F');
 insert into dept2 values(11,'gg',3100,sysdate,123123,'M');
 drop table dept2;
 -- �������� �߰� ����
 create table dept2(
     dept_no number(2,0),
     dept_name varchar2(14) not null,
     loca number (4,0),
     dept_date date,
     dept_bonus number(10,0),
     dept_gender varchar2(1) CHECK (dept_gender in ('F','M'))
     );
alter table dept2 add CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no); --PK�߰�
alter table dept2 add CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date); --UK�߰� 
alter table dept2 add CONSTRAINT dept2_loca_loc_locaid_fk FOREIGN KEY (loca) REFERENCES locations(location_id);

alter table dept2 drop constraint dept2_deptno_pk;
rollback;