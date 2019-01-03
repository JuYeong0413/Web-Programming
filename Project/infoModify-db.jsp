<%@ page import="com.CafeGo.DBConnector" %>
<%@ page import="com.CafeGo.logincheck" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String bdate = request.getParameter("bdate");		
	String username = request.getParameter("nickname");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String number = request.getParameter("tel");
	if(number == null) number = "-";
	if(bdate.equals("")) bdate="1900-01-01";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
  
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
		conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
		stmt = conn.createStatement();
		String sql = "update user_tbl set name = '" + name + "', birthday = '" + bdate +
				"', nickname = '" + username + "', password = '" + password + 
				"', email = '" + email + "', tel = '" + number + "'" + "where id = '" + id + "'";
		stmt.executeUpdate(sql);
	}
	catch(Exception e) {
		out.println("DB 연동 오류. : " + e.getMessage());
	}
%>
<div style="margin: 80px 0 0 0px">
<center>
<h2>회원정보가 수정되었습니다.</h2>
<input type="button" value="회원정보 확인" onclick="location.href='myPage.jsp'">
<input type="button" value="메인 페이지로 이동" onclick="location.href='main.jsp'">
</center>
</div>
</body>
</html>