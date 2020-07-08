package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TheaterDto {
	private int theater_no;
	private String theater_name;
	private String theater_type;
	private int theater_row;
	private int theater_col;
	
	public TheaterDto() {
		super();
	}
	
	public TheaterDto(ResultSet rs) throws SQLException  {
		this.setTheater_no(rs.getInt("theater_no"));
		this.setTheater_name(rs.getString("theater_name"));
		this.setTheater_type(rs.getString("theater_type"));
		this.setTheater_row(rs.getInt("theater_row"));
		this.setTheater_col(rs.getInt("theater_col"));
	
	}
	
	
	
	
	
	public int getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
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
	
	
	
}
