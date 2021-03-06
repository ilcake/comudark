﻿-- =================== DROP TABLE & SEQUENCE =================
DROP TABLE cm_subscribe;
DROP TABLE cm_like;
DROP TABLE cm_reply;
DROP TABLE cm_board;
DROP TABLE cm_file;
DROP TABLE cm_user;

DROP SEQUENCE replynum_seq;
DROP SEQUENCE boardnum_seq;
DROP SEQUENCE filenum_seq;

-- =================== CREATE TABLE & SEQUENCE =================
CREATE SEQUENCE filenum_seq;
CREATE SEQUENCE boardnum_seq;
CREATE SEQUENCE replynum_seq;

-- 사용자DB
CREATE TABLE cm_user
(
userid VARCHAR2(30) PRIMARY KEY,
email VARCHAR2(30) NOT NULL,
password VARCHAR2(30) NOT NULL,
question VARCHAR2(30) NOT NULL,
answer VARCHAR2(30) NOT NULL,
profile VARCHAR2(200) DEFAULT 'user.jpg'
);

-- 파일DB
CREATE TABLE cm_file
(
filenum NUMBER PRIMARY KEY,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_file_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
file_ori CLOB NOT NULL,
file_com CLOB NOT NULL,
file_type VARCHAR2(10) NOT NULL,
file_title VARCHAR2(50) NOT NULL,
cover_ori VARCHAR2(200) DEFAULT 'default.png',
cover_re VARCHAR2(200) DEFAULT 'default.jpg'
);

-- 게시판DB
CREATE TABLE cm_board
(
boardnum NUMBER PRIMARY KEY,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_board_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
title VARCHAR2(100) NOT NULL,
content VARCHAR2(2000),
inputdate DATE DEFAULT SYSDATE,
filenum NUMBER,
shared VARCHAR2(20) NOT NULL,
profile VARCHAR2(200) DEFAULT 'user.jpg'
);


-- 댓글DB
CREATE TABLE cm_reply
(
replynum NUMBER PRIMARY KEY,
boardnum NUMBER NOT NULL CONSTRAINT cm_reply_board_fk
REFERENCES cm_board(boardnum) ON DELETE CASCADE,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_reply_user_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
replytext VARCHAR2(1000) NOT NULL,
inputdate DATE DEFAULT SYSDATE
);

-- 좋아요DB
CREATE TABLE cm_like
(
boardnum NUMBER CONSTRAINT cm_like_board_fk
REFERENCES cm_board(boardnum) ON DELETE CASCADE,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_like_user_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
like_userid VARCHAR2(30) NOT NULL
);

-- 구독DB
CREATE TABLE cm_subscribe
(
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_subscribe_fk 
REFERENCES cm_user(userid) ON DELETE CASCADE,
sub_userid VARCHAR2(30) NOT NULL
);


-- ** TEST DATA   

-- * CM_USER (USERID, EMAIL, PASSWORD, QUESTION, ANSWER, PROFILE)
insert into cm_user(userid, email, password, question, answer) values('aa', 'aa@aa.com', 'aa', 'aa', 'aa');
insert into cm_user(userid, email, password, question, answer) values('bb', 'bb@bb.com', 'bb', 'bb', 'bb');
insert into cm_user(userid, email, password, question, answer) values('cc', 'cc@cc.com', 'cc', 'cc', 'cc');
insert into cm_user(userid, email, password, question, answer) values('dd', 'dd@dd.com', 'dd', 'dd', 'dd');
insert into cm_user(userid, email, password, question, answer) values('ee', 'ee@ee.com', 'ee', 'ee', 'ee');

-- * CM_FILE (FILENUM, USERID, FILE_ORI, FILE_COM, FILE_TYPE, FILE_TITLE, COVER_ORI, COVER_RE)
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'original code', 'comfiled code', 'comu', 'title of file');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'awesome song');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'hicu', 'aaa2');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'hicu', 'aaa3');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa4');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa5');

insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'hicu', 'bbb');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb1');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb2');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'hicu', 'bbb3');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb4');
insert into cm_file(filenum, userid, file_ori, file_com, file_type, file_title) values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb5');

-- * CM_BOARD (BOARDNUM, USERID, TITLE, CONTENT, INPUTDATE, FILENUM, SHARED, PROFILE)
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'aa', 'title of board', 'content of board', sysdate, 1, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'aa', 'aaaa2', 'aaaaaaa', sysdate, 2, 'false');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'aa', 'aaaa3', 'aaaaaaa', sysdate, 3, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'aa', 'aaaa4', 'aaaaaaa', sysdate, 4, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'aa', 'aaaa5', 'aaaaaaa', sysdate, 5, 'true');

insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb1', 'bbbbbb', sysdate, 6, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb2', 'bbbbbb', sysdate, 7, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb3', 'bbbbbb', sysdate, 8, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb4', 'bbbbbb', sysdate, 9, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb5', 'bbbbbb', sysdate, 10, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'bb', 'bbbb6', 'bbbbbb', sysdate, 11, 'true');

insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'cc', 'bbbb1', 'bbbbbb', sysdate, 6, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'cc', 'bbbb2', 'bbbbbb', sysdate, 7, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'dd', 'bbbb3', 'bbbbbb', sysdate, 8, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'dd', 'bbbb4', 'bbbbbb', sysdate, 9, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'ee', 'bbbb5', 'bbbbbb', sysdate, 10, 'true');
insert into CM_BOARD(boardnum, userid, title, content, inputdate, filenum, shared) values(boardnum_seq.nextval, 'ee', 'bbbb6', 'bbbbbb', sysdate, 11, 'true');

-- * CM_LIKE (BOARDNUM, USERID, LIKE_USERID)
insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'cc');
insert into cm_like values(1, 'aa', 'dd');
insert into cm_like values(1, 'aa', 'ee');

insert into cm_like values(6, 'bb', 'aa');
insert into cm_like values(6, 'bb', 'cc');

insert into cm_like values(11, 'cc', 'aa');
insert into cm_like values(13, 'dd', 'bb');
insert into cm_like values(13, 'dd', 'ee');

-- * CM_SUBSCRIBE (USERID, SUB_USERID)
insert into cm_subscribe values('aa', 'bb');
insert into cm_subscribe values('aa', 'cc');
insert into cm_subscribe values('aa', 'dd');
insert into cm_subscribe values('bb', 'aa');
insert into cm_subscribe values('bb', 'ee');
insert into cm_subscribe values('cc', 'ee');