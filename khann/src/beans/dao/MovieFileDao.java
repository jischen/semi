package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.EventFileDto;
import beans.dto.MovieFileDto;

public class MovieFileDao {

	// context.xml에서 관리하는 자원 객체를 참조할 수 있도록 연결 코드 구현
	private static DataSource src;// 리모컨 선언

	// static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
	static {
		try {
			// src = context.xml에서 관리하는 자원의 정보;
			Context ctx = new InitialContext();// 탐색 도구
			Context env = (Context) ctx.lookup("java:/comp/env");// Context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 연결 메소드
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}

	// 시퀀스 생성 메소드
	public int getSequence() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT movie_file_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);// rs.getInt("nextcal");

		con.close();

		return seq;
	}

	// 저장 메소드
	public void save(MovieFileDto mfdto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO movie_file VALUES(?,?,?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, mfdto.getMovie_file_no());
		ps.setString(2, mfdto.getMovie_file_name());
		ps.setLong(3, mfdto.getMovie_file_size());
		ps.setString(4, mfdto.getMovie_file_type());
		ps.setInt(5, mfdto.getMovie_file_origin());
		ps.execute();

		con.close();
	}

	// 게시글 첨부파일 조회
	public List<MovieFileDto> getList(int movie_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM movie_file WHERE movie_file_origin=? ORDER BY movie_file_no ASC";
		// 들어온 파일 순으로 정렬
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, movie_no);
		ResultSet rs = ps.executeQuery();
		List<MovieFileDto> list = new ArrayList<>();
		while (rs.next()) {
			MovieFileDto mfdto = new MovieFileDto(rs);
			list.add(mfdto);
		}
		con.close();
		return list;
	}

	// 단일조회(get) 기능
	public MovieFileDto get(int movie_file_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM movie_file WHERE movie_file_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, movie_file_no);
		ResultSet rs = ps.executeQuery();

		MovieFileDto mfdto;
		if (rs.next()) {
			mfdto = new MovieFileDto(rs);
		} else {
			mfdto = null;
		}

		con.close();
		return mfdto;
	}
	
	// 해당 영화 번호로 해당 이미지 반환
	public int getMovieImgNo(int movie_file_origin) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT MOVIE_FILE_NO FROM MOVIE_FILE WHERE MOVIE_FILE_ORIGIN = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, movie_file_origin);
		
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int result = rs.getInt(1);
		
		con.close();
		
		return result;
	}
}
