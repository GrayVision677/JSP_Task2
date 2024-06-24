create table TBL_VOTE_202005(
	V_JUMIN CHAR(13) NOT NULL PRIMARY KEY,
	V_NAME VARCHAR2(20),
	M_NO CHAR(1),
	V_TIME CHAR(4),
	V_AREA CHAR(25),
	V_CONFIRM CHAR(1)
);

insert into TBL_VOTE_202005 values('9901011000001','김유권','1','0930','제1투표장','N');
insert into TBL_VOTE_202005 values('8001012000002','이유권','2','0930','제1투표장','N');
insert into TBL_VOTE_202005 values('9301011000003','박유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('7501012000004','홍유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('8301011000005','조유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('8603012000006','최유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('8004011000007','지유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('8401012000008','장유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('8501011000009','정유권','3','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('9401012000010','강유권','4','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('6301011000011','신유권','5','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('9401012000012','오유권','1','0930','제1투표장','Y');
insert into TBL_VOTE_202005 values('9601011000013','현유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('6601012000014','왕유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('5001011000015','유유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('5101012000016','한유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('4001011000017','문유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('5801012000018','양유권','2','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('7701011000019','구유권','4','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('7001012000020','황유권','5','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('8801011000021','배유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('8901012000022','전유권','3','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('7201011000023','고유권','1','1330','제2투표장','Y');
insert into TBL_VOTE_202005 values('9801012000024','권유권','3','1330','제2투표장','Y');

select V_NAME,'19'||substr(V_JUMIN,1,2)||'년'||substr(V_JUMIN,3,2)||'월'||substr(V_JUMIN,5,2)||'일생'
,'만 '||ROUND((to_char(SYSDATE,'yyyyMMdd') - to_char(to_date(substr(V_JUMIN,1,6)+ decode(substr(V_JUMIN,1,1),'0',20000000,'1',20000000,'2',20000000,'4',19000000,'5',19000000,'6',19000000,'7',19000000,'8',19000000,'9',19000000)),'yyyyMMdd'))/10000)||'세',
decode(substr(V_JUMIN,7,1),'1','남','2','여','3','남','4','여'),
M_NO,V_TIME,decode(substr(V_CONFIRM,1,1),'N','미확인','Y','확인')
FROM TBL_VOTE_202005;

decode(substr(V_JUMIN,1,1),'0',20000000,'1',20000000,'2',20000000,'4',19000000,'5',19000000,'6',19000000,'7',19000000,'8',19000000,'9',19000000)
select to_char(to_date(substr(V_JUMIN,1,2)||substr(V_JUMIN,3,2)||substr(V_JUMIN,5,2)+19000000),'yyyyMMdd') FROM TBL_VOTE_202005;
select to_char(SYSDATE,'yyMMdd') FROM TBL_VOTE_202005;
create table TBL_MEMBER_202005(
	M_NO char(1) not null primary key,
	M_NAME varchar2(20),
	P_CODE char(2),
	P_SCHOOL char(1),
	M_JUMIN char(13),
	M_CITY varchar2(20)
);

insert into TBL_MEMBER_202005 values('1','김후보','P1','1','6603011999991','수선화동');
insert into TBL_MEMBER_202005 values('2','이후보','P2','3','5503012999992','민들래동');
insert into TBL_MEMBER_202005 values('3','박후보','P3','2','7703011999993','나팔꽃동');
insert into TBL_MEMBER_202005 values('4','조후보','P4','2','8803012999994','진달래동');
insert into TBL_MEMBER_202005 values('5','최후보','P5','3','9903011999995','개나리동');

select m.M_NO,m.M_NAME,count(v.M_NO) from TBL_MEMBER_202005 m join TBL_VOTE_202005 v
on m.M_NO = v.M_NO
where v.V_CONFIRM = 'Y'
group by m.M_NO,m.M_NAME order by count(v.M_NO) desc;

create table TBL_PARTY_202005(
	P_CODE char(2) not null PRIMARY KEY,
	P_NAME VARCHAR2(20),
	P_INDATE DATE,
	P_READER VARCHAR2(20),
	P_TEL1 char(3),
	P_TEL2 char(4),
	P_TEL3 char(4)
);

insert into TBL_PARTY_202005 values('P1','A정당','2010-01-01','위대표','02','1111','0001');
insert into TBL_PARTY_202005 values('P2','B정당','2010-02-01','명대표','02','1111','0002');
insert into TBL_PARTY_202005 values('P3','C정당','2010-03-01','기대표','02','1111','0003');
insert into TBL_PARTY_202005 values('P4','D정당','2010-04-01','옥대표','02','1111','0004');
insert into TBL_PARTY_202005 values('P5','E정당','2010-05-01','임대표','02','1111','0005');

commit;

select m.M_NO "후보번호", m.M_NAME "성명", p.P_NAME "소속정당",
decode(P_SCHOOL,'1','고졸','2','학사','3','석사','4','박사') "학력",
substr(m.M_JUMIN,1,6)|| '-' || substr(m.M_JUMIN,7,7) "주민번호", m.M_CITY "지역구",
substr(p.P_TEL1,1,2) || '-' || substr(p.P_TEL2,1,4) || '-' || substr(p.P_TEL3,1,4) "대표전화"
FROM TBL_MEMBER_202005 m join TBL_PARTY_202005 p on m.P_CODE = p.P_CODE;


select 
decode(P_SCHOOL,'1','고졸','2','학사','3','석사','4','박사') "학력"
FROM TBL_MEMBER_202005;

select *
FROM TBL_MEMBER_202005;
