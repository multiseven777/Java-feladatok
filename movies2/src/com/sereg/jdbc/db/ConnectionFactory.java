package com.sereg.jdbc.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	//reference
    private static ConnectionFactory instance = new ConnectionFactory();
    public static final String URL = "jdbc:mysql://127.0.0.1:3306/movies";
    public static final String USER = "user1";
    public static final String PASSWORD = "password1";
    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver"; 
     
    //constructor
    private ConnectionFactory() {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    //connection
    private Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        return connection;
    }   
     
    public static Connection getConnection() {
        return instance.createConnection();
    }

}
