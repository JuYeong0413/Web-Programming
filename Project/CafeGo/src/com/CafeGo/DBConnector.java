package com.CafeGo;

import java.sql.*;

public class DBConnector {
	public static Connection getMySQLConnection() {
		Connection conn = null;		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/cafeGO";	
			String user = "project";
			String password="cafego";
			conn = DriverManager.getConnection(url, user, password);
		}catch(ClassNotFoundException e) {
			System.out.println("MySQL 드라이버가 없습니다.<br/>");
		}catch(SQLException e) {
			System.out.println("사용자 계정 또는 비밀번호가 일치하지 않습니다.<br/>");
		}
		return conn;
	}
	public static void close(Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null) {
				stmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	public static void close(PreparedStatement pstmt) {
		try {
			if(pstmt!=null) {
				pstmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
