<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
 Cookie[] cookies = request.getCookies();

 String cookie = getCookieValue(cookies, request.getParameter("id"));
 String id = request.getParameter("id");
 String pwd = request.getParameter("pwd");
 
 if(cookie == null) {
	out.println("쿠키를 설정합니다.");
	response.addCookie(new Cookie(id, pwd));
 }
 else {
	out.println("쿠키가 설정되어 있습니다.<br>기존 쿠키를 삭제합니다.");
	Cookie c = new Cookie(id, "");
	c.setMaxAge(0);
	response.addCookie(c);
 }
%>
<html>
<head>
<title>SetCookieTest</title>
</head>
<body>

</body>
</html>
<%!
 private String getCookieValue(Cookie[] cookies, String name) {
	if(cookies == null)
		return null;
	for(Cookie cookie : cookies) {
		if(cookie.getName().equals(name))
			return cookie.getValue();
	}
	return null;
}
%>