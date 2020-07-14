package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SeatDto {
	private int seat_no;
	private int theater_no;
	private int seat_row;
	private int seat_col;
	
	
	public SeatDto(ResultSet rs) throws SQLException  {
		this.setSeat_no(rs.getInt("seat_no"));
		this.setTheater_no(rs.getInt("theater_no"));
		this.setSeat_row(rs.getInt("seat_row"));
		this.setSeat_col(rs.getInt("seat_col"));
	}
	
	
	
	
	
	
	public SeatDto() {
		super();
	}


	public int getSeat_no() {
		return seat_no;
	}


	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}


	public int getTheater_no() {
		return theater_no;
	}


	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}


	public int getSeat_row() {
		return seat_row;
	}


	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}


	public int getSeat_col() {
		return seat_col;
	}


	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}
	
	
	
	
}
