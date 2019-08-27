<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
</head>
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
	<br>
<div style="margin: 80px 0 0 0px">
<center>
  <h2>아이디 찾기</h2>
  <hr noshade width="120" size="3"><br>
  <form action="findId-email.jsp" method="post">
    <fieldset style="width: 300px; text-align: left">
      <legend>이메일로 찾기</legend>
        <table border="0">
          <tr>
            <td>이 &nbsp; 름 : </td>
            <td><input type="text" placeholder="이름" name="name" id="name" value=''></td>
            <td rowspan="2" width="45"><input type="submit" value="확인" style="width: 40pt; height: 40pt"></td>
          </tr>
          <tr>
            <td>이메일 : </td>
            <td><input type="text" placeholder="가입시 사용한 이메일" name="email" id="email" value=''></td>
          </tr>
        </table>
      </fieldset>
    </form>
    <br>
    <form action="findId-tel.jsp" method="post">
      <fieldset style="width: 300px; text-align: left">
        <legend>연락처로 찾기</legend>
          <table border="0">
            <tr>
              <td>이 &nbsp; 름 : </td>
              <td><input type="text" placeholder="이름" name="name" id="name" value=''></td>
              <td rowspan="2" width="45"><input type="submit" value="확인" style="width: 40pt; height: 40pt"></td>
            </tr>
            <tr>
              <td>연락처 : </td>
              <td><input type="text" placeholder="-없이 입력" name="tel" id="tel" value=''/></td>
            </tr>
          </table>
        </fieldset>
      </form>
<br><br>
<div>
<h2>비밀번호 찾기</h2>
<hr noshade width="120" size="3"><br>
  <form action="findPwd.jsp" method="post">
    <fieldset style="width: 300px; text-align: left">
      <legend>회원 정보 입력</legend>
        <table border="0">
          <tr>
            <td>아이디 : </td>
            <td><input type="text" placeholder="아이디" name="id" id="id" value=''></td>
            <td rowspan="2" width="45"><input type="submit" value="확인" style="width: 40pt; height: 40pt"></td>
          </tr>
          <tr>
            <td>이메일 : </td>
            <td><input type="text" placeholder="가입시 사용한 이메일" name="email" id="email" value=''></td>
          </tr>
        </table>
      </fieldset>
    </form>
</div>
</center>
</div>
</body>
</html>
