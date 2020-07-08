package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CsDto {
	private int cs_no;
	private String cs_title;
	private String cs_content;
	private int cs_read;
	public CsDto() {
		super();
	}
	public CsDto(ResultSet rs) throws SQLException {
		this.setCs_no(rs.getInt("cs_no"));
		this.setCs_title(rs.getString("cs_title"));
		this.setCs_content(rs.getString("cs_content"));
		this.setCs_read(rs.getInt("cs_read"));
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
	public String getCs_content() {
		return cs_content;
	}
	public void setCs_content(String cs_content) {
		this.cs_content = cs_content;
	}
	public int getCs_read() {
		return cs_read;
	}
	public void setCs_read(int cs_read) {
		this.cs_read = cs_read;
	}
	
}
