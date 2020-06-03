--���������� �����ϴ� ��(������)
--������ �˻�
select * from user_sequences;

create sequence dept2_seq;--�ڵ�����
--������ ����
drop sequence dept2_seq;

--������ ���
create sequence dept2_seq
    increment by 1
    start with 1
    MAXVALUE 10    
    NOCYCLE
    NOCACHE;

drop table dept2;
create table dept2(
    dept_no number(2,0) CONSTRAINT dept_no_pk Primary key,
    dept_name varchar2(14),
    loca varchar(13),
    dept_date date
);
select * from dept2;
--�������� nextval ���� 10�� �����ϸ� error�� �߻���Ŵ.
insert into dept2(dept_no,dept_name, loca, dept_date) values(dept2_Seq.nextval,'test','test',sysdate);
--������ ���簪
select dept2_seq.currval from dual; --������ ���簪�� max���� �����Ͽ� ���̻� ������ �ȵ�

-- ������ ���� alter
alter sequence dept2_seq maxvalue 99999; --�ִ밪 99999�� ����
alter sequence dept2_seq increment by 100;

-- sequence ���� �ٽ� ó������ ������ ���
select dept2_seq.currval from dual;
alter sequence dept2_seq increment by -121;
select dept2_seq.nextval from dual;
select dept2_seq.currval from dual;
alter sequence dept2_seq increment by 1;

--PK�� ���� 20200506-������ ��
create table dept3(
    dept_no varchar(30) CONSTRAINT dept3_no_pk Primary key,
    dept_name varchar2(14)
);
drop table dept3;
create sequence dept3_seq
    increment by 1
    start with 1
    MAXVALUE 10    
    NOCYCLE
    NOCACHE;

insert into dept3(dept_no,dept_name) values(DEPT3_SEQ.nextval,concat(concat(to_char(sysdate),'-'),to_char(dept3_seq.currval)));
select * from dept3;

alter sequence dept3_seq increment by -1;
select dept3_seq.nextval from dual;
select dept3_seq.currval from dual;
alter sequence dept3_seq increment by 1;

drop table depts;
drop table dept2;
drop table dept3;
drop table emps;
drop table jobs_it;
drop table members;
drop sequence dept2_seq;
drop sequence dept3_seq;