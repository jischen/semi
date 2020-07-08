package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketingDto {
	private int show_no, movie_no, theater_no, theater_row, theater_col;
	private String show_start, theater_name, theater_type;
	
	public TicketingDto(ResultSet rs) throws SQLException  {
		this.setShow_no(rs.getInt("show_no"));
		this.setMovie_no(rs.getInt("movie_no"));
		this.setTheater_no(rs.getInt("theater_no"));
		this.setTheater_row(rs.getInt("theater_row"));
		this.setTheater_col(rs.getInt("theater_col"));
		this.setShow_start(rs.getString("show_start"));
		this.setTheater_name(rs.getString("theater_name"));
		this.setTheater_type(rs.getString("theater_type"));
		
		
	}

	public int getShow_no() {
		return show_no;
	}

	public void setShow_no(int show_no) {
		this.show_no = show_no;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public int getTheater_no() {
		return theater_no;
	}

	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}

	public int getTheater_row() {
		return theater_row;
	}

	public void setTheater_row(int theater_row) {
		this.theater_row = theater_row;
	}

	public int getTheater_col() {
		return theater_col;
	}

	public void setTheater_col(int theater_col) {
		this.theater_col = theater_col;
	}

	public String getShow_start() {
		return show_start;
	}

	public void setShow_start(String show_start) {
		this.show_start = show_start;
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public String getTheater_type() {
		return theater_type;
	}

	public void setTheater_type(String theater_type) {
		this.theater_type = theater_type;
	}

	public TicketingDto() {
		super();
	}
	
	
}
