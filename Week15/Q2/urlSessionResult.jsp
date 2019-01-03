<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<html>
<head>
<title>urlSessionResult</title>
</head>
<body>
 <h2>Session URL Rewriting Result</h2>
 세션 ID : <%= session.getId() %><br>
 ID : <%= session.getAttribute("id") %>
</body>
</html>