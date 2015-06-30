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
	pCat1Name VARCHAR2(30),
	pCat2Code VARCHAR2(4),
	pCat2Name VARCHAR2(30)
)


SELECT * FROM place_Category;
DROP TABLE place_Category;
DELETE FROM place_Category
select pCat2Code, pCat2Name from place_Category where pCat1Code='11'





INSERT INTO place_Category values('01', '교통시설'	, '01', '지하철');
INSERT INTO place_Category values('01', '교통시설'	, '02', '버스');
INSERT INTO place_Category values('01', '교통시설'	, '03', '기차');
INSERT INTO place_Category values('01', '교통시설'	, '00', '기타');

INSERT INTO place_Category values('02', '카페'	, '01', '카페');
INSERT INTO place_Category values('02', '카페'	, '02', '제과점');
INSERT INTO place_Category values('02', '카페'	, '03', '아이스크림');
INSERT INTO place_Category values('02', '카페'	, '00', '기타');

INSERT INTO place_Category values('03', '병원,의료', '01', '보건소');
INSERT INTO place_Category values('03', '병원,의료', '02', '종합병원');
INSERT INTO place_Category values('03', '병원,의료', '03', '개인병원');
INSERT INTO place_Category values('03', '병원,의료', '04', '한의원');
INSERT INTO place_Category values('03', '병원,의료', '05', '약국');
INSERT INTO place_Category values('03', '병원,의료', '00', '기타');

INSERT INTO place_Category values('04', '관공서'	, '01', '주민센터');
INSERT INTO place_Category values('04', '관공서'	, '02', '시청,구청');
INSERT INTO place_Category values('04', '관공서'	, '00', '기타');

INSERT INTO place_Category values('05', '쇼핑,마트', '01', '백화점');
INSERT INTO place_Category values('05', '쇼핑,마트', '02', '대형마트');
INSERT INTO place_Category values('05', '쇼핑,마트', '03', '전통시장');
INSERT INTO place_Category values('05', '쇼핑,마트', '04', '면세점');
INSERT INTO place_Category values('05', '쇼핑,마트', '05', '전문매장');
INSERT INTO place_Category values('05', '쇼핑,마트', '06', '슈퍼,편의점');
INSERT INTO place_Category values('05', '쇼핑,마트', '00', '기타');

INSERT INTO place_Category values('06', '생활,편의', '01', '주차장');
INSERT INTO place_Category values('06', '생활,편의', '02', '꽃집');
INSERT INTO place_Category values('06', '생활,편의', '00', '기타');

INSERT INTO place_Category values('07', '스포츠시설', '01', '헬스');
INSERT INTO place_Category values('07', '스포츠시설', '02', '경기장');
INSERT INTO place_Category values('07', '스포츠시설', '03', '골프장');
INSERT INTO place_Category values('07', '스포츠시설', '00', '기타');

INSERT INTO place_Category values('08', '음식점'	, '01', '한식');
INSERT INTO place_Category values('08', '음식점'	, '02', '일식');
INSERT INTO place_Category values('08', '음식점'	, '03', '양식');
INSERT INTO place_Category values('08', '음식점'	, '04', '아시안');
INSERT INTO place_Category values('08', '음식점'	, '05', '패밀리레스토랑');
INSERT INTO place_Category values('08', '음식점'	, '06', '분식');
INSERT INTO place_Category values('08', '음식점'	, '07', '패스트푸드');
INSERT INTO place_Category values('08', '음식점'	, '08', '피자');
INSERT INTO place_Category values('08', '음식점'	, '09', '치킨');
INSERT INTO place_Category values('08', '음식점'	, '10', '주점');
INSERT INTO place_Category values('08', '음식점'	, '00', '기타');

INSERT INTO place_Category values('09', '숙박'	, '01', '호텔');
INSERT INTO place_Category values('09', '숙박'	, '02', '리조트,콘도');
INSERT INTO place_Category values('09', '숙박'	, '03', '펜션,민박');
INSERT INTO place_Category values('09', '숙박'	, '04', '모텔');
INSERT INTO place_Category values('09', '숙박'	, '05', '게스트하우스');
INSERT INTO place_Category values('09', '숙박'	, '06', '캠핑');
INSERT INTO place_Category values('09', '숙박'	, '00', '기타');

INSERT INTO place_Category values('10', '문화'	, '01', '영화');	
INSERT INTO place_Category values('10', '문화'	, '02', '공연');
INSERT INTO place_Category values('10', '문화'	, '03', '미술관');
INSERT INTO place_Category values('10', '문화'	, '04', '박물관');
INSERT INTO place_Category values('10', '문화'	, '00', '기타');

INSERT INTO place_Category values('11', '관광'	, '01', '역사관광지');
INSERT INTO place_Category values('11', '관광'	, '02', '휴향관광지');
INSERT INTO place_Category values('11', '관광'	, '03', '건축.조형물');
INSERT INTO place_Category values('11', '관광'	, '00', '기타');

INSERT INTO place_Category values('00', '기타'	, '00', '기타');




