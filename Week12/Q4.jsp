<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mybean" class="week12.Beans" scope="page" />
<html>
<head>
<meta charset="UTF-8">
<title>Q4</title>
</head>
<body>
<%
mybean.setId("OKJSP");
mybean.setPwd("OKPassword");
%>
ID : <%= mybean.getId() %><br>
Password : <%= mybean.getPwd() %> 
</body>
</html>