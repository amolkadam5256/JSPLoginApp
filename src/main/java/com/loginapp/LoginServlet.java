package com.loginapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String username = req.getParameter("username"); // Get the username from the form
		String password = req.getParameter("password"); // Get the password from the form

		System.out.println("user name is " + username);
		System.out.println("user name is " + password);

		try (Connection conn = DBUtil.getConnection()) {
			// Prepare SQL query to check the user's credentials
			String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// If credentials are valid, redirect to a different page (e.g., dashboard.jsp)
				res.getWriter().println("Login successful! Welcome to the home page.");
				res.sendRedirect("home.jsp"); // Redirect to home.jsp
				req.getSession().setAttribute("username", username); // Store the username in session
				System.out.println("login successful");

			} else {
				// If credentials are invalid, redirect back to login.jsp with error
				res.sendRedirect("login.jsp?error=Invalid+credentials");
				res.getWriter().println("Invalid credentials. Please try again.");
				System.out.println("Invalid credentials. Please try again ");

			}

		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println("Login failed: " + e.getMessage());
		}
	}
}
