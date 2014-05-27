package DAO;
import java.sql.*;
public class DbConn {
	private Connection conn;
	private static String dbClassName = "com.mysql.jdbc.Driver";
	private static String dbUrl = "jdbc:mysql://localhost:3306/book";
	private static String dbUser = "root";
	private static String dbPassword = "admin";
//	private static Connection conn = null;
	public DbConn(){
		try{
//			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=book;user=saa;password=12345;");
			Class.forName(dbClassName);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public Connection getConnection(){
		return conn;
	}
}

