<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
</head>
<body>
<body>
   <div>
      <center>
         <a href="main.jsp"><img src="image/logo.png" width="264px" height="88px" align="center"></a>
      </center>
   </div>
   <br>
   <div>
      <nav class="menu">
         <ul>
            <li><a href="main.jsp">Home</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="list.jsp">List</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="review.jsp">Review</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li><a href="search.jsp">Search</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
               String log = (String) session.getAttribute("login");

               if (log != null && log.equals("yes")) {
                  // 로그인 상태인 경우 보여지는 메뉴
            %>
            <li><a href="myPage.jsp">MyPage</a>
               <ul>
                  <li><a href="myPage.jsp">MyPage</a></li>
                  <li><a href="logout.jsp">로그아웃</a></li>
               </ul></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
               } else if ((String) session.getAttribute("id") == null) {
                  // 로그아웃 상태인 경우 보여지는 메뉴
            %>
            <li><a href="login.jsp">Login</a>
               <ul>
                  <li><a href="login.jsp">로그인</a></li>
                  <li><a href="find.jsp">아이디/비밀번호 찾기</a></li>
                  <li><a href="signup.jsp">회원가입</a></li>
               </ul></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
               }
            %>
         </ul>
         <br>
      </nav>
   </div>
<%
  String name = "", tel = "", id = "";
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  
  name = request.getParameter("name");
  tel = request.getParameter("tel");
    
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
	  conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  stmt = conn.createStatement();
	  String sql = "select id from user_tbl where name = '" + name + "' and tel = '" + tel + "'";
	  rs = stmt.executeQuery(sql);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
  
  if(rs.next() == false){
	  out.println("<script>");
	  out.println("alert('이름과 연락처를 확인해 주세요.')");
	  out.println("location.href='find.jsp'");
	  out.println("</script>");
  }
  else {
	  id = rs.getString("id");
  }
%>
<div style="margin: 80px 0 0 0px">	  
<center>
  <h2>아이디 찾기 결과</h2>
  <hr noshade width="120" size="3">
  <%= name %>님의 아이디는 <span style="color: blue"><b><%= id %></b></span> 입니다.<br><br>
  <input type="button" value="로그인 하기" onclick="location.href='login.jsp'">
</center>
</div>
</body>
<%
  rs.close();
  stmt.close();
  conn.close();
%>
</html>