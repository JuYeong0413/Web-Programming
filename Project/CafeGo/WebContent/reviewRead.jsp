<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
<div style="margin: 80px 0px 0px 70px">
<h2>카페 후기</h2>
<hr noshade align="left" width="120" size="3">
<%
  String userId = (String)session.getAttribute("id");
  
  if(userId == null) {
	  out.println("<script>");
	  out.println("alert('로그인 후 이용 가능합니다.')");
	  out.println("document.location.href='login.jsp'");
	  out.println("</script>");
  }

  int id = 0;
  int star = 0;
  String name = "", title = "", content ="", date = "", writer = "";
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
	  name = rs.getString("name");
	  title = rs.getString("title");
	  content = rs.getString("content");
	  date = rs.getString("date");
	  star = Integer.parseInt(rs.getString("star"));
  }
  
  date = date.substring(0, 19);
%>
<table border="0" width="500">
  <tr>
    <td><img src="image/dot.png" width="12" height="12"> 카페명 </td>
    <td><%= title %></td>
    <td><img src="image/dot.png" width="12" height="12"> 별 &nbsp; 점 </td>
    <td><%= star %>점</td>
  </tr>
  <tr>
    <td><img src="image/dot.png" width="12" height="12"> 작성자 </td>
    <td><%= name %></td>
    <td><img src="image/dot.png" width="12" height="12"> 작성일 </td>
    <td><%= date %></td>
  </tr>
  <tr>
    <td colspan="4"></td>
  </tr>
  <tr>
    <td colspan="4"><%= content %></td>
  </tr>
</table><br>

<%
  String nickname = "";

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
	  nickname = rs.getString("nickname");
  }
  
  if(nickname.equals(name)) { // 현재 로그인 되어 있는 사용자와 글 작성자가 같을 경우에만 수정, 삭제 버튼 표시
%>
<button id="modify" onclick="location.href='reviewModify.jsp?id=<%= id %>'">글수정</button>
<input type="button" value="글삭제" onclick="deleteClick();">
<%
  }
%>

<input type="button" value="글목록" onclick="location.href='review.jsp'">

<script>
	function deleteClick() {
		var flag = confirm("작성하신 글을 삭제하시겠습니까?\n삭제된 글은 복구될 수 없습니다.");
		  
		if(flag) { // 확인 버튼 클릭시
			location.href="reviewDelete-db.jsp?id=<%= id%>";  
		}
		else { // 취소 버튼 클릭시
			  
		}
	}
</script>
</div>
</body>
</html>