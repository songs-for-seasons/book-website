package DAO;
import java.sql.*;
public class DbConn {
	private Connection conn;
	public DbConn(){
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=hh;user=sa;password=12345;");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public Connection getConnection(){
		return conn;
	}
}

