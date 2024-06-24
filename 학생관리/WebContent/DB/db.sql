drop table TBL_TEACHER_202201;
drop table TBL_MEMBER_202201;
drop table TBL_CLASS_202201;

set lines 1000;
set pages 1000;

create table TBL_TEACHER_202201( 
	TEACHER_CODE CHAR(3) primary key, --강사코드
	TEACHER_NAME varchar2(15), --강사명
	CLASS_NAME varchar2(20), --강의명
	CLASS_PRICE number(8), --수강료
	TEACHER_REGIST_DATE varchar(8) --강사자격취득일
);




insert into TBL_TEACHER_202201 values('100','이초급','초급반','100000','20220101');
insert into TBL_TEACHER_202201 values('200','김중급','중급반','200000','20220102');
insert into TBL_TEACHER_202201 values('300','박고급','고급반','300000','20220103');
insert into TBL_TEACHER_202201 values('400','정심화','심화반','400000','20220104');

create table TBL_MEMBER_202201(
	C_NO char(5) primary key, --회원번호
	C_NAME varchar2(15), --회원명
	PHONE varchar2(11), --전화번호
	ADDRESS varchar2(50), --주소
	GRADE varchar2(6) --등급
);


insert into TBL_MEMBER_202201 values('10001','홍길동','01011112222','서울시 강남구','일반');
insert into TBL_MEMBER_202201 values('10002','장발장','01022223333','성남시 분당구','일반');
insert into TBL_MEMBER_202201 values('10003','임꺽정','01033334444','대전시 유성구','일반');
insert into TBL_MEMBER_202201 values('20001','성춘향','01044445555','부산시 서구','VIP');
insert into TBL_MEMBER_202201 values('20002','이몽룡','01055556666','대구시 북구','VIP');

create table TBL_CLASS_202201(
	REGIST_MONTH varchar2(6) not null, --수강월
	C_NO char(5) not null, --회원번호
	CLASS_AREA varchar2(25), --강의장소
	TUITION number(8), --수강료
	TEACHER_CODE char(3) --강사코드
);

insert into TBL_CLASS_202201 values('202203','10001','서울본원','100000','100');
insert into TBL_CLASS_202201 values('202203','10002','성남본원','100000','100');
insert into TBL_CLASS_202201 values('202203','10003','대전본원','200000','200');
insert into TBL_CLASS_202201 values('202203','20001','부산본원','150000','300');
insert into TBL_CLASS_202201 values('202203','20002','대구본원','200000','400');

select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,'￦'||substr(CLASS_PRICE,1,3)||','||substr(CLASS_PRICE,4,3),
		substr(TEACHER_REGIST_DATE,1,4)||'년'||substr(TEACHER_REGIST_DATE,5,2)||'월'||substr(TEACHER_REGIST_DATE,7,2)||'일'
		from TBL_TEACHER_202201;
select substr(REGIST_MONTH,1,4)||'년'||substr(REGIST_MONTH,5,2)||'월'||substr(REGIST_MONTH,7,2)||'일'
		,c.C_NO, m.c_name,t.CLASS_NAME
		,CLASS_AREA,'￦'||substr(TUITION,1,3)||','||substr(TUITION,4,3),m.GRADE
from TBL_CLASS_202201 c, TBL_MEMBER_202201 m,TBL_TEACHER_202201 t
where c.c_no=m.c_no and c.TEACHER_CODE = t.TEACHER_CODE;

select 


commit;