<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>
<html>
<head>
<title>urlSession</title>
</head>
<body>
<h2>Session URL Rewriting Test</h2>
 <%
 String id = request.getParameter("id");
 if(id.equals("")) {
	 response.sendRedirect("urlSession.html");
	 return;
 }
 
 HttpSession session = request.getSession(true);
 session.setAttribute("id", id);
 
 session = request.getSession(false);
 String s = (String)session.getAttribute("id");
 
 out.println("세션 ID : " + session.getId() + "<br>");
 out.println("ID : " + s);
 %>
<hr>
<a href=<%= response.encodeURL("urlSessionResult.jsp") %>>Test1</a><br>
<a href="urlSessionResult.jsp">Test2</a>
</body>
</html>