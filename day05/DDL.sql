--테이블 생성
create table dept(
    dept_no number(2),--number(2,0)
    dept_name varchar(14),
    loca varchar(13),
    dept_date date,
    dept_bonus number(10,0) -- 두번째는 소수점 자리수
);

desc dept;

insert into dept values(99,'영업','서울',sysdate,200000000);
select * from dept;

-- 열추가 (ADD)
alter table dept 
      add(
           dept_count number(3,0)
);

-- 열이름수정 (rename column)
alter table dept rename column dept_count to emp_count;
desc dept;

--열 수정 modify
alter table dept modify(emp_count number(4));
desc dept;

--마우스 테이블 우클릭 편집을 통해 변경가능

--열 삭제 drop
alter table dept drop column emp_count;
desc dept;

--테이블 삭제 drop table
drop table dept;
drop table dept cascade CONSTRAINTS; -- 제약조건

--테이블 생성과 제약조건 --
-- 테이블 열레벨 제약조건 ( not null,unique,pk,fk,check)
--not null : null 허용 x
--unique : 중복데이터가 들어오는거 방지
--pk : 테이블의 고유식별 컬럼
--fk : 다른테이블의 pk를 저장하는 컬럼
--check : 정의된 형식만 들어오도록 허용

create table dept2(
    dept_no number(2,0) constraint dept2_dept_no_pk primary key,
    dept_name varchar(14) not null,
    loca number(4,0)constraint dept2_loca_loc_locid_fk references locations (location_id),
    dept_date date constraint dept2_deptdate_uk unique,
    dept_bonus number(10,0),
    dept_gender varchar2(1) constraint dept2_deptgender_ck check(dept_gender in ('F','M'))
 );
 
 drop table dept2;
 --테이블 레벨 제약조건 (모든 컬럼 선언 후에 제약조건을 아래에서 추가)
 create table dept2(
     dept_no number(2,0),
     dept_name varchar2(14) not null,
     loca number (4,0),
     dept_date date,
     dept_bonus number(10,0),
     dept_gender varchar2(1),
     --테이블 레벨 제약 조건
     CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no),
     CONSTRAINT dept2_loca_loc_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
     CONSTRAINT dept2_deptdate UNIQUE (dept_date),
     CONSTRAINT dept2_deptgender_ck CHECK (dept_gender in ('F','M'))
 );
 -- foreign key 가 부모테이블에 없으면 불가능.
 insert into dept2 values(10,'gg',3300,sysdate,123123,'F');
 insert into dept2 values(11,'gg',3100,sysdate,123123,'M');
 drop table dept2;
 -- 제약조건 추가 삭제
 create table dept2(
     dept_no number(2,0),
     dept_name varchar2(14) not null,
     loca number (4,0),
     dept_date date,
     dept_bonus number(10,0),
     dept_gender varchar2(1) CHECK (dept_gender in ('F','M'))
     );
alter table dept2 add CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no); --PK추가
alter table dept2 add CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date); --UK추가 
alter table dept2 add CONSTRAINT dept2_loca_loc_locaid_fk FOREIGN KEY (loca) REFERENCES locations(location_id);

alter table dept2 drop constraint dept2_deptno_pk;
rollback;