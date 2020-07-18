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

import beans.dto.ReviewDto;

public class ReviewDao {

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

	public Connection getConnection() throws Exception {

		return src.getConnection();
	}

	//리뷰목록
	public List<ReviewDto> getList() throws Exception{
		Connection con=getConnection();
		
		String sql="SELECT *FROM review ORDER BY REVIEW_NO";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		
		List<ReviewDto>list = new ArrayList<>();
		while(rs.next()) {
			ReviewDto rdto=new ReviewDto(rs);
			list.add(rdto);
			
		}
		con.close();
		return list;
		
	}
	
	// 리뷰 시퀀스 생성
	//public int getSeq() throws Exception {
		//Connection con = getConnection();
		//String sql = "SELECT review_seq.nextval FROM dual";
	//	PreparedStatement ps = con.prepareStatement(sql);
		//ResultSet rs = ps.executeQuery();
		//rs.next();
		//int seq = rs.getInt(1);
		//con.close();
		//return seq;

	//}
	// 리뷰 등록 메소드

	public void register(ReviewDto rdto) throws Exception {

		Connection con = getConnection();
		String sql = "INSERT INTO review values(review_seq.nextval,?,?,?,?,sysdate)";

		// 아이디
		// 내용
		// 점수

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rdto.getReview_writer());
		ps.setInt(2, rdto.getReview_movie());
		ps.setString(3, rdto.getReview_content());
		ps.setString(4, rdto.getReview_score());
	
		ps.execute();

		con.close();

	}

//리뷰 단일조회

	public ReviewDto get(int review_no) throws Exception {

		Connection con = getConnection();
		String sql = "SELECT *FROM review WHERE review_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, review_no);
		ResultSet rs = ps.executeQuery();

		ReviewDto rdto;
		if (rs.next()) {
			rdto = new ReviewDto(rs);
			rdto.setReview_no(Integer.parseInt(rs.getString("review_no")));
			rdto.setReview_movie(rs.getInt("review_movie"));
			rdto.setReview_writer(rs.getString("review_writer"));
			rdto.setReview_content(rs.getString("review_content"));
			rdto.setReview_score(rs.getString("review_score"));
			rdto.setReview_date(rs.getString("review_date"));
			
			
		} else {
			rdto = null;

		}
		con.close();
		
		return rdto;
	}
//리뷰 수정 메소드
	
	public void reviewedit(ReviewDto rdto) throws Exception{
		
		Connection con=getConnection();
		String sql="UPDATE review SET review_movie=?, review_writer=?, review_content=?, review_score=? WHERE review_no=?";
		PreparedStatement ps= con.prepareStatement(sql);
		
		ps.setInt(1, rdto.getReview_movie());
		ps.setString(2, rdto.getReview_writer());
		ps.setString(3, rdto.getReview_content());
		ps.setString(4, rdto.getReview_score());
		ps.setInt(5, rdto.getReview_no());

		ps.execute();
		
		con.close();		
		
	}

	//시퀀스만

	public int getSeq() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT review_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
	
	
	public void delete(int review_no) throws Exception{
		Connection con=getConnection();
		String sql="DELETE review WHERE review_no=?";
		
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, review_no);
		
		ps.execute();
		
	}
	
	public int getCount(String type, String keyword) throws Exception{
		Connection con= getConnection();
		String sql="SELECT count(*) from review where instr(#1,?)>0";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs=ps.executeQuery();
		rs.next();
		
		int count=rs.getInt(1);
		
	con.close();
	return count;
	}
	
}