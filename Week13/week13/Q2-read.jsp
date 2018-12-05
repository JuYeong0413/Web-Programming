<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="beans.*" %>
<jsp:useBean id="dao" class="beans.BoardDao" />
<html>
  <head><title> 게시판 </title></head>
  <body> 
     <center><h2> 게시글 내용 </h2></center>
     <center>
     <%
   	 int id = Integer.parseInt(request.getParameter("id"));
     Board b = dao.read(id);
     %>     
    <table border="0" width="500">
      <tr>
          <td width="100"><img src="image/ball.gif"> 글 쓴 이 : </td>
	      <td><%= b.getName() %></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 메일주소 : </td>
	      <td><%= b.getE_mail() %></td>
      </tr>      
      <tr>
	      <td><img src="image/ball.gif"> 글 제 목 : </td>
	      <td><%= b.getTitle() %></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> 글 내 용 : </td>
	      <td><%= b.getContent() %></td>
      </tr>
    </table><br><br>

	<img src="image/green_tree.gif" width="300px" height="36px" style="visibility: hidden">

    <img src="image/green_tree.gif">
    <a href="Q2-list.jsp"> 게시글 목록 보기 </a>
  </body>
</html>