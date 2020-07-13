package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ShowDto {
	private int show_no;
	private int movie_no;
	private int theater_no;
	private String show_start;
	
	
	
public ShowDto(ResultSet rs)throws SQLException{
		this.setShow_no(rs.getInt("show_no"));
		this.setMovie_no(rs.getInt("movie_no"));
		this.setTheater_no(rs.getInt("theater_no"));
		this.setShow_start(rs.getString("show_start"));
		
		
	}
	
	public ShowDto() {
		super();
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


	public String getShow_start() {
		return show_start;
	}


	public void setShow_start(String show_start) {
		this.show_start = show_start;
	}
	
	
	
	
}