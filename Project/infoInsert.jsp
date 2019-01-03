<%@ page import="com.CafeGo.DBConnector" %>
<%@ page import="com.CafeGo.logincheck" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
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
	ResultSet rs = null;

	conn = DBConnector.getMySQLConnection();
	String sql = "insert into user_tbl(name, id, birthday, nickname, password, email, tel) values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, bdate);
	pstmt.setString(4, username);
	pstmt.setString(5, password);
	pstmt.setString(6, email);
	pstmt.setString(7, number);
	pstmt.executeUpdate();
	
	DBConnector.close(pstmt);
	DBConnector.close(conn);
	
	response.sendRedirect("welcomeSignup.jsp");
%>
</body>
</html>