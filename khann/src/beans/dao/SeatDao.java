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
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import beans.dto.SeatDto;
import beans.dto.ShowDto;
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
	
	
	
	public List<SeatDto> getList() throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from seat order by seat_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<SeatDto> list = new ArrayList<>();
		while(rs.next()) {
			SeatDto tdto = new SeatDto(rs);
			list.add(tdto);
		}
		
		con.close();
		return list;
		
	}
	
	
	public List<SeatDto> seatList(int theater_no) throws Exception{
		Connection con= getConnection();
		
		String sql="SELECT * FROM seat WHERE theater_no=?";
		
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, theater_no);
		ResultSet rs=ps.executeQuery();
		
		List<SeatDto> list=new ArrayList<>();

		while(rs.next()) {
			
			SeatDto sdto= new SeatDto(rs);
			list.add(sdto);
		}	
	con.close();
	return list;
	}
	
	
	
	public int seatChoice(int theater_no, int seat_row, int seat_col) throws Exception{
		Connection con= getConnection();
		String sql = "SELECT seat_no FROM seat WHERE theater_no =? AND seat_row=? AND seat_col=?";
		
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, theater_no);
		ps.setInt(2, seat_row);
		ps.setInt(3, seat_col);
		
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seat_no = rs.getInt(1);

		con.close();

		return seat_no;
		
	}
	
	
	
	public List<SeatDto> seat(int seat_no) throws Exception{
		Connection con= getConnection();
		
		String sql="SELECT * FROM seat WHERE seat_no=?";
		
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, seat_no);
		ResultSet rs=ps.executeQuery();
		
		List<SeatDto> list=new ArrayList<>();

		while(rs.next()) {
			
			SeatDto sdto= new SeatDto(rs);
			list.add(sdto);
		}	
	con.close();
	return list;
	}
	
	
	
	
	
	public SeatDto get(int Seat_no) throws Exception {
		Connection con = getConnection();
		String sql = "select * from Seat where Seat_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, Seat_no);
		ResultSet rs = ps.executeQuery();

		SeatDto sdto;
		if (rs.next()) {
			sdto = new SeatDto(rs);
	
		}

		else {

			sdto = null;

		}
		con.close();
		return sdto;

	}
	
	
	
	
	
	
	
}

