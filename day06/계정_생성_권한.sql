--��������
create user DAEWON
IDENTIFIED by dw1728;

select * from all_users;
--���� �ο�
grant resource, connect to DAEWON;

grant create session, create table, create sequence, create view, create procedure to DAEWON;
--���̺� �����̽� ����
alter user DAEWON default tablespace users quota unlimited on users;
--���� ����
drop user DAEWON;
--���콺�� ������ �빮�ڷ� ��������.

CREATE TABLESPACE MYWEB
DATAFILE 'd:/course/space/MYWEB.dbf' SIZE 500M
DEFAULT STORAGE(
    INITIAL 50K
    NEXT 50K
    MINEXTENTS 10
    MAXEXTENTS 50
    PCTINCREASE 0);

