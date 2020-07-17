package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieDto {

	private int movie_no;
	private String movie_name;
	private String movie_type;
	private String movie_age;
	private String movie_runtime;
	private String movie_open;
	private String movie_director;
	private String movie_ac;
	private String movie_content;
	
	
	
	public MovieDto() {
		super();
	}
	

	public MovieDto(ResultSet rs) throws SQLException {
		this.setMovie_no(rs.getInt("movie_no"));
		this.setMovie_name(rs.getString("movie_name"));
		this.setMovie_type(rs.getString("movie_type"));
		this.setMovie_age(rs.getString("movie_age"));
		this.setMovie_runtime(rs.getString("movie_runtime"));
		this.setMovie_open(rs.getString("movie_open"));
		this.setMovie_director(rs.getString("movie_director"));
		this.setMovie_ac(rs.getString("movie_ac"));
		this.setMovie_content(rs.getString("movie_content"));
	
	}
	
	
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_type() {
		return movie_type;
	}
	public void setMovie_type(String movie_type) {
		this.movie_type = movie_type;
	}
	public String getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(String movie_age) {
		this.movie_age = movie_age;
	}
	public String getMovie_runtime() {
		return movie_runtime;
	}
	public void setMovie_runtime(String movie_runtime) {
		this.movie_runtime = movie_runtime;
	}
	public String getMovie_open() {
		return movie_open;
	}
	public void setMovie_open(String movie_open) {
		this.movie_open = movie_open;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_ac() {
		return movie_ac;
	}
	public void setMovie_ac(String movie_ac) {
		this.movie_ac = movie_ac;
	}
	public String getMovie_content() {
		return movie_content;
	}
	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	
	
}
