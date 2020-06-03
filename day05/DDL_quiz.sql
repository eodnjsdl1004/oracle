--문제 1.다음과 같은 테이블을 생성하고 데이터를 insert하세요 (커밋)
--M_NAME M_NUM REG_DATE GENDER LOCA 
--AAA 1 2018-07-01M 1800 
--BBB 2 2018-07-02F 1900 
--CCC 3 2018-07-03M 2000 
--DDD 4오늘날짜 M 2000

drop table member;

create table members (
    M_NAME varchar2(14) constraint member_MNAME_ck  not null,
    M_NUM number(2,0)constraint member_MNUM_pk primary key,
    REG_DATE date constraint member_REGDATE_ck not null constraint member_REGDATE_uk unique,
    GENDER varchar2(1) CONSTRAINT member_gender_ck CHECK (GENDER in ('F','M')),
    LOCA number (4,0) CONSTRAINT member_LOCA_fk REFERENCES locations(location_id)
);
desc member;

insert into members values('AAA', 1, '2018/07/01', 'M',1800);
insert into members values('BBB', 2, '2018/07/02', 'F',1900);
insert into members values('CCC', 3, '2018/07/03', 'M',2000);
insert into members values('DDD', 4, sysdate, 'M',2000);

--조건) M_NAME 는 가변문자형, 널값을 허용하지 않음 
--조건) M_NUM 은 숫자형, 이름(mem_memnum_pk) primary key 
--조건) REG_DATE 는 날짜형, 널값을 허용하지 않음, 이름:(mem_regdate_uk) UNIQUE키 
--조건) GENDER 가변문자형 
--조건) LOCA 숫자형, 이름:(mem_loca_loc_locid_fk) foreign key ? 참조 locations테이블(location_id)

--문제 2. MEMBERS테이블과 LOCATIONS테이블을 INNER JOIN 하고 m_name, m_mum, street_address, location_id 컬럼만 조회 m_num기준으로 오름차순 조회
select m.m_name,
       m.m_num,
       l.street_address,
       l.location_id
from members m
join locations l
on m.loca = l.location_id
order by m.m_num;

drop table member;
--마우스로 클릭해서 만들때 foreign key는 형식까지 똑같이 맞춰서 만들어야 한다.