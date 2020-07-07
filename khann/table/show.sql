CREATE TABLE show (
show_no NUMBER PRIMARY KEY,
movie_no NUMBER REFERENCES movie(movie_no) ON DELETE CASCADE,
theater_no NUMBER REFERENCES theater(theater_no) ON DELETE CASCADE,
show_start Date NOT NULL

)