package com.CafeGo;

import java.sql.*;

public class logincheck {
	public static boolean pass(String id, String password) {
		if(password=="") return false;
		String pass="";
		
		Connection conn = DBConnector.getMySQLConnection();
		String sql="select * from user_tbl where id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("password");
			DBConnector.close(rs);
			DBConnector.close(pstmt);
			DBConnector.close(conn);
			if(pass.equals(password)) {
				return true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}

		return false;		
	}
	
	public static String id_e(String email) {
		String id;
		
		Connection conn = DBConnector.getMySQLConnection();
		String sql="select * from user_tbl where email =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			id = rs.getString("id");
			DBConnector.close(rs);
			DBConnector.close(pstmt);
			DBConnector.close(conn);
			return id;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return "n";		
	}
	
	public static String id_t(String num) {
		String id;
		
		Connection conn = DBConnector.getMySQLConnection();
		String sql="select * from user_tbl where number =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			id = rs.getString("id");
			DBConnector.close(rs);
			DBConnector.close(pstmt);
			DBConnector.close(conn);
			return id;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return "n";		
	}
	
	public static String password(String name) {
		String pass;
		
		Connection conn = DBConnector.getMySQLConnection();
		String sql="select * from user_tbl where name =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			pass = rs.getString("password");
			DBConnector.close(rs);
			DBConnector.close(pstmt);
			DBConnector.close(conn);
			return pass;
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return "n";		
	}
	
	public static boolean idcheck(String id) {
		
		Connection conn = DBConnector.getMySQLConnection();
		String sql = "select id from user_tbl";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				if(rs.getString("id").equals(id)) {
					System.out.println("oopps!!");
					return true;
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
