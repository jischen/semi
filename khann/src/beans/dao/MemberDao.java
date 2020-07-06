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


		
		//아이디 찾기 메소드
		public String findId(MemberDto mdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "SELECT member_id FROM member "
					+ "WHERE member_name=? and member_phone=? and member_birth=to_date(?, 'YYYY-MM-DD')";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mdto.getMember_name());
			ps.setString(2, mdto.getMember_phone());
			ps.setString(3, mdto.getMember_birth());
			ResultSet rs = ps.executeQuery();
			
//			String member_id = 추출한 아이디 or null;
			String member_id;
			if(rs.next()) {
				member_id = rs.getString("member_id");//rs.getString(1)
			}
			else {
				member_id = null;
			}
			
			con.close();
			
			return member_id;
		}
		
		

	
	
		
		
		
	
}
