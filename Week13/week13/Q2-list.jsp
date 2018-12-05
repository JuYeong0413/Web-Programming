<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.util.*" %>
<%@ page import="beans.*" %>
<jsp:useBean id="dao" class="beans.BoardDao" />

<html>
  <head><title> 게시판 </title></head>
  <body>
     <center><h2> 게시글 목록 보기 </h2></center>
     <center>
     <table border="1" align="center" width="603">
      <tr>
	  <td align="center" bgcolor="silver" width="75"> 글번호 </td>
	  <td align="center" bgcolor="silver" width="75"> 글쓴이 </td>
	  <td align="center" bgcolor="silver" width="275"> 글제목 </td>
	  <td align="center" bgcolor="silver" width="175"> 전자우편 </td>
      </tr>

      <%
      	 int rownum = dao.rowCount();
         List<Board> list = dao.getBoard();
         
         for(Board b : list) {
      %>

      <tr>
         <td align="center"> <%= b.getId() %></td>
         <td align="left"> <%= b.getName() %></td>
         <td align="left"><% if(b.getId() != b.getRef()) out.println("└→"); %>
            <a href=Q2-read.jsp?id=<%=b.getId()%> width="250">  
                        <%=b.getTitle()%></a></td>
         <td align="center"><%= b.getE_mail() %></td>
      </tr>
      
      <% } %>
    </table>

    <img src="image/green_tree.gif"><a href="Q2-insert.jsp"> 게시글 쓰기 </a>

    <img src="image/island.gif" width="95%">
    </center>
  </body>
</html>