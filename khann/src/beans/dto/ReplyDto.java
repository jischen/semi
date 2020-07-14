package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyDto {
	private int reply_no;
	private String reply_writer;
	private String reply_content;
	private String reply_date;
	private int reply_origin;
	public ReplyDto() {
		super();
	}
	public ReplyDto(ResultSet rs) throws SQLException {
		this.setReply_no(rs.getInt("reply_no"));
		this.setReply_writer(rs.getString("reply_writer"));
		this.setReply_content(rs.getString("reply_content"));
		this.setReply_date(rs.getString("reply_date"));
		this.setReply_origin(rs.getInt("reply_origin"));
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	public int getReply_origin() {
		return reply_origin;
	}
	public void setReply_origin(int reply_origin) {
		this.reply_origin = reply_origin;
	}
}