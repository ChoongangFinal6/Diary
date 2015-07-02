
-- diary table
CREATE TABLE Diary (
	Memail VARCHAR2(50),	-- 회원 이메일
	Dno NUMBER(10),
	Dtitle VARCHAR2(30),
	Dday VARCHAR2(20),
	Dcontent VARCHAR2(255),
	Dweather VARCHAR2(20),
	FoodList VARCHAR2(50),
	constraint diary_pk primary key(
		Memail,
		Dno
	)
)
select * from diary;
select max(dNo) from Diary where mEmail='ttt@choongang.com'
delete diary;
drop table diary;

insert into diary values ('ttt@choongang.com', 1, null, null, null, null, null)

-- test table
CREATE TABLE place (
	PName VARCHAR2(30) PRIMARY KEY,	--	장소 이름(PK)
	PType VARCHAR2(20) NOT NULL,	-- 	장소 타입	
	PImg VARCHAR2(100) NOT NULL,	--	장소 이미지
	PMapY NUMBER(20, 15) NOT NULL,	--	y좌표	
	PMapX NUMBER(20, 15) NOT NULL	--	x좌표	
)

SELECT * FROM place;
DROP TABLE place;

INSERT INTO place values ('서울역삼초등학교', '0403', 'image1.jpg', 37.49725576460605, 127.03098542194168);
INSERT INTO place values ('중앙정보처리학원', '0409', 'image2.jpg', 37.49696807978383, 127.02845219806613);
INSERT INTO place values ('양재역', '0101', 'image3.jpg', 37.48474876494686, 127.03464361459156);


CREATE TABLE TodayVisit(
	Memail VARCHAR2(50),		-- 회원 번호
	Dno NUMBER(10),		-- 다이어리 번호
	PName VARCHAR2(30) references place(PName), 		-- 장소 코드
	Twork VARCHAR2(50), 			-- 장소 한일
	Ttime VARCHAR2(100),			-- 장소 시간
	primary key(Memail,Dno,PName),
	foreign key(Memail, Dno) references Diary(Memail, Dno)
)

select * from TODAYVISIT;

drop table todayvisit;
delete TODAYVISIT;

CREATE TABLE place_Category {
	pCat1Name VARCHAR2(20),
	pCat1Code VARCHAR2(4),
	pCat2Name VARCHAR2(20),
	pCat2Code VARCHAR2(4)
}

