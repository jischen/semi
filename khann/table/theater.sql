<!--상영관 생성 테이블 -->

CREATE TABLE Theater(
Theater_no NUMBER PRIMARY KEY, 
Theater_name varchar2(30) NOT NULL,
Theater_type varchar2(30) NOT null,
Theater_row NUMBER NOT null, 
Theater_col NUMBER NOT null 
);

<!--좌석  생성 테이블 -->

CREATE TABLE seat(
seat_no NUMBER PRIMARY KEY,
Theater_no REFERENCES Theater(Theater_no) ON DELETE CASCADE,
seat_type varchar2(20) check(seat_type IN ('커플석', '장애인석', '일반석')),
seat_row char(1) NOT NULL,
seat_col NUMBER NOT NULL
);

CREATE SEQUENCE seat_seq nocache;

