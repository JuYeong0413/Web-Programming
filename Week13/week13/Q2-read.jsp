<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="beans.*" %>
<jsp:useBean id="dao" class="beans.BoardDao" />
<html>
  <head><title> �Խ��� </title></head>
  <body> 
     <center><h2> �Խñ� ���� </h2></center>
     <center>
     <%
   	 int id = Integer.parseInt(request.getParameter("id"));
     Board b = dao.read(id);
     %>     
    <table border="0" width="500">
      <tr>
          <td width="100"><img src="image/ball.gif"> �� �� �� : </td>
	      <td><%= b.getName() %></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> �����ּ� : </td>
	      <td><%= b.getE_mail() %></td>
      </tr>      
      <tr>
	      <td><img src="image/ball.gif"> �� �� �� : </td>
	      <td><%= b.getTitle() %></td>
      </tr>
      <tr>
	      <td><img src="image/ball.gif"> �� �� �� : </td>
	      <td><%= b.getContent() %></td>
      </tr>
    </table><br><br>

	<img src="image/green_tree.gif" width="300px" height="36px" style="visibility: hidden">

    <img src="image/green_tree.gif">
    <a href="Q2-list.jsp"> �Խñ� ��� ���� </a>
  </body>
</html>