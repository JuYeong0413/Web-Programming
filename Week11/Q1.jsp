<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Q1</title></head>
<body>
 <h1>request로 넘어온 값 받기</h1>
 <%
 request.setCharacterEncoding("UTF-8");
 
 String name = request.getParameter("name");
 out.println("이름 : " + name + "<br>");
 out.println("선택한 취미는 : ");

 String[] hobbies = request.getParameterValues("hobby");
 for(int i = 0; i < hobbies.length; i++) {
	  out.println(hobbies[i] + " ");
 }
 
 out.println("입니다.");
 %>
</body>
</html>