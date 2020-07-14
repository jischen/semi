-- 고객센터 faq 테이블 생성 --
CREATE TABLE cs (
cs_no NUMBER PRIMARY KEY,
cs_head char(12) check(cs_head IN ('영화예매','회원제도','회원정보','카드할인','기타')),
cs_title varchar2(300) NOT NULL,
cs_writer REFERENCES member(member_id) ON DELETE SET NULL,
cs_content varchar2(4000) NOT NULL,
cs_date DATE DEFAULT sysdate NOT NULL,
cs_read NUMBER DEFAULT 0 NOT NULL
);
CREATE SEQUENCE cs_seq nocache;

-- 고객센터 문의 게시판 테이블 생성 --
CREATE TABLE ask (
ask_no NUMBER PRIMARY KEY,
ask_head char(12),
ask_title varchar2(300) NOT NULL,
ask_writer REFERENCES member(member_id) ON DELETE SET NULL,
ask_content varchar2(4000) NOT NULL,
ask_date DATE DEFAULT SYSDATE NOT NULL
);
CREATE SEQUENCE ask_seq nocache;

-- 고객센터 문의 게시판 댓글 테이블 생성 --
CREATE TABLE reply(
reply_no NUMBER PRIMARY KEY,
reply_writer REFERENCES member(member_id) ON DELETE SET NULL,
reply_content varchar2(4000) NOT NULL,
reply_date DATE DEFAULT SYSDATE NOT NULL,
reply_origin NOT NULL REFERENCES ask(ask_no) ON DELETE CASCADE
);
CREATE SEQUENCE reply_seq nocache;

-- ask 테이블에 댓글 개수 항목 추가 --
ALTER TABLE ask ADD ask_replycount NUMBER;
UPDATE ask SET ask_replycount = 0;
ALTER TABLE ask MODIFY ask_replycount DEFAULT 0 NOT NULL;

