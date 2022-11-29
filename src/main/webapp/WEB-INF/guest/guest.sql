show tables;

create table guest (
	idx int not null auto_increment primary key,	/* 고유번호 */
	name varchar(20) not null,					/* 방문자 성명 */
	email varchar(60),									/* 이메일 주소 (써도 되고 안써도 됨 낫널 뺀다) */
	homePage varchar(60),								/* 홈페이지 주소 */
	visitDate datetime default now(),		/* 방문일자 */
	hostIP varchar(50) not null,				/* 방문자 IP */
	content text not null								/* 방문소감 */
);

desc guest;

insert into guest values (default, '관리자', 'u_u2222@naver.com', 'http://naver.com', default, '192.168.50.250', '방명록 서비스를 개시합니다');

select * from guest;