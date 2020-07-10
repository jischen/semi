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

import beans.dto.CsDto;

public class CsDao {
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
	public List<CsDto> getList() throws Exception{
		Connection con = getConnection();
		String sql = "SELECT * FROM cs ORDER BY cs_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<CsDto> list = new ArrayList<>();
		while(rs.next()) {
			CsDto cdto = new CsDto(rs);
			list.add(cdto);
		}
		return list;
	}
	
	//시퀀스 생성
	public int getSeqeunce() throws Exception{
		Connection con = getConnection();
		String sql = "SELECT cs_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		return seq;
	}
	
	//등록 메소드
	public void write(CsDto cdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "INSERT INTO cs(cs_no, cs_head, cs_title, cs_writer, cs_content) VALUES(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
	
		ps.setInt(1, cdto.getCs_no());
		ps.setString(2, cdto.getCs_head());
		ps.setString(3, cdto.getCs_title());
		ps.setString(4, cdto.getCs_writer());
		ps.setString(5, cdto.getCs_content());
		ps.execute();
		
		con.close();
	}
	//단일조회
	public CsDto get(int cs_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM cs WHERE cs_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cs_no);
		ResultSet rs = ps.executeQuery();
		
		CsDto cdto = rs.next()?new CsDto(rs):null;
		con.close();
		return cdto;
	}
	//검색 메소드
	public List<CsDto> search(String keyword) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM cs WHERE instr(cs_title, ?) > 0 ORDER BY cs_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<CsDto> list = new ArrayList<>();
		while(rs.next()) {
			CsDto cdto = new CsDto(rs);
			list.add(cdto);
		}
		
		con.close();
		return list;
	}
	//검색1 메소드
	public List<CsDto> searchHead(String head) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM cs WHERE instr(cs_head, ?) > 0 ORDER BY cs_no DESC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, head);
		ResultSet rs = ps.executeQuery();
		
		List<CsDto> list = new ArrayList<>();
		while(rs.next()) {
			CsDto cdto = new CsDto(rs);
			list.add(cdto);
		}
		
		con.close();
		return list;
	}
	
	//조회수 증가
		public void plusReadcount(int cs_no, String member_id) throws Exception {
			Connection con = getConnection();
			
			String sql = "UPDATE cs "
							+ "SET cs_read = cs_read + 1 "
							+ "WHERE cs_no = ? and cs_writer != ?";
				
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cs_no);
			ps.setString(2, member_id);
			ps.execute();
			
			con.close();
		}
		
		//게시글 수정
		public void edit(CsDto cdto) throws Exception {
			Connection con = getConnection();
			
			String sql = "UPDATE cs SET "
								+ "cs_title=?, cs_head=?, cs_content=? "
								+ "where cs_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cdto.getCs_title());
			ps.setString(2, cdto.getCs_head());
			ps.setString(3, cdto.getCs_content());
			ps.setInt(4, cdto.getCs_no());
			ps.execute();
			
			con.close();
		}
		
		//게시글 삭제
		public void delete(int cs_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "DELETE cs WHERE cs_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cs_no);
			ps.execute();
			
			con.close();
		}
}
