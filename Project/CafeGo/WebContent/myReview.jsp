<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MyPage</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
<link rel="stylesheet" href="table.css" />
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
<div style="margin: 50px 0px 0px 70px">
<%
  String userId = (String)session.getAttribute("id");
  String nickname = "";
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
	  Class.forName("com.mysql.jdbc.Driver");
  	  String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
  	  conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
	  String sql = "select nickname from user_tbl where id = ?";
	
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, userId);
	  rs = pstmt.executeQuery();
  }
  catch(Exception e){
	  out.println("DB 연동 오류. : " + e.getMessage());
  }

  while(rs.next()){
	  nickname = rs.getString("nickname");
  }
%>
<div style="margin: 80px 0 0 100px">
<h2>작성한 글 목록</h2>
<hr noshade align="left" width="160" size="3"><br>
<table>
  <tr>
    <td align="center" bgcolor="silver" width="75">글번호</td>
    <td align="center" bgcolor="silver" width="275">카페명</td>
    <td align="center" bgcolor="silver" width="100">작성자</td>
    <td align="center" bgcolor="silver" width="100">게시일</td>
  </tr>
  
  <%
    int id;
    int rownum = 0;
    conn = null;
    Statement stmt = null;
    String sql = null;
    rs = null;
    
    try {
    	Class.forName("com.mysql.jdbc.Driver");
    	String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
    	conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
    	stmt = conn.createStatement();
    	sql = "select * from review_tbl where name = '" + nickname + "' order by id desc";
    	rs = stmt.executeQuery(sql);
    }
    catch(Exception e) {
    	out.println("DB 연동 오류. : " + e.getMessage());
    }
    
    rs.last();
    rownum = rs.getRow();
    rs.beforeFirst();
    
    while(rs.next())
    {
    	id = Integer.parseInt(rs.getString("id"));
  %>
    
    <tr>
      <td align="center"><%= rownum %></td>
      <td align="left"><a href=reviewRead.jsp?id=<%= rs.getString("id") %> width="250">
        <%= rs.getString("title") %></a></td>
      <td align="center"><%= rs.getString("name") %></td>
      <td align="center"><%= rs.getString("date").substring(0, 11) %></td>
    </tr>
    
  <%
    rownum--;
    }
  %>
</table>
<%
  stmt.close();
  conn.close();
%>
</div>
</div>
</body>
</html>