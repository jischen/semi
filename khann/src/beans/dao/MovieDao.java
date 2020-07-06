package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.dto.MovieDto;



public class MovieDao {
	
public Connection getConnection() throws Exception{
	Class.forName("oracle.jdbc.OracleDriver");
	return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##semi", "C##semi");

}

public void insert(MovieDto mdto) throws Exception{
	Connection con = getConnection();
	
	String sql = "INSERT INTO movie values(movie_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, mdto.getMovie_name());
	ps.setString(2, mdto.getMovie_type());
	ps.setString(3, mdto.getMovie_age());
	ps.setString(4, mdto.getMovie_runtime());
	ps.setString(5, mdto.getMovie_open());
	ps.setString(6, mdto.getMovie_director());
	ps.setString(7, mdto.getMovie_ac());
	ps.setString(8, mdto.getMovie_content());
	
	ps.execute();
	
	con.close();

}	


	public MovieDto get(int movie_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM movie WHERE movie_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, movie_no);
		ResultSet rs = ps.executeQuery();
		

		MovieDto mdto;
		if(rs.next()) {
			mdto = new MovieDto(rs);
			
			mdto.setMovie_no(Integer.parseInt(rs.getString("movie_no")));
			mdto.setMovie_name(rs.getString("movie_name"));
			mdto.setMovie_type(rs.getString("movie_type"));
			mdto.setMovie_age(rs.getString("movie_age"));
			mdto.setMovie_runtime(rs.getString("movie_runtime"));
			mdto.setMovie_open(rs.getString("movie_open"));
			mdto.setMovie_director(rs.getString("movie_director"));
			mdto.setMovie_ac(rs.getString("movie_ac"));
			mdto.setMovie_content(rs.getString("movie_content"));
		}
		else {
			mdto = null;
		}
		
		con.close();
		
		return mdto;
	}
	
	
	public List<MovieDto> getList() throws Exception{
		Connection con = getConnection();
		
		String sql = "select * from movie order by movie_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<MovieDto> list = new ArrayList<>();
		while(rs.next()) {
			MovieDto bdto = new MovieDto(rs);
			list.add(bdto);
		}
		
		con.close();
		return list;
		
	}	

}
