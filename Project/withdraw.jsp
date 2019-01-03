<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="reponsiveNavigation.css" />
</head>
<body>
<%
  String id = (String)session.getAttribute("id");
  String sql;
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
	  conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  stmt = conn.createStatement();
	  
	  sql = "delete from user_tbl where id = '" + id + "'";
	  stmt.executeUpdate(sql);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
  
  session.removeAttribute("id");
  session.removeAttribute("login");
  session.invalidate();
%>

<script>
  alert('정상적으로 탈퇴되었습니다.\n이용해 주셔서 감사합니다.');
  location.href="main.jsp";
</script>
</body>
</html>