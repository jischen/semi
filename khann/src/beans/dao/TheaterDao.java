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

import beans.dto.MovieDto;
import beans.dto.SeatDto;
import beans.dto.TheaterDto;

public class TheaterDao {
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

	//등록 메소드
	public void register(TheaterDto tdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "INSERT INTO theater VALUES(theater_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, tdto.getTheater_name());
		ps.setString(2, tdto.getTheater_type());
		ps.setInt(3, tdto.getTheater_row());
		ps.setInt(4, tdto.getTheater_col());
		
		ps.execute();
		
		con.close();
	}
	
	
	
	public List<TheaterDto> getList() throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from theater order by theater_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<TheaterDto> list = new ArrayList<>();
		while(rs.next()) {
			TheaterDto tdto = new TheaterDto(rs);
			list.add(tdto);
		}
		
		con.close();
		return list;
		
	}
	
	
	public void delete(String theater_name) throws Exception{
		Connection con = getConnection();
		
		String sql = "delete theater where theater_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, theater_name);
		ps.execute();
		
		con.close();
		
	}
	
	
	
	public TheaterDto get(int theater_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM theater WHERE theater_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, theater_no);
		ResultSet rs = ps.executeQuery();
		

		TheaterDto tdto;
		if(rs.next()) {
			tdto = new TheaterDto(rs);
			tdto.setTheater_no(Integer.parseInt(rs.getString("theater_no")));
			tdto.setTheater_name(rs.getString("theater_name"));
			tdto.setTheater_type(rs.getString("theater_type"));
			tdto.setTheater_row(Integer.parseInt(rs.getString("theater_row")));
			tdto.setTheater_col(Integer.parseInt(rs.getString("theater_col")));
		}
		else {
			tdto = null;
		}
		
		con.close();
		
		return tdto;
	}
	
	

		public int getSeq() throws Exception {
			Connection con = getConnection();
			String sql = "SELECT theater_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		con.close();
		return seq;

	}
		
		
		
		
		public TheaterDto getTheaterName(String theater_name) throws Exception{
			Connection con = getConnection();
			
			String sql = "SELECT * FROM theater WHERE theater_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, theater_name);
			ResultSet rs = ps.executeQuery();
			

			TheaterDto tdto;
			if(rs.next()) {
				tdto = new TheaterDto(rs);
				
				
			}
			else {
				tdto = null;
			}
			
			con.close();
			
			return tdto;
		}	
		
		
	
	
	


}