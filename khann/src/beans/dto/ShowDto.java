package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ShowDto {
	private int show_no;
	private String movie_name;
	private String theater_name;
	private String show_start;

public ShowDto(ResultSet rs)throws SQLException{
	
		this.setShow_no(rs.getInt("show_no"));
		this.setMovie_name(rs.getString("movie_name"));
		this.setTheater_name(rs.getString("theater_name"));
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

public String getMovie_name() {
	return movie_name;
}

public void setMovie_name(String movie_name) {
	this.movie_name = movie_name;
}

public String getTheater_name() {
	return theater_name;
}

public void setTheater_name(String theater_name) {
	this.theater_name = theater_name;
}

public String getShow_start() {
	return show_start;
}

public void setShow_start(String show_start) {
	this.show_start = show_start;
}
	

	
}

	
	
	
