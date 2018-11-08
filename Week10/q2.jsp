<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>Q2</title></head>
<body>
<%
 String value = request.getParameter("score");
 String number = request.getParameter("number");
 
 int score = Integer.parseInt(value);
 int line = Integer.parseInt(number);
 
 char grade;
 if(score >= 90) grade = 'A';
 else if(score >= 80 && score <= 89) grade = 'B';
 else if(score >= 70 && score <= 79) grade = 'C';
 else if(score >= 60 && score <= 69) grade = 'D';
 else grade = 'F';
 
 out.println("<h1>당신의 성적은 " + grade + " 입니다.</h1>");
 for(int i = 0; i < line; i++) {
	 for(int j = 0; j <= i; j++) {
		 out.print("*");
	 }
	 out.print("<br>");
 }
%>
</body>
</html>