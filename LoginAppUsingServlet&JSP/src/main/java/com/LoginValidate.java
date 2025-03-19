package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Userlogin")
public class LoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		DBconnection dbcon = new DBconnection();
		try {
			Connection con = dbcon.getConnection();
			String sql = "select * from usernames where username=? and password=?";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, sql);
		} catch (Exception e) {
		}
		if (username.equals("narsing") && password.equals("n123")) {
			request.setAttribute("username", username);
			RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("error", "Invalid Credential's ! ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
