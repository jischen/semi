package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.MemberDto;


public class MemberDao {
	//context.mxl에서 관리하는 자원 객체를 참조할 수 있도록 연결 코드 구현
		private static DataSource src; //리모컨 선언
		
		//static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
		static {
			//src = context.xml에서 관리하는 자원의 정보
			try {
				Context ctx = new InitialContext();//탐색 도구
				Context env = (Context)ctx.lookup("java:/comp/env");//context 설정 탐색
				src = (DataSource) env.lookup("jdbc/oracle");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //탐색 도구
		}
			
		
		//연결 메소드
		public Connection getConnection() throws Exception {
//			Class.forName("oracle.jdbc.OracleDriver");
//			return DriverManager.getConnection(
//			"jdbc:oracle:thin:@localhost:1521:xe", "c##semi", "c##semi");
			return src.getConnection();

		}

		//가입 메소드
		public void join(MemberDto mdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "INSERT INTO member VALUES(member_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?, 'Silver', sysdate, null)";
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

		//로그인 메소드
		public MemberDto Login(MemberDto mdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "SELECT * FROM member WHERE member_id=? AND member_pw=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mdto.getMember_id());
			ps.setString(2, mdto.getMember_pw());
			ResultSet rs = ps.executeQuery();
			
//			rs에는 데이터가 1개 있거나 아니면 없거나 둘 중 하나이므로 그에 따라 MemberDto를 준비하여 반환
//			MemberDto user = 객체 or null;
			MemberDto user;
			if(rs.next()) {//데이터가 있으면
				user = new MemberDto();
				
				user.setMember_id(rs.getString("member_id"));
				user.setMember_pw(rs.getString("member_pw"));
				user.setMember_name(rs.getString("member_name"));
				user.setPost(rs.getString("post"));
				user.setBase_addr(rs.getString("base_addr"));
				user.setExtra_addr(rs.getString("extra_addr"));
				user.setMember_birth(rs.getString("member_birth"));
				user.setMember_phone(rs.getString("member_phone"));
				user.setGrade(rs.getString("grade"));
				user.setMember_join(rs.getString("member_join"));
				user.setMember_login(rs.getString("member_login"));
			}
			else {
				user = null;
			}
			
			con.close();
			
			return user;
		}
		
		//로그인 시각 갱신 메소드
		public void updateLoginTime(String id) throws Exception{
			Connection con = getConnection();
			
			String sql = "UPDATE member SET member_login=sysdate WHERE member_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.execute();
			
			con.close();
		}
	
}
