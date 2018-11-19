<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Q2-2</title>
</head>
<body>
<form action="Q2-2.jsp" method="get">
<h3>표현 언어의 사용예제2 - 파라미터 값 처리</h3>
이름 <input type="text" name="name">
<input type="submit" value="확인"><br>
<%
 String name = request.getParameter("name");
 out.println("이름은 (request.getParameter) : " + name + " 입니다.<br>");
%>
이름은 (EL) : ${param.name} 입니다.
</form> 
</body>
</html>