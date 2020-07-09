package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CsDto {
	private int cs_no;
	private String cs_title;
	private String cs_writer;
	private String cs_content;
	private String cs_date;
	private int cs_read;
	
	public CsDto() {
		super();
	}

	public int getCs_no() {
		return cs_no;
	}

	public void setCs_no(int cs_no) {
		this.cs_no = cs_no;
	}

	public String getCs_title() {
		return cs_title;
	}

	public void setCs_title(String cs_title) {
		this.cs_title = cs_title;
	}

	public String getCs_writer() {
		return cs_writer;
	}

	public void setCs_writer(String cs_writer) {
		this.cs_writer = cs_writer;
	}

	public String getCs_content() {
		return cs_content;
	}

	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}

	public String getCs_date() {
		return cs_date;
	}

	public void setCs_date(String cs_date) {
		this.cs_date = cs_date;
	}

	public int getCs_read() {
		return cs_read;
	}

	public void setCs_read(int cs_read) {
		this.cs_read = cs_read;
	}

	public CsDto(ResultSet rs) throws SQLException {
		this.setCs_no(rs.getInt("cs_no"));
		this.setCs_title(rs.getString("cs_title"));
		this.setCs_writer(rs.getString("cs_writer"));
		this.setCs_content(rs.getString("cs_content"));
		this.setCs_date(rs.getString("cs_date"));
		this.setCs_read(rs.getInt("cs_read"));
	}
	
	public String getCs_time() {
		return cs_date.substring(11, 16);
	}
	
	public String getCs_day() {
		return cs_date.substring(0, 10);
	}
	
	public String getCs_autotime() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if(getCs_day().equals(today)) {
			return getCs_time();
		}
		else {
			return getCs_day();
		}
	}
}
