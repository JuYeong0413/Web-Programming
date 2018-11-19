<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 if(session.getAttribute("signedUser") == null) {
	 response.sendRedirect("logout.jsp");
 }
%>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
<h1><%= session.getAttribute("signedUser") %>님 <small>반갑습니다.</small></h1>
<a href="logout.jsp">로그아웃</a>
</body>
</html>