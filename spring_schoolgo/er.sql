
/* Drop Tables */

DROP TABLE CURRENT_ROUTE CASCADE CONSTRAINTS;
DROP TABLE FREE_BOARD_REPLY CASCADE CONSTRAINTS;
DROP TABLE FREE_BOARD CASCADE CONSTRAINTS;
DROP TABLE NOTICE_BOARD_REPLY CASCADE CONSTRAINTS;
DROP TABLE NOTICE_BOARD CASCADE CONSTRAINTS;
DROP TABLE ROUTE CASCADE CONSTRAINTS;
DROP TABLE SHARE_BOARD_REPLY CASCADE CONSTRAINTS;
DROP TABLE SHARE_BOARD CASCADE CONSTRAINTS;
DROP TABLE PROJECT.SUBWAY CASCADE CONSTRAINTS;
DROP TABLE PROJECT.TIMETABLE CASCADE CONSTRAINTS;
DROP TABLE PROJECT.TUSER CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE CURRENT_ROUTE
(
	CUR_TIME date NOT NULL,
	TURN_TIME date NOT NULL,
	ARR_TIME date NOT NULL,
	ROUTE_COST number NOT NULL,
	ROUTE_ID varchar2(70 char) NOT NULL
);


CREATE TABLE FREE_BOARD
(
	nb_no number NOT NULL,
	content varchar2(500) NOT NULL,
	reg_date date NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (nb_no)
);


CREATE TABLE FREE_BOARD_REPLY
(
	reply_no number NOT NULL,
	reply_content char(500) NOT NULL,
	reg_date date NOT NULL,
	nb_no number NOT NULL,
	USER_ID varchar2(20),
	PRIMARY KEY (reply_no)
);


CREATE TABLE NOTICE_BOARD
(
	nb_no number NOT NULL,
	content varchar2(500) NOT NULL,
	reg_date date NOT NULL,
	USER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (nb_no)
);


CREATE TABLE NOTICE_BOARD_REPLY
(
	reply_no number NOT NULL,
	reply_content char(500) NOT NULL,
	reg_date date NOT NULL,
	nb_no number NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (reply_no)
);


CREATE TABLE ROUTE
(
	ROUTE_ID varchar2(70 char) NOT NULL,
	ROUTE_NAME varchar2(50 char) NOT NULL,
	DEP_STATION varchar2(10 char) NOT NULL,
	ARR_STATION varchar2(10 char),
	DEP_TRANS varchar2(20 char) NOT NULL,
	DEP_TIME number NOT NULL,
	ARR_TRANS varchar2(20 char),
	ARR_TIME number,
	USER_ID varchar2(20) NOT NULL,
	flag number NOT NULL,
	PRIMARY KEY (ROUTE_ID)
);


CREATE TABLE SHARE_BOARD
(
	route_name char(30) NOT NULL,
	sb_no number NOT NULL,
	content char(500),
	reg_date date,
	USER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (sb_no)
);


CREATE TABLE SHARE_BOARD_REPLY
(
	REPLY_NO number NOT NULL,
	REPLY_CONTENT varchar2(500) NOT NULL,
	REG_DATE date NOT NULL,
	sb_no number NOT NULL,
	user_id varchar2(20),
	PRIMARY KEY (REPLY_NO)
);


CREATE TABLE PROJECT.SUBWAY
(
	STATION_CD varchar2(10 char) NOT NULL,
	STATION_NM varchar2(30 char) NOT NULL,
	LINE_NUM varchar2(6 char) NOT NULL,
	FR_CODE varchar2(10 char) NOT NULL,
	CONSTRAINT SYS_C008075 PRIMARY KEY (STATION_CD)
);


CREATE TABLE PROJECT.TIMETABLE
(
	MON_TIME number,
	TUE_TIME number,
	WED_TIME number,
	THU_TIME number,
	FRI_TIME number,
	USER_ID varchar2(20) NOT NULL
);


CREATE TABLE PROJECT.TUSER
(
	USER_ID varchar2(20) NOT NULL,
	PASS varchar2(20 char) NOT NULL,
	USER_NAME varchar2(10 char) NOT NULL,
	NICKNAME varchar2(20 char) NOT NULL,
	EMAIL varchar2(50 char) NOT NULL,
	PHONE_NUM varchar2(20 char) NOT NULL,
	CONSTRAINT SYS_C007981 PRIMARY KEY (USER_ID)
);



/* Create Foreign Keys */

ALTER TABLE FREE_BOARD_REPLY
	ADD FOREIGN KEY (nb_no)
	REFERENCES FREE_BOARD (nb_no)
;


ALTER TABLE NOTICE_BOARD_REPLY
	ADD FOREIGN KEY (nb_no)
	REFERENCES NOTICE_BOARD (nb_no)
;


ALTER TABLE CURRENT_ROUTE
	ADD FOREIGN KEY (ROUTE_ID)
	REFERENCES ROUTE (ROUTE_ID)
;


ALTER TABLE SHARE_BOARD_REPLY
	ADD FOREIGN KEY (sb_no)
	REFERENCES SHARE_BOARD (sb_no)
;


ALTER TABLE ROUTE
	ADD FOREIGN KEY (DEP_STATION)
	REFERENCES PROJECT.SUBWAY (STATION_CD)
;


ALTER TABLE ROUTE
	ADD FOREIGN KEY (ARR_STATION)
	REFERENCES PROJECT.SUBWAY (STATION_CD)
;


ALTER TABLE FREE_BOARD
	ADD FOREIGN KEY (USER_ID)
	REFERENCES PROJECT.TUSER (USER_ID)
;


ALTER TABLE NOTICE_BOARD
	ADD FOREIGN KEY (USER_ID)
	REFERENCES PROJECT.TUSER (USER_ID)
;


ALTER TABLE ROUTE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES PROJECT.TUSER (USER_ID)
;


ALTER TABLE SHARE_BOARD
	ADD FOREIGN KEY (USER_ID)
	REFERENCES PROJECT.TUSER (USER_ID)
;


ALTER TABLE PROJECT.TIMETABLE
	ADD FOREIGN KEY (USER_ID)
	REFERENCES PROJECT.TUSER (USER_ID)
;



