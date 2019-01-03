<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>카페 목록</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
<link rel="stylesheet" href="list.css" />
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
	String category = request.getParameter("category");
	if(category.equals("notSelected")) {
		out.println("<script>");
		out.println("alert('지역을 선택해 주세요!')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	}
%>
	<div style="margin: 80px 0 0 100px">
		<h2><span style="color: blue">"<%= category %>"</span>카페 목록</h2>
<%
	int cnt;
	int count = 0;
	String name = "", theme = "", location = "", tel = "", link = "";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
		conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
		stmt = conn.createStatement();
		String sql = "select count(*) as cnt from cafe_tbl where location like '%" + category + "%'";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류. : " + e.getMessage());
	}

	while (rs.next()) {
		cnt = Integer.parseInt(rs.getString("cnt"));
	}

	try {
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcurl = "jdbc:mysql://localhost:3306/cafeGO";
		conn = DriverManager.getConnection(jdbcurl, "project", "cafego");
		stmt = conn.createStatement();
		String sql = "select * from cafe_tbl where location like '%" + category + "%'";
		rs = stmt.executeQuery(sql);
	} catch (Exception e) {
		out.println("DB 연동 오류. : " + e.getMessage());
	}

	while (rs.next()) {
		count++;
		name = rs.getString("name");
		theme = rs.getString("theme");
		if(theme == null) theme = "";
		else theme = "카페 테마 : ".concat(theme);
		location = rs.getString("location");
		tel = rs.getString("tel");
		if(tel == null) tel ="";
		else tel = "☎ ".concat(tel);
		link = rs.getString("link");
		if(link == null) link = "";
%>
	
	<center>
		<div class="gallery">
			<img src="image/<%= name %>.jpg">
			<div class="desc">
				<big><b><%= name %></b></big><br><br>
				<%= theme %><br>
				<%= location %><br>
				<%= tel %><br>
				<a href="<%= link %>"><%= link %></a>
			</div>
		</div>
	</center>
	
<%
		if(count == 4){
			out.println("<br><br>");
		}

	}
%>
	</div>
<%
  stmt.close();
  conn.close();
%>
</body>
</html>