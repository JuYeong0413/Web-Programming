<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="com.CafeGo.DBConnector" %>
<%@ page import="com.CafeGo.logincheck" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MyPage</title>
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
	String id = (String)session.getAttribute("id");
	String name = "";
	String bdate = "";
	String username = "";
	String email = "";
	String number = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = DBConnector.getMySQLConnection();
		String sql = "select * from user_tbl where id = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
	}
	catch(Exception e){
		out.println("DB 연동 오류. : " + e.getMessage());
	}

	while(rs.next()){
		name = rs.getString("name");
		bdate = rs.getString("birthday");
		username = rs.getString("nickname");
		email = rs.getString("email");
		number = rs.getString("tel");
	}
%>
<div style="margin: 80px 0 0 100px">
<center>
<h2>회원정보</h2>
<hr noshade width="120" size="3"><br>
<div>
<table border="0">
  <tr>
    <td> 이 &nbsp; &nbsp; 름 : </td>
    <td><%= name %></td>
  </tr>
  <tr>
    <td> 생년월일 : </td>
    <td><%= bdate %></td>
  </tr>
  <tr>
    <td> 닉 네 임 : </td>
    <td><%= username %></td>
  </tr>
  <tr>
    <td> 이 메 일 : </td>
    <td><%= email %></td>
  </tr>
  <tr>
    <td>  전화번호 : </td>
    <td><%= number %></td>
  </tr>
</table>
<br>
<input type="button" value="회원정보 수정" onclick="location.href='infoModify.jsp'"> &nbsp; &nbsp;
<input type="button" value="작성한 글 목록" onclick="location.href='myReview.jsp'"> &nbsp; &nbsp;
<input type="button" value="탈퇴하기" onclick="onClick()">

<script>
function onClick() {
	var flag = confirm("탈퇴하시겠습니까?\n작성된 글은 삭제되지 않습니다.");

	if(flag) { // 확인 버튼 클릭시
		location.href="withdraw.jsp";  
	}
	else { // 취소 버튼 클릭시
		  
	}
}
</script>
</div>
</center>
<div style="margin: 80px 0 0 100px">
<%
  DBConnector.close(rs);
  DBConnector.close(pstmt);
  DBConnector.close(conn);
%>
</body>
</html>