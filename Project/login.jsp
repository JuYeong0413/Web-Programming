<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.CafeGo.DBConnector" %>
<%@ page import="com.CafeGo.logincheck" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
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
<script type="text/javascript">
function check() {
	  if(fr.id.value == "") {
	    alert("아이디를 입력해주세요.");
	    fr.id.focus();
	    return false;
	  }

	  else if(fr.password.value == "") {
	    alert("비밀번호를 입력해주세요.");
	    fr.password.focus();
	    return false;
	  }
	  else return true;
	}
</script>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String fail = "";

	if(logincheck.pass(id,password)) {
		session.setAttribute("id", id);
		session.setAttribute("login","yes");
	}
	else if(!logincheck.pass(id,password)){
        fail = "yes";
    }
	
	String logout = request.getParameter("logout");
	
	if(logout != null && logout.equals("yes")) {
		session.removeAttribute("id");
		session.removeAttribute("login");
	}
	
	String login = (String)session.getAttribute("login");

	if(login != null && login.equals("yes")) {
		out.println("<script>");
		out.println("alert('로그인 되었습니다. 환영합니다!')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
	else if((id != null) && (password != null) && (fail.equals("yes"))) {
        out.println("<script>");
        out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
        out.println("</script>");
    }

%>
<div style="margin: 80px 0px 0px 0px">
<center>
  <h2>Login</h2>
  <hr noshade width="120" size="3"><br>
  <div>
    <form action="?" name="fr" method="post" onsubmit="return check()">
      <table border="0">
      <tr>
        <td>아 이 디 &nbsp;: </td>
        <td><input name="id" value='' id="id" value="" placeholder="ID" type="text" size="20"></td>
        <td rowspan="2" width="45"><input type="submit" value="Login" style="width: 40pt; height: 40pt"></td>
      </tr>
      <tr>
        <td>비밀번호 : </td>
        <td><input name="password" id="password" value="" placeholder="Password" type="password"></td>
      </tr>
      </table>
    </form>
    <br>
    <input type="button" value="아이디/비밀번호 찾기" style="width: 180px; height: 30px;" onclick="location.href='find.jsp'"> &nbsp; &nbsp;
    <input type="button" value="회원가입" style="width: 80px; height: 30px;" onclick="location.href='signup.jsp'">
  </div>
</center>
</div>
</body>
</html>
