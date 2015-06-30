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

CREATE TABLE place_Category {
	pCat1Name VARCHAR2(20),
	pCat1Code VARCHAR2(4),
	pCat2Name VARCHAR2(20),
	pCat2Code VARCHAR2(4)
}
