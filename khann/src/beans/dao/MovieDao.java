package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import beans.dto.MovieDto;

public class MovieDao {
	
public Connection getConnection() throws Exception{
	Class.forName("oracle.jdbc.OracleDriver");
	return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##semi", "c##semi");

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

}
