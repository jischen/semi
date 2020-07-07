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


INSERT INTO movie values(movie_seq.nextval,'센과 치히로의 행방불명','애니메이션','전체','126','2015-02-05','미야자키 하야오','히이라기 루미(치히로/센 목소리)','금지된 세계의 문이 열렸다!');
INSERT INTO movie values(movie_seq.nextval,'뷰티인사이드','멜로','만12세','127','2015-08-20','백종열','한효주,이동욱','남자, 여자, 아이, 노인.. 심지어 외국인까지! ');
INSERT INTO movie values(movie_seq.nextval,'어벤져스','SF','만12세','126','2019-07-24','안소니 루소','로버트 다우니 주니어 크리스 에반스','인피니티 워 이후 절반만 살아남은 지구..');
INSERT INTO movie values(movie_seq.nextval,'겟아웃','공포','만15세','104','2017-05-17','조던 필','다니엘 칼루야','흑인 남자가 백인 여자친구 집에 초대 받으면서 벌어지는 이야기');
INSERT INTO movie values(movie_seq.nextval,'변호인','휴먼','만15세','127','2013-12-18','양우석','송강호 오달수','당신의 소중한 돈을 지켜드립니다');
INSERT INTO movie values(movie_seq.nextval,'엑시트','코미디','전체','126','2015-02-05','미야자키 하야오','히이라기 루미(치히로/센 목소리)','금지된 세계의 문이 열렸다!');
INSERT INTO movie values(movie_seq.nextval,'짱구는 못말려 극장판','키즈','전체','126','2015-02-05','미야자키 하야오','히이라기 루미(치히로/센 목소리)','금지된 세계의 문이 열렸다!');
INSERT INTO movie values(movie_seq.nextval,'보헤미안 랩소디','음악','전체','126','2015-02-05','미야자키 하야오','히이라기 루미(치히로/센 목소리)','금지된 세계의 문이 열렸다!');
INSERT INTO movie values(movie_seq.nextval,'국제시장','전쟁','전체','126','2015-02-05','미야자키 하야오','히이라기 루미(치히로/센 목소리)','금지된 세계의 문이 열렸다!');