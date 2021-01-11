CREATE TABLE ANIMAL(
	NAME	NUMBER(4) PRIMARY KEY,
	AGE		VARCHAR2(100),
	GENDER	VARCHAR2(100)
);

--PK이름이 지정되지 않았으므로 이름이 랜덤이된다.
--SYS_C007155

DROP TABLE ANIMAL;

CREATE TABLE ANIMAL(
	NAME	NUMBER(4),
	AGE		VARCHAR2(100),
	GENDER	VARCHAR2(100),
	CONSTRAINT ANIMAL_PK PRIMARY KEY(NAME)
	--이렇게 하면 ANIMAL_PK 라는 이름을 줄 수 있다.
);

SELECT * FROM ANIMAL;

--컬럼 추가
ALTER TABLE ANIMAL
ADD(FOOD VARCHAR2(100));

SELECT * FROM ANIMAL;

--컬럼 수정
ALTER TABLE ANIMAL
MODIFY(GENDER CHAR(1));

SELECT * FROM ANIMAL;

--컬럼 삭제
ALTER TABLE ANIMAL
DROP(FOOD);
SELECT * FROM ANIMAL;

--제약조건
ALTER TABLE ANIMAL
DROP CONSTRAINT ANIMAL_PK;

ALTER TABLE ANIMAL
DROP CONSTRAINT ANIMAL_PK PRIMARY KEY(NAME);

--책 테이블 만들기
--ISBN(PK), 장르, 도서명, 저자, 출판사
CREATE TABLE BOOK(
	ISBN	NUMBER(3),
	장르		VARCHAR2(100),
	도서명	VARCHAR2(200),
	저자		VARCHAR2(100)
);

ALTER TABLE BOOK
MODIFY (ISBN VARCHAR2(10));

DROP TABLE BOOK;

SELECT * FROM BOOK;

ALTER TABLE BOOK
ADD CONSTRAINT BOOK_PK PRIMARY KEY(ISBN);

ALTER TABLE BOOK
ADD(출판사 VARCHAR2(100));

SELECT * FROM BOOK;

--예약어를 기능없이 사용하고 싶다면 ""로 묶어주어야 한다.
ALTER TABLE ANIMAL
ADD ("ADD" VARCHAR(100));


--컬럼 IN (값1, 값2, 값3,...) : 저 컬럼에 추가되는 값이
--뒤에오는 값들중에 있다면 참
--DEFAULT, CHECK 제약조건
--DEFAULT 기본값 : 값이 추가되지 않으면 기본값으로 설정
--CHECK(조건식) : 뒤에오는 조건식의 결과가 참이면 데이터 추가
--NOT NULL : 비어있으면 데이터 추가 불가능
--UNIQUE : 중복되는 값 (학번(PK),주민번호(UNIQUE))
CREATE TABLE STUDENT(
	ID		NUMBER(8),
	NAME	VARCHAR2(15)NOT NULL,--비어있으면 안됨
	MAJOR	VARCHAR2(100) DEFAULT '미정',
	GENDER	CHAR(1) CHECK(GENDER IN ('M','W')),
	BIRTH	DATE
);

ALTER TABLE STUDENT
ADD(AGE NUMBER(3) CHECK(AGE>=18));

SELECT * FROM STUDENT;

--테이블 이름 변경
ALTER TABLE STUDENT
RENAME TO STUDENT2;

SELECT * FROM STUDENT2;
--컬럼명 변경
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
 * 모델링
	추상적인 주제를 DB에 맞게 설계하는 것
----------	주제 : 꽃집-----------------------
	
1. 요구 분석
	꽃집(이름,색깔,가격,모양,꽃이름,화분 번호)

2. 개념적 설계(개념 모델링)
	꽃		화분
	----------------------------------------------	
	이름		화분번호
	색깔		색깔			
	가격		모양
			꽃이름		
3. 논리적 설계(논리 모델링)
	꽃			화분
	----------------------------------------------	
	이름(PK)		화분번호
	색깔(FK)		색깔(PK)		
	가격			모양
				이름(FK)
4. 물리적 설계(물리 모델링)
	상영관 이름 : VARCHAR2(200)
	좌석수 : NUMBER(3)
	...

5. 구현
 
 * 
 * 
 */
CREATE TABLE 꽃(
	이름	VARCHAR2(100) PRIMARY KEY,
	색깔 VARCHAR2(100),
	가격 NUMBER(5)
);
CREATE TABLE 화분(
	이름	VARCHAR2(100),
	화분모양 VARCHAR2(100),
	화분번호 NUMBER(5) PRIMARY KEY,
	CONSTRAINT 화분_FK FOREIGN KEY(이름) REFERENCES 꽃(이름)
);

----------	주제 : 수강신청-----------------------
/*	
1. 요구 분석
	수강신청(학번,ID,PW,과목,교수님,학점,남은인원수,정원)

2. 개념적 설계(개념 모델링)
	학생정보		신청			과목정보
	----------------------------------------------	
	학번			정원			과목			
	ID 			남은인원수		학점
	PW 			과목			교수님
				ID
3. 논리적 설계(논리 모델링)
	학생정보    >>	신청       <<	과목정보
	----------------------------------------------	
	학번			정원(FK)		과목(PK)			
	ID(PK)		남은인원수		학점
	PW 			과목			교수님
				ID(FK)
				
4. 물리적 설계(물리 모델링)
	학번 : VARCHAR2(20)
	ID : VARCHAR2(100)
	PW : VARCHAR2(50)
	과목 : VARCHAR2(100)
	교수님 : VARCHAR2(100)
	학점 : NUMBER(1)
	남은인원수 : NUMBER(3)
	정원 : NUMBER(3)
	...

5. 구현
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









