package com.loginapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static final String DB_URL = "jdbc:mysql://db4free.net:3306/loginappdb?useSSL=false&serverTimezone=UTC";
	private static final String DB_USERNAME = "amolkadam";
	private static final String DB_PASSWORD = "amol1234";
	private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() throws SQLException {
        try {
            // Load the JDBC driver (for MySQL)
            Class.forName(JDBC_DRIVER);
            // Return the connection object
            return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found", e);
        } catch (SQLException e) {
            throw new SQLException("Error connecting to the database", e);
        }
    }
}
