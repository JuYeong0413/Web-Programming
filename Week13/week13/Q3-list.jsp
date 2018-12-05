<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	  <c:forEach var="bean" items="${list}">
      <tr>
         <td align="center"> ${bean.id} </td>
         <td align="left"> ${bean.name} </td>
         <td align="left"><c:if test="${bean.id} != ${bean.ref}"> out.println("└→"); %></c:if>
            <a href="Read.do?id=${bean.id}" width="250">  
                        ${bean.title}</a></td>
         <td align="center"> ${bean.e_mail} </td>
      </tr>
      
      </c:forEach>
    </table>

    <img src="image/green_tree.gif"><a href="Q3-insert.jsp"> 게시글 쓰기 </a>

    <img src="image/island.gif" width="95%">
    </center>
  </body>
</html>