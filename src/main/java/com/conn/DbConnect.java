package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	private static Connection conn = null;

	public static Connection getConn() {

		try {

			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost:5432/Student";
			String user = "postgres";
			String password = "0";

			// Initialize the connection
			conn = DriverManager.getConnection(url, user, password);

			if (conn != null) {
				System.out.println("Connected to the PostgreSQL database!");
				// Now, you can use the connection to prepare statements or execute queries.
			} else {
				System.err.println("Failed to make the connection!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return conn;
	}
}
