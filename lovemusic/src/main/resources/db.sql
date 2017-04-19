-- 사용자DB
DROP TABLE cm_user;

CREATE TABLE cm_user
(
userid VARCHAR2(30) PRIMARY KEY,
email VARCHAR2(30) NOT NULL,
password VARCHAR2(30) NOT NULL,
question VARCHAR2(30) NOT NULL,
answer VARCHAR2(30) NOT NULL
);

-- 파일DB
DROP TABLE cm_file;
DROP SEQUENCE filenum_seq;

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

CREATE SEQUENCE filenum_seq;

-- 게시판DB
DROP TABLE cm_board;
DROP SEQUENCE boardnum_seq;

CREATE TABLE cm_board
(
boardnum NUMBER PRIMARY KEY,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_board_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
title VARCHAR2(100) NOT NULL,
content VARCHAR2(2000),
inputdate DATE DEFAULT SYSDATE,
filenum NUMBER,
shared VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE boardnum_seq;

-- 댓글DB
DROP TABLE cm_reply;
DROP SEQUENCE replynum_seq;

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

CREATE SEQUENCE replynum_seq;

-- 좋아요DB
DROP TABLE cm_like;

CREATE TABLE cm_like
(
boardnum NUMBER CONSTRAINT cm_like_board_fk
REFERENCES cm_board(boardnum) ON DELETE CASCADE,
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_like_user_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
like_userid VARCHAR2(30) NOT NULL
);

-- 구독DB
DROP TABLE cm_subscribe;

CREATE TABLE cm_subscribe
(
userid VARCHAR2(30) NOT NULL CONSTRAINT cm_subscribe_fk
REFERENCES cm_user(userid) ON DELETE CASCADE,
sub_userid VARCHAR2(30) NOT NULL
);