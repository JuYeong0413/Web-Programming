<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head><title> 게시판 </title></head>
  <body> 
     <center><h2> 게시글 내용 </h2></center>
     <center>
     
    <table border="0" width="500">
      <tr>
          <td width="100"><img src="image/ball.gif"> 글 쓴 이 : </td>
	      <td> ${board.name} </td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 메일주소 : </td>
	      <td> ${board.e_mail} </td>
      </tr>      
      <tr>
	      <td><img src="image/ball.gif"> 글 제 목 : </td>
	      <td> ${board.title} </td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 글 내 용 : </td>
	      <td> ${board.content} </td>
      </tr>
    </table><br><br>

	<img src="image/green_tree.gif" width="300px" height="36px" style="visibility: hidden">

    <img src="image/green_tree.gif">
    <a href="Q3-main.jsp"> 게시글 목록 보기 </a>
  </body>
</html>