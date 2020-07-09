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

import beans.dto.TheaterDto;
import beans.dto.TicketingDto;


public class ShowDao {
private static DataSource src; //리모컨 선언
	
	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");//context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} 
	}
	
	public Connection getConnection() throws Exception{
		
		return src.getConnection();
	}
	
	public List<TicketingDto> getList(int move_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT s.show_no, s.movie_no, s.show_start, t.* FROM show s INNER JOIN theater t ON s.theater_no = t.theater_no WHERE movie_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, move_no);
		ResultSet rs = ps.executeQuery();
		
		List<TicketingDto> list = new ArrayList<>();
		while(rs.next()) {
			TicketingDto tdto = new TicketingDto(rs);
			list.add(tdto);
		}
		
		con.close();
		return list;
	}
	
	
	
}
