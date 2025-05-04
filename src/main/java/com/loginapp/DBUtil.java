package com.loginapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/loginapp"; // Replace with your actual DB URL
    private static final String DB_USERNAME = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "amolkadam7709"; // Replace with your DB password
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // For MySQL 8.0+

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
