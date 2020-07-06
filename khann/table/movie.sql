CREATE TABLE movie(
--영화번호
movie_no NUMBER PRIMARY KEY,
--제목
movie_name varchar2(60) NOT null,
--장르
movie_type varchar2(21) NOT NULL CHECK(movie_type IN('멜로', '스릴러', '공포', '휴먼', 'SF', '코미디', '로맨틱코미디', '애니메이션', '키즈', '액션','판타지','음악','전쟁')),
--상영등급(나이)
movie_age varchar2(15) NOT NULL CHECK(movie_age IN('전체','만12세','만15세', '만18세')),
--상영시간
movie_runtime char(3) NOT null,
--개봉일
movie_open DATE NOT null,
--감독
movie_director varchar2(60) NOT null,
--배우
movie_ac varchar2(300) NOT null,
--줄거리
movie_content varchar2(4000) NOT null
);
​COMMIT;
CREATE SEQUENCE movie_seq;