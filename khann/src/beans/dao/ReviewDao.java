package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

	//리뷰 등록 메소드

public void register(ReviewDto rdto) throws Exception{
	
	Connection con=getConnection();
	String sql="INSERT INTO review values(review_seq.nextval,'system','재미있다','1점',sysdate)";
	
	//아이디
	//내용
	//점수

PreparedStatement ps=con.prepareStatement(sql);

ps.setString(1,rdto.getReview_writer());
ps.setString(2,rdto.getReview_content());
ps.setString(3,rdto.getReview_score());

ps.execute();

con.close();
	
}

}
	
	
