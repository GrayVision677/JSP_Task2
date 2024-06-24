drop table TBL_JUMIN_202109;
drop table TBL_HOSP_202109;
drop table TBL_VACCRESV_202109;

create table TBL_JUMIN_202109(
	JUMIN VARCHAR2(20) not null primary key,
	NAME VARCHAR2(15),
	PHONE VARCHAR2(15),
	ADDRESS VARCHAR2(50)
);

insert into TBL_JUMIN_202109 values('720101-1000001','김주민','010-1111-1111','경기도 성남시 수정구 태평1동');
insert into TBL_JUMIN_202109 values('720101-2000001','이주민','010-1111-2222','경기도 성남시 수정구 태평2동');
insert into TBL_JUMIN_202109 values('730101-1000001','박주민','010-1111-3333','경기도 성남시 수정구 복정동');
insert into TBL_JUMIN_202109 values('740101-2000001','홍주민','010-1111-4444','경기도 성남시 수정구 산성동');
insert into TBL_JUMIN_202109 values('750101-1000001','조주민','010-1111-5555','경기도 성남시 중원구 성남동');
insert into TBL_JUMIN_202109 values('760101-2000001','최주민','010-1111-6666','경기도 성남시 중원구 중앙동');
insert into TBL_JUMIN_202109 values('770101-1000001','장주민','010-1111-7777','경기도 성남시 중원구 상대원동');
insert into TBL_JUMIN_202109 values('780101-2000001','정주민','010-1111-8888','경기도 성남시 중원구 하대원동');
insert into TBL_JUMIN_202109 values('790101-1000001','강주민','010-1111-9999','경기도 성남시 분당구 야탑1동');
insert into TBL_JUMIN_202109 values('800101-2000001','신주민','010-2222-1111','경기도 성남시 분당구 야탑2동');

create table TBL_HOSP_202109(
	HOSPCODE CHAR(4) not null primary key,
	HOSPNAME VARCHAR2(40),
	HOSPTEL VARCHAR2(15),
	HOSPADDR CHAR(2)
);

insert into TBL_HOSP_202109 values('H001','가_병원','031-1111-2222','10');
insert into TBL_HOSP_202109 values('H002','나_병원','031-1111-3333','20');
insert into TBL_HOSP_202109 values('H003','다_병원','031-1111-4444','30');
insert into TBL_HOSP_202109 values('H004','라_병원','031-1111-5555','40');


create table TBL_VACCRESV_202109(
	RESVNO NUMBER(8) not null primary key,
	JUMIN VARCHAR2(20),
	HSOPCODE CHAR(4),
	RESVDATE DATE,
	RESVTIME NUMBER(4),
	VCODE CHAR(4)
);

insert into TBL_VACCRESV_202109 values(20210001,'710101-1000001','H001','20210901',0830,'V001');
insert into TBL_VACCRESV_202109 values(20210002,'720101-2000001','H002','20210901',0930,'V002');
insert into TBL_VACCRESV_202109 values(20210003,'730101-1000001','H003','20210901',1030,'V003');
insert into TBL_VACCRESV_202109 values(20210004,'740101-2000001','H001','20210901',1130,'V001');
insert into TBL_VACCRESV_202109 values(20210005,'750101-1000001','H001','20210901',1230,'V002');
insert into TBL_VACCRESV_202109 values(20210006,'760101-2000001','H002','20210901',1330,'V003');
insert into TBL_VACCRESV_202109 values(20210007,'770101-1000001','H003','20210901',1430,'V001');
insert into TBL_VACCRESV_202109 values(20210008,'780101-2000001','H001','20210901',1530,'V002');
insert into TBL_VACCRESV_202109 values(20210009,'790101-1000001','H001','20210901',1630,'V003');
insert into TBL_VACCRESV_202109 values(20210010,'800101-2000001','H002','20210901',1730,'V001');


select Max(RESVNO) from TBL_VACCRESV_202109;
select va.RESVNO "예약번호",ju.NAME "성명",decode(substr(ju.JUMIN,8,1),'1','남','2','여') "성별",
ho.HOSPNAME "병원이름", to_char(va.RESVDATE,'yyyy"년"MM"월"dd"일"') "예약날짜"
, substr(to_char(va.RESVTIME,'0000'),1,3) || ':' || substr(to_char(va.RESVTIME,'0000'),4,2)  "예약시간"
, decode(va.VCODE,'V001','A백신','V002','B백신','V003','C백신','V004','D백신') "백신코드"
, decode(ho.HOSPADDR,'10','서울','20','대전','30','대구','40','광주') "방문지역"
from TBL_VACCRESV_202109 va join TBL_JUMIN_202109 ju 
on va.JUMIN = ju.JUMIN
join TBL_HOSP_202109 ho
on ho.HOSPCODE = va.HSOPCODE
where va.RESVNO=20210002;

select va.RESVNO "예약번호",ju.NAME "성명",decode(substr(ju.JUMIN,8,1),'1','남','2','여') "성별",
ho.HOSPNAME "병원이름", substr(va.RESVDATE,1,4)||'년'||substr(va.RESVDATE,5,2)||'월'||substr(va.RESVDATE,7,2)||'일' "예약날짜"
, substr(to_char(va.RESVTIME,'0000'),1,3) || ':' || substr(to_char(va.RESVTIME,'0000'),4,2)  "예약시간"
, decode(va.VCODE,'V001','A백신','V002','B백신','V003','C백신','V004','D백신') "백신코드"
, decode(ho.HOSPADDR,'10','서울','20','대전','30','대구','40','광주') "방문지역"
from TBL_VACCRESV_202109 va join TBL_JUMIN_202109 ju 
on va.JUMIN = ju.JUMIN
join TBL_HOSP_202109 ho
on ho.HOSPCODE = va.HSOPCODE;