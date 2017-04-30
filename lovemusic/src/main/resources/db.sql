-- =================== DROP TABLE & SEQUENCE =================
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
profile VARCHAR2(200)
);

-- 파일DB
CREATE TABLE cm_file
(
filenum NUMBER PRIMARY KEY,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_file_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
file_ori VARCHAR2(4000) NOT NULL,
file_com VARCHAR2(4000) NOT NULL,
file_type VARCHAR2(10) NOT NULL,
file_title VARCHAR2(50) NOT NULL,
cover_ori VARCHAR2(200),
cover_re VARCHAR2(200)
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
profile VARCHAR2(200)
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


-- test data    
insert into cm_user values('aa', 'aa', 'aa', 'aa', 'aa', null);
insert into cm_user values('bb', 'bb', 'bb', 'bb', 'bb', null);

insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa', null, null);
insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa1', null, null);
insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa2', null, null);
insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa3', null, null);
insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa4', null, null);
insert into cm_file values(filenum_seq.nextval, 'aa', 'aa', 'aa', 'comu', 'aaa5', null, null);

insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb', null, null);
insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb1', null, null);
insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb2', null, null);
insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb3', null, null);
insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb4', null, null);
insert into cm_file values(filenum_seq.nextval, 'bb', 'bb', 'bb', 'comu', 'bbb5', null, null);

insert into CM_BOARD values(boardnum_seq.nextval, 'aa', 'aaaa1', 'aaaaaaa', sysdate, 1, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'aa', 'aaaa2', 'aaaaaaa', sysdate, 2, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'aa', 'aaaa3', 'aaaaaaa', sysdate, 3, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'aa', 'aaaa4', 'aaaaaaa', sysdate, 4, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'aa', 'aaaa5', 'aaaaaaa', sysdate, 5, 'true', null);

insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb1', 'bbbbbb', sysdate, 6, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb2', 'bbbbbb', sysdate, 7, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb3', 'bbbbbb', sysdate, 8, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb4', 'bbbbbb', sysdate, 9, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb5', 'bbbbbb', sysdate, 10, 'true', null);
insert into CM_BOARD values(boardnum_seq.nextval, 'bb', 'bbbb6', 'bbbbbb', sysdate, 11, 'true', null);

insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'bb');
insert into cm_like values(1, 'aa', 'bb');


insert into cm_like values(2, 'aa', 'bb');
insert into cm_like values(2, 'aa', 'bb');
insert into cm_like values(2, 'aa', 'bb');
insert into cm_like values(3, 'aa', 'bb');
insert into cm_like values(4, 'aa', 'bb');
insert into cm_like values(5, 'aa', 'bb');

insert into cm_like values(11, 'bb', 'aa');
insert into cm_like values(10, 'bb', 'aa');
insert into cm_like values(10, 'bb', 'aa');
insert into cm_like values(6, 'bb', 'aa');
insert into cm_like values(6, 'bb', 'aa');
insert into cm_like values(7, 'bb', 'aa');
insert into cm_like values(8, 'bb', 'aa');
insert into cm_like values(9, 'bb', 'aa');

insert into cm_subscribe values('aa', 'bb');