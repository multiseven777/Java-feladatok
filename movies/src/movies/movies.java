package movies;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class movies {

	public static void main(String[] args) throws Exception {
		
		
		String url = "jdbc:mysql://127.0.0.1:3306/movies";
		String username = "user1";
		String password = "password1";

		System.out.println("Connecting database...");

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
		    System.out.println("Database connected!");
		} catch (SQLException e) {
		    throw new IllegalStateException("Cannot connect the database!", e);
		}
		
	  }

	
}
