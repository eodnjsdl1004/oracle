/* Drop Tables */

DROP TABLE admins CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_board_bno;
DROP SEQUENCE SEQ_lecture_lec_no;
DROP SEQUENCE SEQ_reply_rno;




/* Create Sequences */

CREATE SEQUENCE SEQ_board_bno INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_lecture_lec_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_reply_rno INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admins
(
	id varchar2(30) NOT NULL,
	updatedate date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE board
(
	bno number(10) NOT NULL,
	writer varchar2(30) NOT NULL,
	title varchar2(30) NOT NULL,
	content varchar2(2000),
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (bno)
);


CREATE TABLE lecture
(
	lec_no number(10) NOT NULL,
	teacher varchar2(30) NOT NULL,
	lecture_list varchar2(30) NOT NULL,
	PRIMARY KEY (lec_no)
);


CREATE TABLE members
(
	id varchar2(30) NOT NULL,
	name varchar2(30) NOT NULL,
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (id)
);


CREATE TABLE NEW_TABLE
(
	lec_no number(10) NOT NULL,
	id varchar2(30) NOT NULL,
	orderdate date DEFAULT SYSDATE,
	PRIMARY KEY (lec_no, id)
);


CREATE TABLE reply
(
	rno number(10) NOT NULL,
	bno number(10) NOT NULL,
	writer varchar2(30) NOT NULL,
	content varchar2(30),
	regdate date DEFAULT SYSDATE,
	PRIMARY KEY (rno)
);



/* Create Foreign Keys */

ALTER TABLE reply
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (lec_no)
	REFERENCES lecture (lec_no)
;


ALTER TABLE admins
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE board
	ADD FOREIGN KEY (writer)
	REFERENCES members (id)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (writer)
	REFERENCES members (id)
;