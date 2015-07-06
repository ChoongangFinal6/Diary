create table food(
foodCode number(10) not null,
typeCode number(10) not null,
kindCode number(10) not null,
foodName varchar2(200) not null,
foodImage varchar2(200) not null,
kcal number(10) not null,
amount varchar2(100) not null,
gram number(10) not null
);



	select distinct typecode from menu order by typecode;


insert into food values(1,10,11,'뼈해장국','BB.jpg',500,'1',490);
insert into food values(2,10,11,'콩나물국밥','a.jpg',500,'2',500);
insert into food values(3,10,11,'뼈해장국','a.jpg',500,'2',500);
insert into food values(4,10,11,'돼지국밥','a.jpg',500,'2',500);

delete from food where foodName='참치마요도시락';

insert into food values(1,10,13,'참치마요도시락','a.jpg',500,'2',500);
insert into food values(2,10,13,'국화도시락','a.jpg',500,'2',500);
insert into food values(3,10,13,'마당쇠도시락','a.jpg',500,'2',500);
insert into food values(4,10,13,'도련님도시락','a.jpg',500,'2',500);
insert into food values(1,10,12,'불고기볶은밥','a.jpg',500,'2',500);
insert into food values(2,10,12,'낚지볶은밥','a.jpg',500,'2',500);
insert into food values(3,10,12,'새우볶은밥','a.jpg',500,'2',500);
insert into food values(1,10,14,'계란덮밥','a.jpg',500,'2',500);
insert into food values(2,10,14,'돈까스덮밥','a.jpg',500,'2',500);
insert into food values(3,10,14,'참치덮밥','a.jpg',500,'2',500);
insert into food values(1,10,15,'팥죽','a.jpg',500,'2',500);
insert into food values(2,10,15,'호박죽','a.jpg',500,'2',500);
insert into food values(3,10,15,'전복','a.jpg',500,'2',500);


insert into food values(1,30,31,'광어회','a.jpg',500,'2',500);
insert into food values(2,30,31,'숭어회','a.jpg',500,'2',500);
insert into food values(3,30,31,'연어회','a.jpg',500,'2',500);
insert into food values(1,30,32,'나가사끼라면','a.jpg',500,'2',500);
insert into food values(2,30,32,'간장라면','a.jpg',500,'2',500);
insert into food values(3,30,32,'미소라면','a.jpg',500,'2',500);
insert into food values(1,30,34,'문어튀김','a.jpg',500,'2',500);
insert into food values(2,30,34,'오징어튀김','a.jpg',500,'2',500);
insert into food values(3,30,34,'새우튀김','a.jpg',500,'2',500);


insert into food values(1,40,41,'등심스테이크','a.jpg',500,'2',500);
insert into food values(2,40,41,'안심스테이크','a.jpg',500,'2',500);
insert into food values(3,40,41,'등스테이크','a.jpg',500,'2',500);
insert into food values(4,40,41,'생선스테이ㅋ','a.jpg',500,'2',500);

insert into food values(1,40,42,'시카고피자','a.jpg',500,'2',500);
insert into food values(2,40,42,'포테이토피자','a.jpg',500,'2',500);
insert into food values(3,40,42,'불고기피자','a.jpg',500,'2',500);
insert into food values(4,40,42,'갈릭피자','a.jpg',500,'2',500);

insert into food values(1,40,43,'까르보나','a.jpg',500,'2',500);
insert into food values(2,40,43,'봉골레','a.jpg',500,'2',500);
insert into food values(3,40,43,'루꼴라파스타','a.jpg',500,'2',500);

insert into food values(1,40,44,'브로콜리스프','a.jpg',500,'2',500);
insert into food values(2,40,44,'양송이스프','a.jpg',500,'2',500);
insert into food values(3,40,44,'시저샐러드','a.jpg',500,'2',500);
insert into food values(4,40,44,'연어샐러드','a.jpg',500,'2',500);




구이류	피자	파스타
샐로드.스프	기타
   select foodKind,kindCode from menu where foodType = '양식';


select distinct typeCode from menu order by typeCode;

select distinct foodType from menu  order by foodtype desc; 
where (foodType) in (select distinct typeCode from menu order by typeCode);
select foodkind from menu;
drop table food;
drop table menu;
select * from food; 
select * from menu; 
select count(*) from Menu;
select * from Food where kindCode=12;
create table menu(
foodType varchar2(10) not null,
typeCode number(10) not null,
foodKind varchar2(20)not null,
kindCode number(10)not null
);
	
select foodKind,kindCode from menu where foodType = '한식';	
select foodKind from menu where foodType = '한식';
select *from food where kindCode=11;
select * from food where kindCode; 
select nvl(max(foodCode),0 ) from Food where typeCode=10 and kindCode=#{kindCode}
select * from Menu where typeCode=10;
select foodKind from menu where foodType = '한식';


insert into menu values('한식',10,'국밥',11);
insert into menu values('한식',10,'볶음밥',12);
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

insert into menu values('양식',40,'구이류',41);
insert into menu values('양식',40,'피자',42);
insert into menu values('양식',40,'파스타',43);
insert into menu values('양식',40,'샐로드.스프',44);
insert into menu values('양식',40,'기타',45);

insert into menu values('분식',50,'면.만두류',51);
insert into menu values('분식',50,'기타',52);

insert into menu values('간식',60,'과일',61);
insert into menu values('간식',60,'과자',62);
insert into menu values('간식',60,'아이스크림',63);
insert into menu values('간식',60,'빵',64);
insert into menu values('간식',60,'기타',65);
    select nvl(max(foodcode),0 ) from Food where typeCode=10 and kindCode=15;
    
   	select nvl(max(foodCode),0 ) from Food where typeCode=10 and kindCode=11 