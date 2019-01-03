<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>카페 후기</title>
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
  int temp = 0, cnt;
  int newId = 0;
  int star = 0;
  String name = "", title, content, date;
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  String sqlUpdate;
    
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
	  conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  stmt = conn.createStatement();
	  String sql = "select max(id) as maxId, count(*) as cnt from review_tbl";
	  rs = stmt.executeQuery(sql);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
  
  while(rs.next()) {
	  cnt = Integer.parseInt(rs.getString("cnt"));
	  if(cnt != 0)
		  newId = Integer.parseInt(rs.getString("maxId"));
  }
  
  newId++;
  title = request.getParameter("title");
  content = request.getParameter("content");
  star = Integer.parseInt(request.getParameter("star"));
  
  String userId = (String)session.getAttribute("id");
  
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
	  conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  stmt = conn.createStatement();
	  String sql = "select nickname from user_tbl where id = '" + userId + "'";
	  rs = stmt.executeQuery(sql);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
  
  while(rs.next()) {
	  name = rs.getString("nickname");
  }
  
  try {
  	sqlUpdate = "insert into review_tbl values(" + newId + ",'" + name + "','" + title + "','" + content + "',sysdate()," + star + ")";
  	stmt.executeUpdate(sqlUpdate);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
%>
<div style="margin: 80px 0px 0px 0px">
<center>
<h2>후기가 등록되었습니다.</h2>
<input type="button" value="작성한 후기 확인" onclick="location.href='reviewRead.jsp?id=<%= newId %>'">
<input type="button" value="후기 목록 보기" onclick="location.href='review.jsp'">
</center>
</div>
</body>
</html>