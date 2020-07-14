package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AskDto {
	private int ask_no, reply_count;

	private String ask_head, ask_title, ask_writer, ask_content, ask_date;
	
	public AskDto() {
		super();
	}

	public int getReply_count() {
		return reply_count;
	}
	
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	
	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public String getAsk_head() {
		return ask_head;
	}

	public void setAsk_head(String ask_head) {
		this.ask_head = ask_head;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_writer() {
		return ask_writer;
	}

	public void setAsk_writer(String ask_writer) {
		this.ask_writer = ask_writer;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}
	
	public AskDto(ResultSet rs) throws SQLException {
		this.setAsk_no(rs.getInt("ask_no"));
		this.setAsk_head(rs.getString("ask_head"));
		this.setAsk_title(rs.getString("ask_title"));
		this.setAsk_writer(rs.getString("ask_writer"));
		this.setAsk_content(rs.getString("ask_content"));
		this.setAsk_date(rs.getString("ask_date"));
		this.setAsk_replycount(rs.getInt("ask_replycount"));
	}
	
	public String getAsk_time() {
		return ask_date.substring(11, 16);
	}
	
	public String getAsk_day() {
		return ask_date.substring(0, 10);
	}
	
	public String getAsk_autotime() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if(getAsk_day().equals(today)) {
			return getAsk_time();
		}
		else {
			return getAsk_day();
		}
	}
	
	private int ask_replycount;
	public int getAsk_replycount() {
		return ask_replycount;
	}
	public void setAsk_replycount(int ask_replycount) {
		this.ask_replycount = ask_replycount;
	}

}
