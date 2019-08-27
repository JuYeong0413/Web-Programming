<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.CafeGo.DBConnector" %>
<%@ page import="com.CafeGo.logincheck" %>
<%@ page import="javax.swing.JOptionPane" %>
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
	<h2>Sign Up</h2>
	<hr noshade align="left" width="120" size="3">
	<small><span style="color: red">*</span> 표시는 필수 입력 사항입니다.</small><br><br>
	<div>
	<form name="fr" method="post" action="infoInsert.jsp" onsubmit="return formcheck()">
      <table border="0" width="800">
      <tr height="50">
        <td width="200"><img src="image/dot.png" width="12" height="12"> 이름<span style="color: red">*</span></td>
        <td><input name="name" value="" id="name" placeholder="이름" type="text" /></td>
        <td width="200"><img src="image/dot.png" width="12" height="12"> 생년월일</td>
        <td><input type="date" id="bdate" name="bdate"></td>
      </tr>
      <tr height="50">
        <td><img src="image/dot.png" width="12" height="12"> 아이디<span style="color: red">*</span></td>
        <form><td><input name="id" value="" id="id" placeholder="로그인 시 사용" type="text"/></td>
        <td><img src="image/dot.png" width="12" height="12"> 닉네임<span style="color: red">*</span></td>
        <form><td><input name="nickname" value="" id="nickname" placeholder="후기 작성시 사용" type="text"/></td>
      </tr>
      <tr height="50">
        <td><img src="image/dot.png" width="12" height="12"> 비밀번호<span style="color: red">*</span></td>
        <td><input name="password" value="" id="password" placeholder="비밀번호" type="text" /></td>
        <td><img src="image/dot.png" width="12" height="12"> 비밀번호 확인<span style="color: red">*</span></td>
        <td><input name="password_c" value="" id="password_c" placeholder="비밀번호 확인" type="text" /></td>
      </tr>
      <tr height="50">
        <td><img src="image/dot.png" width="12" height="12"> 이메일<span style="color: red">*</span></td>
        <td><input name="email" value="" id="email" placeholder="이메일" type="text" /></td>
        <td><img src="image/dot.png" width="12" height="12"> 연락처</td>
        <td><input name="tel" value="" id="tel" placeholder="-포함해서 입력" type="text"/></td>
      </tr>
      </table><br>
      <input type="submit" value="가입" style="width: 45px; height: 30px;"> &nbsp; &nbsp;
      <input type="button" value="취소" style="width: 45px; height: 30px;" onclick="location.href='main.jsp'">
      </form>
	</div>
	
<script type="text/javascript">
function formcheck() {
if(fr.name.value == "") {
    alert("이름을 입력해주세요.");
    fr.name.focus();
    return false;
  }
else if(fr.id.value == "") {
    alert("아이디를 입력해주세요.");
    fr.id.focus();
    return false;
  }
else if(fr.nickname.value == "") {
    alert("닉네임을 입력해주세요.");
    fr.nickname.focus();
    return false;
  }
else if(fr.password.value == "") {
    alert("비밀번호를 입력해주세요.");
    fr.password.focus();
    return false;
  }
else if(fr.password.value != fr.password_c.value) {
    alert("비밀번호가 일치하지 않습니다.");
    fr.password.focus();
    return false;
  }
else if(fr.email.value == "") {
    alert("이메일을 입력해주세요.");
    fr.email.focus();
    return false;
  }
</script>
</div>
</body>
</html>