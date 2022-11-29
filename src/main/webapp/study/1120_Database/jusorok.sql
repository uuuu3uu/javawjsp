show databases;
show tables;

select * from sungjuk;
select * from test1;

create table jusorok (
	idx int not null auto_increment primary key, /* 고유번호 */
	mid varchar(20) not null,				/* 아아디 */
	pwd varchar(20) not null,				/* 비밀번호 */
	name varchar(20) not null,			/* 이름 */
	point int default 100,					/* 방문포인트 */
	lastDate datetime default now() /* 최종방문날짜 */
);

desc jusorok;

insert into jusorok values (default, 'admin', '1234', '관리자', default, default);

select * from jusorok;


select * from jusorok where mid='yyy111' and pwd='1234';