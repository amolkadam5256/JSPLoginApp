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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Get parameters from login form
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            res.sendRedirect("login.jsp?error=Please enter both username and password.");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            // Prepare SQL to check user credentials
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // Note: In production, use hashed passwords

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Valid user found
                HttpSession session = req.getSession();
                session.setAttribute("username", username);  // Set session attribute
                
                // Redirect to home or dashboard page after successful login
                res.sendRedirect("home.jsp");
            } else {
                // Invalid login
                res.sendRedirect("login.jsp?error=Invalid username or password.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            res.sendRedirect("login.jsp?error=Database error: " + e.getMessage());
        }
    }

    // Optionally handle GET requests to forward to login page
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("login.jsp");
    }
}
