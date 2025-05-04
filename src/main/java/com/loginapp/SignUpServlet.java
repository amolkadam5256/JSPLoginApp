package com.loginapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignUpServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Get the form data
		String fullName = req.getParameter("name");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirm");

		// Print the form data
		System.out.println("Full Name: " + fullName);
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);
		System.out.println("Confirm Password: " + confirmPassword);

		// Validate the inputs
		if (fullName == null || username == null || password == null || confirmPassword == null || fullName.isEmpty()
				|| username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
			res.sendRedirect("signup.jsp?error=All fields are required.");
			return;
		}

		if (!password.equals(confirmPassword)) {
			res.sendRedirect("signup.jsp?error=Passwords do not match.");
			return;
		}

		try (Connection conn = DBUtil.getConnection()) {
			// Check if the username already exists in the database
			String checkUserSql = "SELECT * FROM users WHERE username = ?";
			PreparedStatement checkStmt = conn.prepareStatement(checkUserSql);
			checkStmt.setString(1, username);
			ResultSet rs = checkStmt.executeQuery();

			if (rs.next()) {
				// If username already exists
				res.sendRedirect("signup.jsp?error=Username already exists.");
				return;
			}

			// Insert the new user into the database
			String insertSql = "INSERT INTO users (name, username, password) VALUES (?, ?, ?)";
			PreparedStatement insertStmt = conn.prepareStatement(insertSql);
			insertStmt.setString(1, fullName);
			insertStmt.setString(2, username);
			insertStmt.setString(3, password); // In a real application, hash the password before storing it

			int rowsAffected = insertStmt.executeUpdate();
			if (rowsAffected > 0) {
				// If user is successfully inserted, redirect to login page
				res.sendRedirect("login.jsp?message=Sign up successful! Please login.");
			} else {
				// If something goes wrong
				res.sendRedirect("signup.jsp?error=Something went wrong, please try again.");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			res.sendRedirect("signup.jsp?error=Database error: " + e.getMessage());
		}
	}
}
