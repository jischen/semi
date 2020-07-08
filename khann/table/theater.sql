<!--상영관 생성 테이블 -->

CREATE TABLE theater(
theater_no NUMBER PRIMARY KEY, 
theater_name varchar2(30) NOT NULL,
theater_type varchar2(30) NOT null,
theater_row NUMBER NOT null, 
theater_col NUMBER NOT null 
);


<!--좌석  생성 테이블 -->

CREATE TABLE seat(
seat_no NUMBER PRIMARY KEY,
theater_no REFERENCES Theater(Theater_no) ON DELETE CASCADE,
seat_row number NOT NULL,
seat_col NUMBER NOT NULL
);


첫번째 : 상영관 정보 입력
?theater_name=영등포점&theater_type=2D&theater_row=5&theater_col=5

두번재 : 상영관 좌석 선택
- 자리 표시 후 선택하여 전송
- 앞에서 입력한 이름과 유형도 같이 전송

?theater_name=영등포점&theater_type=2D&theater_row=5&theater_col=5&seat=1-1&seat=1-2&seat=1-3&...

세번째 : 서블릿 처리
영화관 정보 : 
req.getParameter("theater_name");
좌석 정보 : 같은 이름으로 여러개 온다
String[] arr = req.getParameterValues("seat");
반복문으로 반복하면서 - 를 기준으로 분해한 뒤 좌석 등록
