
-- test table
CREATE TABLE place (
	PCode NUMBER(10) PRIMARY KEY,	--	장소 코드(PK)
	PType VARCHAR2(20) NOT NULL,	-- 	장소 타입	
	PName VARCHAR2(30) NOT NULL,	--	장소 이름
	PImg VARCHAR2(100) NOT NULL,	--	장소 이미지
	PMapX NUMBER(20, 15) NOT NULL,	--	x좌표	
	PMapY NUMBER(20, 15) NOT NULL	--	y좌표	
)

SELECT * FROM place;
DROP TABLE place;
delete from place;

CREATE SEQUENCE pcode_seq START WITH 1 INCREMENT BY 1;

INSERT INTO place values (pcode_seq.nextval, '학교', '서울역삼초등학교', 'image1.jpg', 127.03098542194168, 37.49725576460605);
INSERT INTO place values (pcode_seq.nextval, '학원', '중앙정보처리학원', 'image2.jpg', 127.02845219806613, 37.49696807978383);
INSERT INTO place values (pcode_seq.nextval, '역', '양재역', 'image3.jpg', 127.03464361459156, 37.48474876494686);
DROP SEQUENCE pcode_seq;
SELECT * from pcode_seq;

CREATE TABLE TodayVisit(
	Dno NUMBER(10),		-- 다이어리 번호
	Mno NUMBER(10),		-- 회원 번호
	Pcode NUMBER(10) references place(Pcode), 		-- 장소 코드
	Tno NUMBER(10),		-- 간 순서
	Twork VARCHAR2(50), -- 장소 한일
	Ttime VARCHAR2(100),-- 장소 시간
	constraint todayVisit_pk primary key(
		Dno, 
		Mno, 
		Pcode,
		Tno
	)
)

select * from TODAYVISIT;

INSERT INTO TodayVisit values (2, 1, 5, 1, '공부하러 감', '09:00~18:00');
INSERT INTO TodayVisit values (2, 1, 6, 2, '친구 기다림', '18:30~19:00');
INSERT INTO TodayVisit values (2, 1, 7, 3, '집으로 가기 위해 역으로 감', '19:00~20:00');

CREATE SEQUENCE dnoVisit_seq START WITH 1 INCREMENT BY 1;
DROP SEQUENCE dno_seq;

delete TODAYVISIT;
drop table todayvisit;

CREATE TABLE place_Category {
	pCat1Name VARCHAR2(20),
	pCat1Code VARCHAR2(4),
	pCat2Name VARCHAR2(20),
	pCat2Code VARCHAR2(4)
}
