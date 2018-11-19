<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Q2-1</title></head>
<body>
 <form action="Q2-2.jsp" method="get">
 <h3>각 객체에 setAttribute 속성으로 값 설정 후 jsp 기본 표현 방식과 el 방식의 비교 출력</h3>
 
 <%
 pageContext.setAttribute("page", "봄비");
 request.setAttribute("request", "여름장마");
 session.setAttribute("session", "가을바람");
 application.setAttribute("application", "겨울눈");
 %>
 
 page 영역 : <%=pageContext.getAttribute("page") %> <br>
 page 영역 (EL) : ${pageScope.page} <br>
 request 영역 : <%=request.getAttribute("request") %> <br>
 request 영역 (EL) : ${requestScope.request} <br>
 session 영역 : <%=session.getAttribute("session") %> <br>
 session 영역 (EL) : ${sessionScope.session} <br>
 application 영역 : <%=application.getAttribute("application") %> <br>
 application 영역 (EL) : ${applicationScope.application} <br>
 
 <hr><hr>
 
 <h3>EL PageContext 내장객체 예제</h3>
 Method : ${pageContext.request.method}
 <br>URI : ${pageContext.request.requestURI} <br>
 
 <hr><hr>
 
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