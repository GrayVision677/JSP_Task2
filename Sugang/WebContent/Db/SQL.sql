create table course_tbl(
	id varchar2(5) PRIMARY KEY not null,
	name varchar2(40),
	credit number(6),
	lecturer varchar2(10),
	week number(2),
	start_hour number(4),
	endhour_end number(4)
);

INSERT INTO course_tbl values('10001', '프로그래밍',2,'1',1,0900,1100);
INSERT INTO course_tbl values('10002', '객체지향 츠로그래밍',2,'2',2,0900,1200);
INSERT INTO course_tbl values('10003', '자료구조',3,'4',3,0900,1200);
INSERT INTO course_tbl values('10004', '알고리즘',3,'4',4,0900,1200);
INSERT INTO course_tbl values('20001', '시스템 프로그래밍',2,'5',1,1300,1600);
INSERT INTO course_tbl values('20002', '운영체제',3,'5',2,1500,1800);
INSERT INTO course_tbl values('20003', '오토마타와 컴파일러',3,'5',3,1330,1630);
INSERT INTO course_tbl values('30001', '소프트웨어 공학',2,'3',4,1300,1530);
INSERT INTO course_tbl values('30002', '시스템 분석 및 설계',3,'3',5,0900,1200);
INSERT INTO course_tbl values('40001', '데이터베이스',3,'2',5,1300,1600);

create table lecturer_tbl(
	idx number(6) not null PRIMARY KEY,
	name varchar2(25),
	major varchar2(30),
	field varchar2(30)
);


INSERT INTO lecturer_tbl values(1,'김교수','소프트웨어공학','알고리즘');
INSERT INTO lecturer_tbl values(2,'이교수','소프트웨어공학','인공지능');
INSERT INTO lecturer_tbl values(3,'박교수','소프트웨어공학','소프트웨어공학');
INSERT INTO lecturer_tbl values(4,'우교수','소프트웨어공학','알고리즘');
INSERT INTO lecturer_tbl values(5,'최교수','응용컴퓨터공학','임베디드 시스템');
INSERT INTO lecturer_tbl values(6,'강교수','응용컴퓨터공학','멀티미디어');
INSERT INTO lecturer_tbl values(7,'황교수','모바일시스템공학','네트워크');

select * from lecturer_tbl order by(idx) asc;

select c.id, c.name, c.credit, l.name,
	decode(c.week, 1,'월',2,'화',3,'수',4,'목',5,'금',6,'토','일'),
	to_char(start_hour, '0000'),
	to_char(endhour_end, '0000')
from course_tbl c, lecturer_tbl l
where c.lecturer = l.idx
order by(c.id) asc;


select Max(idx) from lecturer_tbl;
delete
