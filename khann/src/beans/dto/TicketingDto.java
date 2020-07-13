package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketingDto {
	public int tickekting_no, member_no, show_no, seat_no, buy_no,
				ticketing_peoplenum, ticketing_price;
	public String ticketing_date;
	
	public TicketingDto(ResultSet rs) throws SQLException {
		this.setTickekting_no(rs.getInt("Ticketing_no"));
		this.setMember_no(rs.getInt("member_no"));
		this.setShow_no(rs.getInt("show_no"));
		this.setSeat_no(rs.getInt("seat_no"));
		this.setSeat_no(rs.getInt("buy_no"));
		this.setTicketing_peoplenum(rs.getInt("ticketing_peoplenum"));
		this.setTicketing_price(rs.getInt("ticketing_price"));
		this.setTicketing_date(rs.getString("ticketing_date"));
	}
	
	
	public int getMember_no() {
		return member_no;
	}
	
	
	
	
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
	public int getTickekting_no() {
		return tickekting_no;
	}
	public void setTickekting_no(int tickekting_no) {
		this.tickekting_no = tickekting_no;
	}
	public TicketingDto() {
		super();
	}
	
	
	public int getShow_no() {
		return show_no;
	}
	public void setShow_no(int show_no) {
		this.show_no = show_no;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public int getTicketing_peoplenum() {
		return ticketing_peoplenum;
	}
	public void setTicketing_peoplenum(int ticketing_peoplenum) {
		this.ticketing_peoplenum = ticketing_peoplenum;
	}
	public int getTicketing_price() {
		return ticketing_price;
	}
	public void setTicketing_price(int ticketing_price) {
		this.ticketing_price = ticketing_price;
	}
	public String getTicketing_date() {
		return ticketing_date;
	}
	public void setTicketing_date(String ticketing_date) {
		this.ticketing_date = ticketing_date;
	}
	
}
