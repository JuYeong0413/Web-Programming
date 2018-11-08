<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>Q1</title></head>
<body>
 <h1>String 클래스 사용 예제</h1>
 <% String str = "web program"; %>
 문자열 반환 : ' web program ' -> '<%= str.substring(0, 3) %>' <br><br>
 문자열 대체 : ' web program ' -> ' <%= str.replace("program", "programming") %> ' <br><br>
 공백 제거 : ' web program ' -> '<%= str.trim() %>'<br><br><br>
 <hr>
 <%
 int i;
 int num;
 try {
	 for(i = 5; i >= 0; i--) {
		 num = 30 / i;
		 out.println(num + "<br>");
	 }
 } catch(ArithmeticException e) {
	 out.println("오류가 발생했습니다./by zero<br>");
 }
 %>
 <hr>
</body>
</html>