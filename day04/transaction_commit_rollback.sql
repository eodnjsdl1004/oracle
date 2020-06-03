--트랜잭션
--커밋확인
show autocommit;
--오토커밋 온
set autocommit on;
set autocommit off;
delete from depts;
select * from depts;
rollback;

delete from depts where department_id = 10;
--세이브 포인트
SAVEPOINT delete_10;

delete from depts where department_id = 20;

rollback to savepoint delete_10;
rollback;
--커밋 이후에는 어떤 방법으로도 되돌릴 수 없음
commit;