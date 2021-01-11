CREATE TABLE ANIMAL(
	NAME	NUMBER(4) PRIMARY KEY,
	AGE		VARCHAR2(100),
	GENDER	VARCHAR2(100)
);

--PK�̸��� �������� �ʾ����Ƿ� �̸��� �����̵ȴ�.
--SYS_C007155

DROP TABLE ANIMAL;

CREATE TABLE ANIMAL(
	NAME	NUMBER(4),
	AGE		VARCHAR2(100),
	GENDER	VARCHAR2(100),
	CONSTRAINT ANIMAL_PK PRIMARY KEY(NAME)
	--�̷��� �ϸ� ANIMAL_PK ��� �̸��� �� �� �ִ�.
);

SELECT * FROM ANIMAL;

--�÷� �߰�
ALTER TABLE ANIMAL
ADD(FOOD VARCHAR2(100));

SELECT * FROM ANIMAL;

--�÷� ����
ALTER TABLE ANIMAL
MODIFY(GENDER CHAR(1));

SELECT * FROM ANIMAL;

--�÷� ����
ALTER TABLE ANIMAL
DROP(FOOD);
SELECT * FROM ANIMAL;

--��������
ALTER TABLE ANIMAL
DROP CONSTRAINT ANIMAL_PK;

ALTER TABLE ANIMAL
DROP CONSTRAINT ANIMAL_PK PRIMARY KEY(NAME);

--å ���̺� �����
--ISBN(PK), �帣, ������, ����, ���ǻ�
CREATE TABLE BOOK(
	ISBN	NUMBER(3),
	�帣		VARCHAR2(100),
	������	VARCHAR2(200),
	����		VARCHAR2(100)
);

ALTER TABLE BOOK
MODIFY (ISBN VARCHAR2(10));

DROP TABLE BOOK;

SELECT * FROM BOOK;

ALTER TABLE BOOK
ADD CONSTRAINT BOOK_PK PRIMARY KEY(ISBN);

ALTER TABLE BOOK
ADD(���ǻ� VARCHAR2(100));

SELECT * FROM BOOK;

--���� ��ɾ��� ����ϰ� �ʹٸ� ""�� �����־�� �Ѵ�.
ALTER TABLE ANIMAL
ADD ("ADD" VARCHAR(100));


--�÷� IN (��1, ��2, ��3,...) : �� �÷��� �߰��Ǵ� ����
--�ڿ����� �����߿� �ִٸ� ��
--DEFAULT, CHECK ��������
--DEFAULT �⺻�� : ���� �߰����� ������ �⺻������ ����
--CHECK(���ǽ�) : �ڿ����� ���ǽ��� ����� ���̸� ������ �߰�
--NOT NULL : ��������� ������ �߰� �Ұ���
--UNIQUE : �ߺ��Ǵ� �� (�й�(PK),�ֹι�ȣ(UNIQUE))
CREATE TABLE STUDENT(
	ID		NUMBER(8),
	NAME	VARCHAR2(15)NOT NULL,--��������� �ȵ�
	MAJOR	VARCHAR2(100) DEFAULT '����',
	GENDER	CHAR(1) CHECK(GENDER IN ('M','W')),
	BIRTH	DATE
);

ALTER TABLE STUDENT
ADD(AGE NUMBER(3) CHECK(AGE>=18));

SELECT * FROM STUDENT;

--���̺� �̸� ����
ALTER TABLE STUDENT
RENAME TO STUDENT2;

SELECT * FROM STUDENT2;
--�÷��� ����
ALTER TABLE STUDENT2
RENAME COLUMN ID TO STUDENTNUM;

SELECT * FROM STUDENT2;

--FK
CREATE	TABLE TEST_A(
	A VARCHAR2(20) PRIMARY KEY,
	B VARCHAR2(20),
	C VARCHAR2(20)
);

CREATE	TABLE TEST_B(
	D VARCHAR2(20) PRIMARY KEY,
	E VARCHAR2(20),
	A VARCHAR2(20),
	CONSTRAINT TEST_B_FK FOREIGN KEY(A) REFERENCES TEST_A(A)
);
------------------------------------------------------
/* 
 * �𵨸�
	�߻����� ������ DB�� �°� �����ϴ� ��
----------	���� : ����-----------------------
	
1. �䱸 �м�
	����(�̸�,����,����,���,���̸�,ȭ�� ��ȣ)

2. ������ ����(���� �𵨸�)
	��		ȭ��
	----------------------------------------------	
	�̸�		ȭ�й�ȣ
	����		����			
	����		���
			���̸�		
3. ���� ����(�� �𵨸�)
	��			ȭ��
	----------------------------------------------	
	�̸�(PK)		ȭ�й�ȣ
	����(FK)		����(PK)		
	����			���
				�̸�(FK)
4. ������ ����(���� �𵨸�)
	�󿵰� �̸� : VARCHAR2(200)
	�¼��� : NUMBER(3)
	...

5. ����
 
 * 
 * 
 */
CREATE TABLE ��(
	�̸�	VARCHAR2(100) PRIMARY KEY,
	���� VARCHAR2(100),
	���� NUMBER(5)
);
CREATE TABLE ȭ��(
	�̸�	VARCHAR2(100),
	ȭ�и�� VARCHAR2(100),
	ȭ�й�ȣ NUMBER(5) PRIMARY KEY,
	CONSTRAINT ȭ��_FK FOREIGN KEY(�̸�) REFERENCES ��(�̸�)
);

----------	���� : ������û-----------------------
/*	
1. �䱸 �м�
	������û(�й�,ID,PW,����,������,����,�����ο���,����)

2. ������ ����(���� �𵨸�)
	�л�����		��û			��������
	----------------------------------------------	
	�й�			����			����			
	ID 			�����ο���		����
	PW 			����			������
				ID
3. ���� ����(�� �𵨸�)
	�л�����    >>	��û       <<	��������
	----------------------------------------------	
	�й�			����(FK)		����(PK)			
	ID(PK)		�����ο���		����
	PW 			����			������
				ID(FK)
				
4. ������ ����(���� �𵨸�)
	�й� : VARCHAR2(20)
	ID : VARCHAR2(100)
	PW : VARCHAR2(50)
	���� : VARCHAR2(100)
	������ : VARCHAR2(100)
	���� : NUMBER(1)
	�����ο��� : NUMBER(3)
	���� : NUMBER(3)
	...

5. ����
 */
CREATE TABLE STUD(
	STUD_NUM	VARCHAR2(20),
	ID			VARCHAR2(100),
	PW			VARCHAR2(50),
	CONSTRAINT STUD_PK PRIMARY KEY(ID)
);

CREATE TABLE SUBJECT(
	SUB			VARCHAR2(100) PRIMARY KEY,
	GRADE		NUMBER(1),
	PROF		VARCHAR2(100)
);

CREATE TABLE SUBMIT(
	LIMIT_NUM NUMBER(3) PRIMARY KEY,
	NOW_LIMIT_NUM NUMBER(3),
	SUB VARCHAR2(100),
	ID VARCHAR2(100),
	CONSTRAINT ID_FK FOREIGN KEY(ID) REFERENCES STUD(ID),
	CONSTRAINT SUB_FK FOREIGN KEY(SUB) REFERENCES SUBJECT(SUB)
);
SELECT * FROM STUD;
SELECT * FROM SUBJECT;
SELECT * FROM SUBMIT;









