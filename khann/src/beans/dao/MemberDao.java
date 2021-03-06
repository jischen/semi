package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.MemberDto;
import beans.dto.MovieDto;

public class MemberDao {
	// context.mxl에서 관리하는 자원 객체를 참조할 수 있도록 연결 코드 구현
	private static DataSource src; // 리모컨 선언

	// static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
	static {
		// src = context.xml에서 관리하는 자원의 정보
		try {
			Context ctx = new InitialContext();// 탐색 도구
			Context env = (Context) ctx.lookup("java:/comp/env");// context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 탐색 도구
	}

	// 연결 메소드
	public Connection getConnection() throws Exception {
//			Class.forName("oracle.jdbc.OracleDriver");
//			return DriverManager.getConnection(
//			"jdbc:oracle:thin:@localhost:1521:xe", "c##semi", "c##semi");
		return src.getConnection();

	}

	// 가입 메소드
	public void join(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO member VALUES(member_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?, 'Silver', 10000, sysdate, '')";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ps.setString(3, mdto.getMember_name());
		ps.setString(4, mdto.getPost());
		ps.setString(5, mdto.getBase_addr());
		ps.setString(6, mdto.getExtra_addr());
		ps.setString(7, mdto.getMember_birth());
		ps.setString(8, mdto.getMember_phone());

		ps.execute();

		con.close();
	}

	// 로그인 메소드
	public MemberDto Login(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ResultSet rs = ps.executeQuery();

//			rs에는 데이터가 1개 있거나 아니면 없거나 둘 중 하나이므로 그에 따라 MemberDto를 준비하여 반환
//			MemberDto user = 객체 or null;
		MemberDto user;
		if (rs.next()) {// 데이터가 있으면
			user = new MemberDto(rs);
		} else {
			user = null;
		}

		con.close();

		return user;
	}

	// 로그인 시각 갱신 메소드
	public void updateLoginTime(String id) throws Exception {
		Connection con = getConnection();

		String sql = "UPDATE member SET member_login=sysdate WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.execute();

		con.close();
	}

//아이디 찾기 메소드
	public String findId(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT member_id FROM member "
				+ "WHERE member_name=? and member_phone=? and member_birth=to_date(?, 'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_name());
		ps.setString(2, mdto.getMember_phone());
		ps.setString(3, mdto.getMember_birth());
		ResultSet rs = ps.executeQuery();

//	String member_id = 추출한 아이디 or null;
		String member_id;
		if (rs.next()) {
			member_id = rs.getString("member_id");// rs.getString(1)
		} else {
			member_id = null;
		}

		con.close();

		return member_id;
	}	
		//단일조회 메소드
		public MemberDto get(String member_id) throws Exception{
			Connection con = getConnection();
			
			String sql = "SELECT * FROM member WHERE member_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, member_id);
			ResultSet rs = ps.executeQuery();
			
//			MemberDto mdto = 객체 or null;
			MemberDto mdto;
			if(rs.next()) {
				mdto = new MemberDto(rs);
			}
			else {
				mdto = null;
			}
			
			con.close();
			
			return mdto;
			
	}
	
	//탈퇴 메소드
	public void exit(String member_id) throws Exception{
		Connection con = getConnection();

		String sql = "DELETE member WHERE member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ps.execute();

		con.close();
	}

	//정보 변경 메소드
	public void changeInfo(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "UPDATE member SET post=?, base_addr=?, extra_addr=?, member_phone=? WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getPost());
		ps.setString(2, mdto.getBase_addr());
		ps.setString(3, mdto.getExtra_addr());
		ps.setString(4, mdto.getMember_phone());
		ps.setString(5, mdto.getMember_id());
		ps.execute();

		con.close();
	}
	//비밀번호 변경 메소드
	public void changePassword(MemberDto mdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "UPDATE member SET member_pw=? WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_pw());
		ps.setString(2, mdto.getMember_id());
		ps.execute();
		
		con.close();
	}
	
	
	

	//아이디 중복확인 메소드
	public MemberDto checkOverlap(String request_id) throws Exception{
		Connection con = getConnection();
			
		String sql = "SELECT * FROM member WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request_id);
		ResultSet rs = ps.executeQuery();
		
		
		MemberDto mdto;
		if(rs.next()) {
			mdto = new MemberDto(rs);
		}
		else {
			mdto = null;
		}
		
		con.close();
		
		return mdto;
		
	}
	
	
	
	
	
	
	
	public MemberDto getID(String member_id) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM member WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, member_id);
		ResultSet rs = ps.executeQuery();
		

		MemberDto mdto;
		if(rs.next()) {
			mdto = new MemberDto(rs);
			
			
		}
		else {
			mdto = null;
		}
		
		con.close();
		
		return mdto;
	}
	
	
	
	public void changePoint(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "UPDATE member SET member_point=? WHERE member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, mdto.getMember_point());
		ps.setString(2, mdto.getMember_id());
		ps.execute();

		con.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}