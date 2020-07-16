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

import beans.dto.SeatDto;
import beans.dto.TheaterDto;
import beans.dto.TicketingDto;

public class TicketingDao {
	private static final String PreparedStatement = null;
	private static DataSource src;

	static {

		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {

			e.printStackTrace();
		}
	}

	// 연결 메소드
	public Connection getConnection() throws Exception {

		return src.getConnection();
	}

	// 등록 메소드
	public void register(TicketingDto tdto) throws Exception {
		Connection con = getConnection();

		String sql = "INSERT INTO ticketing " + "values(ticketing_seq.nextval, ?, ?, ?, sysdate, ?, 8000)";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, tdto.member_no);
		ps.setInt(2, tdto.show_no);
		ps.setInt(3, tdto.seat_no);
		ps.setInt(4, tdto.ticketing_peoplenum);

		ps.execute();
		con.close();

	}

	public int Sequen() throws Exception {

		Connection con = getConnection();

		String sql = "SELECT ticketing_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;

	}

	public List<TicketingDto> getList(int member_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT t.* " + "FROM member m INNER JOIN TICKETING t "
				+ "ON m.member_no = t.member_no WHERE m.member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();

		List<TicketingDto> list = new ArrayList<>();
		while (rs.next()) {
			TicketingDto tdto = new TicketingDto(rs);
			list.add(tdto);
		}

		con.close();
		return list;

	}
	
	
	public List<TicketingDto> getList() throws Exception {
		Connection con = getConnection();

		String sql = "select * from ticketing order by ticketing_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<TicketingDto> list = new ArrayList<>();
		while (rs.next()) {
			TicketingDto tdto = new TicketingDto(rs);
			list.add(tdto);
		}

		con.close();
		return list;

	}
	
	
	
	public List<TicketingDto> choiceSeat(int show_no) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT *" 
				 + " FROM TICKETING T INNER JOIN seat S "
				 + " ON t.SEAT_NO = s.SEAT_NO WHERE show_no =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, show_no);
		ResultSet rs = ps.executeQuery();

		List<TicketingDto> list = new ArrayList<>();
		while (rs.next()) {
			TicketingDto tdto = new TicketingDto(rs);
			list.add(tdto);
		}

		con.close();
		return list;

	}
	
	
	
	
	
	
	
	
	

}
