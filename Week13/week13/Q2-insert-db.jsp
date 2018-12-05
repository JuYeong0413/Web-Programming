<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="board" class="beans.Board" />
<jsp:useBean id="dao" class="beans.BoardDao" />
<jsp:setProperty property="*" name="board"/>
<html>
  <body>
    <%
       dao.insertBoard(board);
    %>
    
    <center><h2> 작성한 글이 등록되었습니다. </h2>
      <img src="image/green_tree.gif"> 
      <a href="Q2-list.jsp"> 게시글 목록 보기</a> 
    </center>

  </body>
</html>