<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>q4_sub</title></head>
<body>
<center><h3>forward 액션 태그</h3></center>
<hr>
이 파일은 q4_sub.jsp 입니다.
<hr>
현재 웹 브라우저에 나타난 웹 페이지는<br>
q4_main.jsp로부터 이동되었습니다.
<hr>
<% String msg = request.getParameter("news"); %>
q4_main.jsp에서 넘어온 메세지 : <%= msg %>
<hr>
</body>
</html>