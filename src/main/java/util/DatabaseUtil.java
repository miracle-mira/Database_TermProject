package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://10.211.55.10:4567/Review","mira","0323");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
