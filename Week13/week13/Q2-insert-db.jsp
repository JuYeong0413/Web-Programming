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
    
    <center><h2> �ۼ��� ���� ��ϵǾ����ϴ�. </h2>
      <img src="image/green_tree.gif"> 
      <a href="Q2-list.jsp"> �Խñ� ��� ����</a> 
    </center>

  </body>
</html>