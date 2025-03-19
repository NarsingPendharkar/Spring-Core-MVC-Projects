package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/registerUser")
public class registerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			DBconnection conn=new DBconnection();
			Connection con=conn.getConnection();
			String sql="insert into usernames values (?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, request.getParameter("username"));
			pst.setString(2, request.getParameter("password"));
			if(pst.executeUpdate()==1) {
				request.setAttribute("error", "User registered successfully ! ");
				request.getRequestDispatcher("login.jsp").forward(request, response);	
				 con.close();
			}
			else {
				request.setAttribute("error", "User registration failed ! ");
				request.getRequestDispatcher("register.jsp").forward(request, response);				}
			   con.close();
		} catch (Exception e) {
			request.setAttribute("error", "Error occured please try again ");
			request.getRequestDispatcher("register.jsp").forward(request, response);			
		}
		
		
		
	}

	

}
