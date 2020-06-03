--계정생성
create user DAEWON
IDENTIFIED by dw1728;

select * from all_users;
--권한 부여
grant resource, connect to DAEWON;

grant create session, create table, create sequence, create view, create procedure to DAEWON;
--테이블 스페이스 지정
alter user DAEWON default tablespace users quota unlimited on users;
--계정 삭제
drop user DAEWON;
--마우스로 만들경우 대문자로 만들어야함.

CREATE TABLESPACE MYWEB
DATAFILE 'd:/course/space/MYWEB.dbf' SIZE 500M
DEFAULT STORAGE(
    INITIAL 50K
    NEXT 50K
    MINEXTENTS 10
    MAXEXTENTS 50
    PCTINCREASE 0);

