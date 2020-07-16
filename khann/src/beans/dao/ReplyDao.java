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

import beans.dto.AskDto;
import beans.dto.ReplyDto;

public class ReplyDao {
	private static DataSource src;
	
	static {
		
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			
			e.printStackTrace();
		}
	}

	//연결 메소드
	public Connection getConnection() throws Exception {

		return src.getConnection();
	}
	
	//등록
	public void write(ReplyDto rdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO reply VALUES("
									+ "reply_seq.nextval, ?, ?, sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rdto.getReply_writer());
		ps.setString(2, rdto.getReply_content());
		ps.setInt(3, rdto.getReply_origin());
		ps.execute();
		
		con.close();
	}
	
	//목록
	public List<ReplyDto> getList(int reply_origin) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM reply "
							+ "WHERE reply_origin=? "
							+ "ORDER BY reply_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_origin);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		while(rs.next()) {
			ReplyDto rdto = new ReplyDto(rs);
			list.add(rdto);			
		}
		
		con.close();
		
		return list;
	}
	
	//댓글 수정
			public void edit(ReplyDto rdto) throws Exception {
				Connection con = getConnection();
				
				String sql = "UPDATE reply SET "
									+ "reply_content=?, reply_date=sysdate "
									+ "WHERE reply_no=? and reply_origin=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, rdto.getReply_content());
				ps.setInt(2, rdto.getReply_no());
				ps.setInt(3, rdto.getReply_origin());
				ps.execute();
				
				con.close();
			}
			
	//삭제
	public void delete(int reply_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "DELETE reply WHERE reply_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reply_no);
		ps.execute();
		
		con.close();
	}
}

