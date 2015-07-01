create table food(
foodCode number(10) not null primary key,
typeCode number(10) not null,
kindCode number(10) not null,
foodName varchar2(200) not null,
foodImage varchar2(200)not null,
kcal number(10) not null,
amount varchar2(100) not null,
gram number(10) not null
);

drop table food;
drop table menu;
select * from food; 
select * from menu; 
select count(*) from Menu;

create table menu(
foodType varchar2(10) not null,
typeCode number(10) not null,
foodKind varchar2(20)not null,
kindCode number(10)not null
);

select * from Menu where typeCode=10;

insert into menu values('한식',10,'국밥',11);
insert into menu values('한식',10,'볶음밥',12);
insert into menu values('한식',10,'도시락',13);
insert into menu values('한식',10,'덮밥',14);
insert into menu values('한식',10,'죽',15);

delete from menu where kindCode=12;
insert into menu values('중식',20,'밥류',21);
insert into menu values('중식',20,'면류',22);
insert into menu values('중식',20,'요리',23);

insert into menu values('일식',30,'회',31);
insert into menu values('일식',30,'면',32);
insert into menu values('일식',30,'밥',33);
insert into menu values('일식',30,'튀김',34);

insert into menu values('양식',40,'구이류',41);
insert into menu values('양식',40,'피자',41);
insert into menu values('양식',40,'파스타',41);
insert into menu values('양식',40,'샐로드.스프',41);
insert into menu values('양식',40,'기타',41);

insert into menu values('분식',50,'면.만두류',51);
insert into menu values('분식',50,'기타',52);
delete MENU 
insert into menu values('간식',60,'과일',61);
insert into menu values('간식',60,'과자',62);
insert into menu values('간식',60,'아이스크림',63);
insert into menu values('간식',60,'빵',64);
insert into menu values('간식',60,'기타',65);
    select nvl(max(foodcode),0 ) from Food where typeCode=10 and kindCode=15;
    
   	select nvl(max(foodCode),0 ) from Food where typeCode=10 and kindCode=11 