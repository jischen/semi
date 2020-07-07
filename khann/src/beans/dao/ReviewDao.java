package beans.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.ReviewDto;


public class ReviewDao {

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
	
	public Connection getConnection() throws Exception{
		
		return src.getConnection();
	}


public void register(ReviewDto rdto) throws Exception{
	
	Connection con=getConnection();
	String sql=""
	
	
	
	
}

}
	
	
