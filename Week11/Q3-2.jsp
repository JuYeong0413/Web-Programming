<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>Q3-2</title>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
 request.setAttribute("request", "웹프짱");
%>
request.setAttribute = "웹프짱" 추가<br>
<hr>
요청 URI : ${pageContext.request.requestURI} <br>
<hr>
request의 name 속성 : ${requestScope.request} <br>
<hr>
아이디 : ${param.id} <br>
선택한 운동 : ${paramValues.exercise[0]}
		 ${paramValues.exercise[1]}
		 ${paramValues.exercise[2]}
		 ${paramValues.exercise[3]}
</body>
</html>