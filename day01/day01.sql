--sql������ ��Ƴ��� ����
CREATE TABLE TEST(
	DATA1	NUMBER(4),
	DATA2	VARCHAR2(100)
);
SELECT * FROM TEST;

--���̺� ����
DROP TABLE TEST;

--�ڵ��� ���̺�(�귣��, ����, ����)
--VARCHAR2�� ���̴� ����Ʈ ũ�⸦ ��Ÿ����.
--�ѱ� : 3����Ʈ / ��� ���� : 1����Ʈ
CREATE TABLE CAR(
	BRAND VARCHAR(100),
	COLOR VARCHAR(100),
	PRICE NUMBER(5)
);

SELECT * FROM CAR;