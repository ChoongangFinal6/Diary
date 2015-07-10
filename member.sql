drop table diaryMember;
CREATE TABLE diaryMember (
	Memail VARCHAR2(50) primary key,
	Mname VARCHAR2(20) NOT NULL,
	Mpass VARCHAR2(20) NOT NULL
);

SELECT * FROM diaryMember;
DELETE diaryMember;