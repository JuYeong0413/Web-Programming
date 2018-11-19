<%@page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>certification</title>
</head>
<body>
<%
 String[] users = {"web", "programming"};
 String[] passwords = {"1108", "2017"};
 
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
 
 String redirectUrl = "form.jsp";
 for(int i = 0; i < users.length; i++) {
	 if(users[i].equals(id) && passwords[i].equals(pw)) {
		 session.setAttribute("signedUser", id);
		 redirectUrl = "welcome.jsp";
	 }
 }
 response.sendRedirect(redirectUrl);
%>
</body>
</html>