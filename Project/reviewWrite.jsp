<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<h2>후기 작성</h2>
<hr noshade align="left" width="120" size="3">
<form action="reviewWrite-db.jsp" method="post">
  <table border="0">
    <tr>
      <td><img src="image/dot.png" width="12" height="12"> 카페명 </td>
      <td><input type="text" name="title" size="58"></td>
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
      <td><textarea name="content" cols="60" rows="5" placeholder="200자 이내로 작성해주세요."></textarea></td>
    </tr>
  </table><br>
  <input type="submit" value="확인">
</form>
</div>
</body>
</html>