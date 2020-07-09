CREATE TABLE event(
event_no NUMBER PRIMARY KEY,
event_title varchar2(150) NOT NULL,
event_date DATE DEFAULT sysdate NOT NULL,
event_condition char(6) NOT NULL check(event_condition IN('예정','진행','마감')),
event_content varchar2(4000) NOT NULL 
);

CREATE SEQUENCE event_seq nocache;

CREATE TABLE event_file(
event_file_no NUMBER PRIMARY KEY,
event_file_name VARCHAR2(256) NOT NULL,
event_file_size NUMBER NOT NULL CHECK(event_file_size > 0),
event_file_type CHAR(10) NOT NULL,
event_file_origin REFERENCES event(event_no) ON DELETE CASCADE
);

CREATE SEQUENCE event_file_seq NOCACHE;

