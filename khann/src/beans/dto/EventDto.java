package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EventDto {

	private int event_no;
	private String event_title, event_date, event_condition, event_content;
	
		
	public EventDto() {
		super();
	}
	
	public EventDto(ResultSet rs) throws SQLException{
		this.setEvent_no(rs.getInt("event_no"));
		this.setEvent_title(rs.getString("event_title"));
		this.setEvent_date(rs.getString("event_date"));
		this.setEvent_condition(rs.getString("event_condition"));
		this.setEvent_content(rs.getString("event_content"));
	}
	
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}
	public String getEvent_condition() {
		return event_condition;
	}
	public void setEvent_condition(String event_condition) {
		this.event_condition = event_condition;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	
	//메소드 2개를 추가
	//[1] getBoard_time() : 시간을 반환하는 메소드
	//[2] getBoard_day() : 날짜를 반환하는 메소드
	//[3] getBoard_autotime() : 자동으로 오늘날짜에는 시간을, 아닌 경우는 날짜를 반환
	public String getEvent_time() {
		return event_date.substring(11, 16);
	}
	
	public String getEvent_day() {
		return event_date.substring(0, 10);
	}
	
	public String getEvent_autotime() {
//		Date d = new Date();
//		Format f = new SimpleDateFormat("yyyy-MM-dd");
//		String today = f.format(d);
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); //date는 util로 import 해야함 
		if(getEvent_date().equals(today)) {//오늘 작성한 글이라면
			return getEvent_time();
		}
		else {//아니라면
			return getEvent_day();
		}
	}
	

	
}
