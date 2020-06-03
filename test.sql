##테이블 생성
create table members(
	id varchar(20) primary key not null,
    pw varchar(20) not null,
    name varchar(20) not null,
    email varchar(20)
);

select * from members;

##데이터 추가 insert
insert into members values('pg123','1234','황대원','pg@naver.com');
insert into members(id,pw,name) values('pg1234','1234','황대원');

insert into members values('pg321','1234','대원이','pg2@naver.com');
insert into members values('pg4321','1234','대원이','pg3@naver.com');
insert into members(id,pw,name) values('pg26','1234','대원');
insert into members(id,pw,name) values('pg33','1234','대원');
insert into members(id,pw,name) values('pg24','1234','대원');

##데이터 수정 update set whrere 조건절 필요
update members set email = 'pgpg@naver.com',pw='3333' where id='pg1234';

##데이터 삭제 delete from 
delete from members where id ='pg24';
select * from members;

##데이터 조회 select coulum명 from
select id, pw from members where id='pg33';
select * from members where name = '대원';
select * from members where name = '대원' and id ='pg33';
select * from members where name = '대원' or name ='대원이';
select * from members where pw in ('1234','3333');

##like 검색
select * from  members where name like '황%';
select * from  members where name like '%대원';
select * from  members where email like '%naver%';

##데이터 정렬 order by
select * from members where pw like '%1234%' order by id asc; ## 오름차순
select * from members where pw like '1234' order by name desc; ## 내림차순
select * from members where email like '%naver%' order by name asc, id desc;

##컬럼 alias
select id as '아이디' from members;
##데이터 개수 확인
select count(*) from members;
select sysdate() from dual;

##commit 확인
select @@autocommit;
set @@autocommit = false;
set @@autocommit = true;

delete from members where id = 'pg123';
select*from members where id = 'pg123';
rollback;


select * from members;