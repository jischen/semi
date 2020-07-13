
CREATE TABLE member (
member_no number PRIMARY KEY,
member_id varchar2(16) NOT NULL UNIQUE CHECK(LENGTH(member_id) BETWEEN 5 AND 20) ,
member_pw varchar2(20) NOT NULL UNIQUE CHECK(LENGTH(member_pw) BETWEEN 8 AND 16),
member_name varchar2(21) NOT NULL,
post char(5) NOT null ,
base_addr varchar2(300) ,
extra_addr varchar2(300) ,
member_birth DATE NOT NULL ,
member_phone char(11) NOT NULL ,
grade varchar2(9) NOT NULL check(grade in('Silver', 'Gold', 'VIP', '관리자')),
member_point number default 10000 not null
member_join DATE  DEFAULT sysdate NOT NULL,
member_login DATE     -- null / sysdate가 아니기 때문에
);

CREATE SEQUENCE member_seq nocache;

INSERT INTO MEMBER values(MEMBER_seq.nextval,'system','system1234','고지선','98765','','','1995-11-25','01088889999','관리자',sysdate,'');
