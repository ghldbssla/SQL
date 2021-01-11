--sql문들을 담아놓을 파일
CREATE TABLE TEST(
	DATA1	NUMBER(4),
	DATA2	VARCHAR2(100)
);
SELECT * FROM TEST;

--테이블 삭제
DROP TABLE TEST;

--자동차 테이블(브랜드, 색깔, 가격)
--VARCHAR2의 길이는 바이트 크기를 나타낸다.
--한글 : 3바이트 / 영어나 숫자 : 1바이트
CREATE TABLE CAR(
	BRAND VARCHAR(100),
	COLOR VARCHAR(100),
	PRICE NUMBER(5)
);

SELECT * FROM CAR;