<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>

<html>
  <head><title> �Խ��� </title></head>
  <body>
     <center><h2> �� �� �� </h2></center><br>
	 <center>
	 <table border="0">
	 <form action="board-insert-db.jsp" method="post">
	       <tr>
              <td width="100"><img src="image/ball.gif"> �� �� �� :</td>
	      <td><input type="text" name="name" size="15"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> �����ּ� :</td>
	      <td><input type="text" name="e_mail" size="30"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> �� �� �� :</td>
	      <td><input type="text" name="title" size="50"></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> �� �� �� :</td>
	      <td><textarea rows="4" cols="65" name="content"></textarea></td>
      </tr>
      <tr>
      	  <td><img src="image/ball.gif"> �н����� :</td>
      	  <td><input type="password" name="passwd" size="10" maxlength="8"></td>
      </tr>
	 </table><br><br>
	 
	 <input type="submit" value="����ϱ�">
	 <input type="reset" value="�ٽþ���">
	 
	 </form><br><br>


    <img src="image/green_tree.gif"><a href="board-list.jsp"> �Խñ� ��� ���� </a>

    <img src="image/island.gif" width="95%">
	</center>
  </body>
</html>