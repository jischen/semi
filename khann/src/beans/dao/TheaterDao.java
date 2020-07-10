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


}