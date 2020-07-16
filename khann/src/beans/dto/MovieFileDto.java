package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieFileDto {

	private int movie_file_no;
	private String movie_file_name;
	private long movie_file_size;
	private String movie_file_type;
	private int movie_file_origin;
	
	public MovieFileDto(ResultSet rs) throws SQLException {
		this.setMovie_file_no(rs.getInt("movie_file_no"));
		this.setMovie_file_name(rs.getString("movie_file_name"));
		this.setMovie_file_type(rs.getString("movie_file_type"));
		this.setMovie_file_size(rs.getLong("movie_file_size"));
		this.setMovie_file_origin(rs.getInt("movie_file_origin"));
	}	
	
	public MovieFileDto() {
		super();
	}
	
	public int getMovie_file_no() {
		return movie_file_no;
	}
	public void setMovie_file_no(int movie_file_no) {
		this.movie_file_no = movie_file_no;
	}
	public String getMovie_file_name() {
		return movie_file_name;
	}
	public void setMovie_file_name(String movie_file_name) {
		this.movie_file_name = movie_file_name;
	}
	public long getMovie_file_size() {
		return movie_file_size;
	}
	public void setMovie_file_size(long movie_file_size) {
		this.movie_file_size = movie_file_size;
	}
	public String getMovie_file_type() {
		return movie_file_type;
	}
	public void setMovie_file_type(String movie_file_type) {
		this.movie_file_type = movie_file_type;
	}
	public int getMovie_file_origin() {
		return movie_file_origin;
	}
	public void setMovie_file_origin(int movie_file_origin) {
		this.movie_file_origin = movie_file_origin;
	}


}
