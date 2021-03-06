<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CafeGO</title>
<link rel="stylesheet" href="responsiveNavigation.css" />
<script>
<!--automatic image slide-->
	var index = 0;
	window.onload = function() {
		slideShow();
	}

	function slideShow() {
		var i;
		var x = document.getElementsByClassName("slide");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		index++;
		if (index > x.length) {
			index = 1;
		}
		x[index - 1].style.display = "block";
		setTimeout(slideShow, 4000);
	}
</script>
<style>
#footer {
	position:relative;
	margin:0;
	padding:0;
	width: 100%;
	height: 70px;
	bottom: 0;
	background: #ccc;
}

.slide {
	max-width: 1000px;
	max-height: 500px;
	width: 100%;
}
</style>
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
	<div>
		<center>
			<div>
				<img class="slide" src="image/iphone.jpg"> <img class="slide"
					src="image/baked.jpg"> <img class="slide"
					src="image/macarons.jpg">
				<div>
		</center>
		<br>
		<center>
			<span style="font: bold 3em;">
				<h2>WELCOME TO CafeGO</h2> <br>
			</span> <span> 카페의 모든 것을 한 눈에 확인할 수 있습니다.<br> <br> CafeGo와
				함께 추억을 남겨보세요!<br>
			</span> <br>
		</center>
	</div>
	<br>
	<center>
		<div id="footer">
			<br> 본 페이지는 동국대학교 컴퓨터공학과 웹프로그래밍 프로젝트 결과물입니다.
		</div>
	</center>
</body>
</html>