CREATE TABLE show (
show_no NUMBER PRIMARY KEY, --시퀀스 
movie_no NUMBER REFERENCES movie(movie_no) ON DELETE CASCADE, --무비노 참조키
theater_no NUMBER REFERENCES theater(theater_no) ON DELETE CASCADE, --참조키
show_start date NOT NULL  --date추가
);



CREATE SEQUENCE show_seq nocache;