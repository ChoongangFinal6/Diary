create table food(
foodCode number(10) not null primary key,
typeCode number(10) not null,
kindCode number(10) not null,
foodName varchar2(10) not null,
foodImage varchar2(10)not null,
kcal number(10) not null,
amount varchar2(10) not null,
gram number(10) not null
);

drop table food;
select * from food; 

create table menu(
foodType varchar2(10) not null,
typeCode number(10) not null,
foodKind varchar2(10)not null,
kindCode varchar2(10)not null,
);



    