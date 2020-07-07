CREATE TABLE review(
review_no NUMBER PRIMARY KEY, 
--리뷰번호
review_writer REFERENCES member(member_id) ON DELETE SET NULL,
--리뷰 작성자 (멤버 아이디 참조)
review_content varchar2(500) NOT null,
--리뷰 내용
review_score char(4) check(review_score IN('1점','2점','3점','4점','5점')),
--리뷰 점수
review_date DATE DEFAULT sysdate NOT null
--리뷰 날짜
);
CREATE SEQUENCE review_seq nocache;

