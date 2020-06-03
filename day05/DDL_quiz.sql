--���� 1.������ ���� ���̺��� �����ϰ� �����͸� insert�ϼ��� (Ŀ��)
--M_NAME M_NUM REG_DATE GENDER LOCA 
--AAA 1 2018-07-01M 1800 
--BBB 2 2018-07-02F 1900 
--CCC 3 2018-07-03M 2000 
--DDD 4���ó�¥ M 2000

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

--����) M_NAME �� ����������, �ΰ��� ������� ���� 
--����) M_NUM �� ������, �̸�(mem_memnum_pk) primary key 
--����) REG_DATE �� ��¥��, �ΰ��� ������� ����, �̸�:(mem_regdate_uk) UNIQUEŰ 
--����) GENDER ���������� 
--����) LOCA ������, �̸�:(mem_loca_loc_locid_fk) foreign key ? ���� locations���̺�(location_id)

--���� 2. MEMBERS���̺�� LOCATIONS���̺��� INNER JOIN �ϰ� m_name, m_mum, street_address, location_id �÷��� ��ȸ m_num�������� �������� ��ȸ
select m.m_name,
       m.m_num,
       l.street_address,
       l.location_id
from members m
join locations l
on m.loca = l.location_id
order by m.m_num;

drop table member;
--���콺�� Ŭ���ؼ� ���鶧 foreign key�� ���ı��� �Ȱ��� ���缭 ������ �Ѵ�.