--Ʈ�����
--Ŀ��Ȯ��
show autocommit;
--����Ŀ�� ��
set autocommit on;
set autocommit off;
delete from depts;
select * from depts;
rollback;

delete from depts where department_id = 10;
--���̺� ����Ʈ
SAVEPOINT delete_10;

delete from depts where department_id = 20;

rollback to savepoint delete_10;
rollback;
--Ŀ�� ���Ŀ��� � ������ε� �ǵ��� �� ����
commit;