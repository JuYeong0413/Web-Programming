<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head><title> �Խ��� </title></head>
  <body>
     <center><h2> �Խñ� ��� ���� </h2></center>
     <center>
     <table border="1" align="center" width="603">
      <tr>
	  <td align="center" bgcolor="silver" width="75"> �۹�ȣ </td>
	  <td align="center" bgcolor="silver" width="75"> �۾��� </td>
	  <td align="center" bgcolor="silver" width="275"> ������ </td>
	  <td align="center" bgcolor="silver" width="175"> ���ڿ��� </td>
      </tr>

	  <c:forEach var="bean" items="${list}">
      <tr>
         <td align="center"> ${bean.id} </td>
         <td align="left"> ${bean.name} </td>
         <td align="left"><c:if test="${bean.id} != ${bean.ref}"> out.println("����"); %></c:if>
            <a href="Read.do?id=${bean.id}" width="250">  
                        ${bean.title}</a></td>
         <td align="center"> ${bean.e_mail} </td>
      </tr>
      
      </c:forEach>
    </table>

    <img src="image/green_tree.gif"><a href="Q3-insert.jsp"> �Խñ� ���� </a>

    <img src="image/island.gif" width="95%">
    </center>
  </body>
</html>