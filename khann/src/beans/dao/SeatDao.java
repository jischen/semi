package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.SeatDto;

public class SeatDao {
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
//					"jdbc:oracle:thin:@localhost:1521:xe", "c##kh", "c##kh");
			return src.getConnection();

		}


		public void register(SeatDto sdto) throws Exception {
			Connection con = getConnection();
			
			String sql = "INSERT INTO seat VALUES(seat_seq.nextval,?,'일반석',?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, sdto.getTheater_no());
			ps.setString(2, sdto.getSeat_row());
			ps.setInt(3, sdto.getSeat_col());
			
			ps.execute();
			con.close();
			 
		}
	
	
}

