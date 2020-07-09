package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.EventDto;

public class EventDao {

	private static DataSource src;// 리모컨 선언

	static {
		try {
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

	// 목록 메소드
	public List<EventDto> getList(int start, int finish) throws Exception {
		Connection con = getConnection();

	String sql = "SELECT * FROM event ORDER BY event_no DESC";

//		트리정렬 제외

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<EventDto> list = new ArrayList<>();
		while (rs.next()) {
			EventDto edto = new EventDto(rs);
			list.add(edto);
		}

		con.close();

		return list;

	}
	
	// 검색 메소드
	public List<EventDto> search(String type, String keyword) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM event"
								+ "WHERE instr(#1, ?) > 0 "
								+ "ORDER BY event_no DESC";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<EventDto> list = new ArrayList<>();
		while(rs.next()) {
			EventDto edto = new EventDto(rs);
			list.add(edto);
		}
		
		con.close();
		return list;
	}
	
	// 단일조회
	public EventDto get(int event_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM event WHERE event_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, event_no);
		ResultSet rs = ps.executeQuery();

		EventDto edto = rs.next() ? new EventDto(rs) : null;// 3항 연산자

		con.close();

		return edto;
	}
	

	//페이지 개수 조회 메소드 x 2
		public int getCount() throws Exception {
			Connection con = getConnection();

			String sql = "SELECT count(*) FROM event";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();// 데이터는 무조건 1개 나오므로 이동
			int count = rs.getInt(1); 

			con.close();

			return count;

		}

		public int getCount(String type, String keyword) throws Exception {
			Connection con = getConnection();

			String sql = "SELECT count(*) FROM event WHERE instr(*1,?)>0";
			sql = sql.replace("*1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);

			con.close();

			return count;
		}


		
		// 시퀀스 생성
		// - dual 테이블은 오라클이 제공하는 임시 테이블
		public int getSequence() throws Exception {
			Connection con = getConnection();

			String sql = "SELECT event_seq.nextval FROM dual";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int seq = rs.getInt(1);// rs.getInt("NEXTVAL");

			con.close();

			return seq;
		}
		
		// 등록
	
		public void write(EventDto edto) throws Exception {

			Connection con = getConnection();

			// 아래와 같이 작성하면 미 작성된 항목들은 default 값이 적용
			String sql = "INSERT INTO event"
					+ "("
						+ "event_no, "
						+ "event_title, "
						+ "event_date, "
						+ "event_condition, "
						+ "event_content"
					+ ") "
			+ "VALUES(?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, edto.getEvent_no());
			ps.setString(2, edto.getEvent_title());
			ps.setString(3, edto.getEvent_date());
			ps.setString(4, edto.getEvent_condition());
			ps.setString(5, edto.getEvent_content());
			
			con.close();
		}


}