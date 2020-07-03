package beans.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class MovieDao {
	
public Connection getConnection() throws Exception{
	Class.forName("oracle.jdbc.OracleDriver");
	return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##semi", "c##semi");

}
}
