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

import beans.dto.ShowDto;
import beans.dto.TheaterDto;
import beans.dto.TicketingDto;
import oracle.jdbc.proxy.annotation.Pre;

public class ShowDao {
	private static DataSource src; // 리모컨 선언

	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");// context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {

		return src.getConnection();
	}

	public void insert(ShowDto sdto) throws Exception {

		Connection con = getConnection();

		String sql = "INSERT INTO show values(show_seq.nextval,?,?,?)";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, sdto.getMovie_no());
		ps.setInt(2, sdto.getTheater_no());
		ps.setString(3, sdto.getShow_start());

		ps.execute();

		con.close();

	}

	// 리스트

	public List<ShowDto> getList() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT *FROM show ORDER BY show_no ASC";

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<ShowDto> list = new ArrayList<>();
		while (rs.next()) {

			ShowDto sdto = new ShowDto(rs);
			list.add(sdto);

		}
		con.close();
		return list;
	}

	// 삭제

	public void delete(int show_no) throws Exception {

		Connection con = getConnection();
		String sql = "DELETE show WHERE show_no=?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, show_no);
		ps.execute();

		con.close();

	}
	// 단일조회

	public ShowDto get(int show_no) throws Exception {
		Connection con = getConnection();
		String sql = "select *from show where show_no=?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, show_no);
		ResultSet rs = ps.executeQuery();

		ShowDto sdto;
		if (rs.next()) {
			sdto = new ShowDto(rs);
			sdto.setShow_no(Integer.parseInt(rs.getString("show_no")));
			sdto.setMovie_no(Integer.parseInt(rs.getString("movie_no")));
			sdto.setTheater_no(Integer.parseInt(rs.getString("theater_no")));
			sdto.setShow_start(rs.getString("show_start"));

		}

		else {

			sdto = null;

		}
		con.close();
		return sdto;

	}

	public void showedit(ShowDto sdto) throws Exception {
		Connection con = getConnection();
		String sql = "UPDATE show SET movie_no=?, theater_no=?, show_start=? WHERE show_no=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, sdto.getMovie_no());
		ps.setInt(2, sdto.getTheater_no());
		ps.setString(3, sdto.getShow_start());
		ps.setInt(4, sdto.getShow_no());

		ps.execute();

		con.close();
	}

	public int Sequen() throws Exception {

		Connection con = getConnection();

		String sql = "SELECT show_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;

	}
	

}
