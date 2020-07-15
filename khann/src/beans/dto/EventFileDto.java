package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

//Event_file테이블을 옮겨 담기 위한 DTO클래스
public class EventFileDto {

	private int event_file_no;
	private String event_file_name;
	private String event_file_type;
	private long event_file_size;
	private int event_file_origin;

	public EventFileDto(ResultSet rs) throws SQLException {
		this.setEvent_file_no(rs.getInt("event_file_no"));
		this.setEvent_file_name(rs.getString("event_file_name"));
		this.setEvent_file_type(rs.getString("event_file_type"));
		this.setEvent_file_size(rs.getLong("event_file_size"));
		this.setEvent_file_origin(rs.getInt("event_file_origin"));
	}

	public int getEvent_file_no() {
		return event_file_no;
	}

	public void setEvent_file_no(int event_file_no) {
		this.event_file_no = event_file_no;
	}

	public String getEvent_file_name() {
		return event_file_name;
	}

	public void setEvent_file_name(String event_file_name) {
		this.event_file_name = event_file_name;
	}

	public String getEvent_file_type() {
		return event_file_type;
	}

	public void setEvent_file_type(String event_file_type) {
		this.event_file_type = event_file_type;
	}

	public long getEvent_file_size() {
		return event_file_size;
	}

	public void setEvent_file_size(long event_file_size) {
		this.event_file_size = event_file_size;
	}

	public int getEvent_file_origin() {
		return event_file_origin;
	}

	public void setEvent_file_origin(int event_file_origin) {
		this.event_file_origin = event_file_origin;
	}

	public EventFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

}
