<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
<div style="margin: 80px 0px 0px 70px">
<%
  int id, star;
  String title = "", content ="";
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  
  id = Integer.parseInt(request.getParameter("id"));
  
  try {
	  Class.forName("com.mysql.jdbc.Driver");
  	String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
  	conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  stmt = conn.createStatement();
	  String sql = "select * from review_tbl where id = " + id;
	  rs = stmt.executeQuery(sql);
  }
  catch(Exception e) {
	  out.println("DB 연동 오류. : " + e.getMessage());
  }
  
  while(rs.next()) {
	  title = rs.getString("title");
	  content = rs.getString("content");
	  star = Integer.parseInt(rs.getString("star"));
  }
%>
<h2>후기 수정</h2>
<hr noshade align="left" width="120" size="3">
<form action="reviewModify-db.jsp" method="post">
  <table border="0">
    <tr>
      <td><img src="image/dot.png" width="12" height="12"> 카페명 </td>
      <td><input type="text" name="name" size="58" value="<%= title %>"></td>
    </tr>
    <tr>
      <td><img src="image/dot.png" width="12" height="12"> 별 &nbsp; 점 </td>
      <td>
      <select name="star">
        <option value="1">1점</option>
        <option value="2">2점</option>
        <option value="3">3점</option>
        <option value="4">4점</option>
        <option value="5">5점</option>
      </select>
      </td>
    </tr>
    <tr>
      <td valign="top"><img src="image/dot.png" width="12" height="12"> 내 &nbsp; 용 </td>
      <td><textarea name="content" cols="60" rows="5" ><%= content %></textarea></td>
    </tr>
  </table><br>
  <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
  <input type="submit" value="확인">
  <input type="button" value="취소" onclick="location.href='review.jsp?id=<%= id %>'">
</form>
</div>
</body>
</html>