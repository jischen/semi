package beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import beans.dto.SeatDto;
import beans.dto.TheaterDto;

public class SeatDao {
	
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
	public void register(SeatDto sdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "INSERT INTO seat values(seat_seq.nextval, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, sdto.getTheater_no());
		ps.setInt(2, sdto.getSeat_row());
		ps.setInt(3, sdto.getSeat_col());
		
		ps.execute();
		con.close();
		
	}
	
	
}

