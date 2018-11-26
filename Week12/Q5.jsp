<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mybean" class="week12.Beans" scope="page" />
<jsp:setProperty name="mybean" property="id" value="OKJsp" />
<jsp:setProperty name="mybean" property="pwd" value="OKPassword" />
<html>
<head>
<meta charset="UTF-8">
<title>Q5</title>
</head>
<body>
ID:<jsp:getProperty name="mybean" property="id" /><br>
Password:<jsp:getProperty name="mybean" property="pwd" />
</body>
</html>