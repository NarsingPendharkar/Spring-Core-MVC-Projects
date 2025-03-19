package com.SpringPasswordEncodeDecode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class App 
{
	private static final BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
    public static void main( String[] args )
    {
    	String username="Sachin";
    	String password="s123";
    	decodePassword(password);
    	
        try {
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	String url="jdbc:sqlserver://DESKTOP-G774017:1433;databaseName=test;encrypt=false";
			Connection conn=DriverManager.getConnection(url, "Narsing", "root");
			System.out.println("connected");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    public static void decodePassword(String password) {
    	try {
    		String url="jdbc:sqlserver://DESKTOP-G774017:1433;databaseName=test;encrypt=false";
			Connection conn=DriverManager.getConnection(url, "Narsing", "root");
			Statement st=conn.createStatement();
			  ResultSet rs=  st.executeQuery("select  * from users where username='Sachin' ");
			  while(rs.next()) {
				  System.out.println();
				  boolean result=passwordEncoder.matches(password, rs.getString(3));
				  System.out.println(result);
			  }
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
}
