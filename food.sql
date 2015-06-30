create table food(
foodCode number(10) not null primary key, -- 음식코드
typeCode number(10) not null, --타입코드
kindCode number(10) not null, --종류코드
foodName varchar2(10) not null, --음식이름
foodImage varchar2(10)not null, --음식 이미지
kcal number(10) not null, --칼로리
amount varchar2(10) not null, --음식양
gram number(10) not null --음식무게
);

drop table food;
select * from food; 

create table menu(
foodType varchar2(10) not null, --음식타입
typeCode number(10) not null, --타입코드
foodKind varchar2(10)not null, --음식종류
kindCode number(10)not null --종류코드
);

drop table menu;
select * from menu;

insert into menu values('한식',10,'국밥',11);
insert into menu values('한식',10,'볶은밥',12);
insert into menu values('한식',10,'도시락',13);
insert into menu values('한식',10,'덮밥',14);
insert into menu values('한식',10,'죽',15);


insert into menu values('중식',20,'밥류',21);
insert into menu values('중식',20,'면류',22);
insert into menu values('중식',20,'요리',23);

insert into menu values('일식',30,'회',31);
insert into menu values('일식',30,'면',32);
insert into menu values('일식',30,'밥',33);
insert into menu values('일식',30,'튀김',34);

insert into menu values('분식',40,'면_만두류',41);
insert into menu values('분식',40,'기타',42);

insert into menu values('간식',50,'과일',51);
insert into menu values('간식',50,'과자',52);
insert into menu values('간식',50,'아이스크림',53);
insert into menu values('간식',50,'빵',54);
insert into menu values('간식',50,'기타',55);


    