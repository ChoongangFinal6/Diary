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

select * from TODAYVISIT order by pcode;
delete TODAYVISIT;
drop table todayvisit;

INSERT INTO TodayVisit values (2, 93371, 5, 1, '공부하러 감', '09:00~18:00');
INSERT INTO TodayVisit values (2, 93371, 6, 2, '친구 기다림', '18:30~19:00');
INSERT INTO TodayVisit values (2, 93371, 7, 3, '집으로 가기 위해 역으로 감', '19:00~20:00');






