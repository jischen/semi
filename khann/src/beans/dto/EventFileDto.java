package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

//Event_file테이블을 옮겨 담기 위한 DTO클래스
public class EventFileDto {

	private int Event_file_no; 
	private String Event_file_name; 
	private String Event_file_type; 
	private long Event_file_size; 
	private int Event_file_origin;
	
	public EventFileDto(ResultSet rs) throws SQLException {
		this.setEvent_file_no(rs.getInt("Event_file_no"));
		this.setEvent_file_name(rs.getString("Event_file_name"));
		this.setEvent_file_type(rs.getString("Event_file_type"));
		this.setEvent_file_size(rs.getLong("Event_file_size"));
		this.setEvent_file_origin(rs.getInt("Event_file_origin"));
	}
	
	
	public int getEvent_file_no() {
		return Event_file_no;
	}
	public void setEvent_file_no(int Event_file_no) {
		this.Event_file_no = Event_file_no;
	}
	public String getEvent_file_name() {
		return Event_file_name;
	}
	public void setEvent_file_name(String Event_file_name) {
		this.Event_file_name = Event_file_name;
	}
	public String getEvent_file_type() {
		return Event_file_type;
	}
	public void setEvent_file_type(String Event_file_type) {
		this.Event_file_type = Event_file_type;
	}
	public long getEvent_file_size() {
		return Event_file_size;
	}
	public void setEvent_file_size(long Event_file_size) {
		this.Event_file_size = Event_file_size;
	}
	public int getEvent_file_origin() {
		return Event_file_origin;
	}
	public void setEvent_file_origin(int Event_file_origin) {
		this.Event_file_origin = Event_file_origin;
	}
	
	public EventFileDto() {
		super();
	}
	
	
}
