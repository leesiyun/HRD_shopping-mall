CREATE TABLE member_tbl_02 (
	custno number(6) NOT null,
	custname varchar2(20),
	phone varchar(13),
	address varchar2(60),
	joindate DATE,
	grade char(1),
	city char(2),
	CONSTRAINT memberpk PRIMARY key(custno)
);

CREATE SEQUENCE memberseq
START WITH 100001;

INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '진평화', '010-1111-6666', '제주도 제수시 외나무골', '20151225', 'B', '60');
INSERT INTO member_tbl_02(custno, custname, phone, address, joindate, grade, city)
values(memberseq.nextval, '차공단', '010-1111-7777', '제주도 제수시 감나무골', '20151211', 'C', '60');

SELECT * FROM member_tbl_02;

CREATE TABLE money_tbl_02(
	custno number(6) NOT NULL,
	salenol number(8) NOT NULL,
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate DATE,
	CONSTRAINTS moneypk PRIMARY KEY(custno, salenol)
);

INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100002, 20160005, 500, 1, 500, 'A001', '20160103');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160008, 300, 1, 300, 'A005', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160009, 600, 1, 600, 'A006', '20160104');
INSERT INTO money_tbl_02(custno, salenol, pcost, amount, price, pcode, sdate)
values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

SELECT * FROM money_tbl_02;


COMMIT;