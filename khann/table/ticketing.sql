CREATE TABLE ticketing(
ticketing_no number PRIMARY KEY,
member_no NUMBER REFERENCES member(member_no) ON delete CASCADE,
show_no NUMBER REFERENCES show(show_no) ON DELETE CASCADE,
seat_no NUMBER REFERENCES seat(seat_no) ON DELETE CASCADE,
buy_no NUMBER REFERENCES buy(buy_no) ON DELETE CASCADE,
ticketing_date date NOT NULL,
ticketing_peoplenum NUMBER NOT NULL,
ticketing_price number
);