<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
  <head><title> 게시판 </title></head>
  <body>
     <center><h2> 게 시 판 </h2></center><br>
	 <center>
	 <table border="0">
	 <form action="Q2-insert-db.jsp" method="post">
	       <tr>
              <td width="100"><img src="image/ball.gif"> 글 쓴 이 :</td>
	      <td><input type="text" name="name" size="15"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 메일주소 :</td>
	      <td><input type="text" name="e_mail" size="30"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 글 제 목 :</td>
	      <td><input type="text" name="title" size="50"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 글 내 용 :</td>
	      <td><textarea rows="4" cols="65" name="content"></textarea></td>
      </tr>
      <tr>
      	  <td><img src="image/ball.gif"> 패스워드 :</td>
      	  <td><input type="password" name="passwd" size="10" maxlength="8"></td>
      </tr>
	 </table><br><br>
	 
	 <input type="submit" value="등록하기">
	 <input type="reset" value="다시쓰기">
	 
	 </form><br><br>


    <img src="image/green_tree.gif"><a href="Q2-list.jsp"> 게시글 목록 보기 </a>

    <img src="image/island.gif" width="95%">
	</center>
  </body>
</html>