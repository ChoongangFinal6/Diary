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

INSERT INTO place values (pcode_seq.nextval, 'ptype', 'pname', 'pimg', 12.1111, 13.4444 );


CREATE SEQUENCE pcode_seq START WITH 1 INCREMENT BY 1;
DROP SEQUENCE pcode_seq;
SELECT * from pcode_seq;

CREATE TABLE place_Category (
	pCat1Code VARCHAR2(4),
	pCat1Name VARCHAR2(20),
	pCat2Code VARCHAR2(4),
	pCat2Name VARCHAR2(20)
)

INSERT INTO place_Category values('01', '교통시설'		, '01', '지하철');
INSERT INTO place_Category values('02', '카페'		, '01', '카페');
INSERT INTO place_Category values('03', '병원,의료'	, '01', '보건소');
INSERT INTO place_Category values('04', '관공서'		, '01', '주민센터');
INSERT INTO place_Category values('05', '마트,슈퍼'	, '01', '대형마트');
INSERT INTO place_Category values('06', '생활,편의'	, '01', '주차장');
INSERT INTO place_Category values('07', '스포츠시설'	, '01', '헬스');
INSERT INTO place_Category values('08', '음식점'		, '01', '한식');
INSERT INTO place_Category values('09', '숙박'		, '01', '호텔');
INSERT INTO place_Category values('10', '은행'		, '01', '은행');
INSERT INTO place_Category values('11', '문화'		, '01', '영화');	-- 11 문화
INSERT INTO place_Category values('11', '문화'		, '02', '연극');
INSERT INTO place_Category values('12', '기타'		, '01', '기타');

SELECT * FROM place_Category;
DROP TABLE place_Category;

select pCat2Code, pCat2Name from place_Category where pCat1Code='11'









