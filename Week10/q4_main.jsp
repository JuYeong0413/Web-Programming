<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>액션 태그</title>
……
<body>
<p>이 파일은 q4_main.jsp 입니다.<br/>
어떤 것으로 글이 적힐까요?<br>
title도 바뀌니까 참고하세요.<hr></p>
<h3>jsp:forward</h3>
<q>q4_main일까요?  q4_sub일까요?<hr>
<jsp:forward page = "q4_sub.jsp">
<jsp:param name = "url" value = "q4_main.jsp"/>
<jsp:param name = "news" value = "Good luck with your class assignment."/>
</jsp:forward>
</body>
</html>
