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
import beans.dto.CsDto;

public class AskDao {
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
	
	//목록 메소드
	public List<AskDto> getList() throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM ask ORDER BY ask_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<AskDto> list = new ArrayList<>();
		while(rs.next()) {
			AskDto adto = new AskDto(rs);
			list.add(adto);
		}
		return list;
	}
	
	//시퀀스 생성
	public int getSeqeunce() throws Exception{
		Connection con = getConnection();
		String sql = "SELECT ask_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}
	
	//등록 메소드
	public void write(AskDto adto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO ask(ask_no, ask_head, ask_title, ask_writer, ask_content) VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
	
		ps.setInt(1, adto.getAsk_no());
		ps.setString(2, adto.getAsk_head());
		ps.setString(3, adto.getAsk_title());
		ps.setString(4, adto.getAsk_writer());
		ps.setString(5, adto.getAsk_content());
		ps.execute();
		
		con.close();
	}
	//단일조회
	public AskDto get(int ask_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM ask WHERE ask_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ask_no);
		ResultSet rs = ps.executeQuery();
		
		AskDto adto = rs.next()?new AskDto(rs):null;
		con.close();
		return adto;
	}
	
	//진행상태 검색 메소드
	public List<AskDto> searchHead(String head) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM ask WHERE instr(ask_head, ?) > 0 ORDER BY ask_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, head);
		ResultSet rs = ps.executeQuery();
		
		List<AskDto> list = new ArrayList<>();
		while(rs.next()) {
			AskDto adto = new AskDto(rs);
			list.add(adto);
		}
		
		con.close();
		return list;
	}
		
		//게시글 수정
		public void edit(AskDto adto) throws Exception {
			Connection con = getConnection();
			
			String sql = "UPDATE ask SET "
								+ "ask_title=?, ask_head=?, ask_content=? "
								+ "where ask_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, adto.getAsk_title());
			ps.setString(2, adto.getAsk_head());
			ps.setString(3, adto.getAsk_content());
			ps.setInt(4, adto.getAsk_no());
			ps.execute();
			
			con.close();
		}
		
		//게시글 삭제
		public void delete(int ask_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "DELETE ask WHERE ask_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ask_no);
			ps.execute();
			
			con.close();
		}

		//댓글 개수 카운트
		public void editReplycount(int ask_no) throws Exception {
			Connection con = getConnection();
			
			String sql = "UPDATE ask SET ask_replycount = ("
					+ "SELECT count(*) FROM reply WHERE reply_origin = ?) "
					+ "WHERE ask_no = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ask_no);
			ps.setInt(2, ask_no);
			ps.execute();
			
			con.close();
		}
}
