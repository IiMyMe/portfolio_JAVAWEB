package mem;

import java.sql.*;

public class DBConn {
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost?serverTimezone=UTC";
			String user = "root";
			String password = "admin1234";
			
			conn = DriverManager.getConnection(url,user,password);
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
