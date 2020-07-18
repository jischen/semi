package beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReviewDto {

	private int review_no;
	private int review_movie;
	private String review_writer;
	private String review_content;
	private String review_score;
	private String review_date;
	
	private int super_no;
	public ReviewDto(ResultSet rs) throws SQLException{
		
		this.setReview_no(rs.getInt("review_no"));
		this.setReview_movie(rs.getInt("review_movie"));
		this.setReview_writer(rs.getString("review_writer"));
		this.setReview_content(rs.getString("review_content"));
		this.setReview_score(rs.getString("review_score"));
		this.setReview_date(rs.getString("review_date"));
		
		
	}
	
	public ReviewDto() {
	
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public int getReview_movie() {
		return review_movie;
	}

	public void setReview_movie(int review_movie) {
		this.review_movie = review_movie;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_score() {
		return review_score;
	}
	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public void setSuper_no(int super_no) {
		
		this.super_no=super_no;
		
		
	}
	
	

	
}
