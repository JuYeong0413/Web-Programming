<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>

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
         int id, ref;
         int rownum = 0;
         Connection conn = null;
         Statement stmt = null;
         String sql = null;
         ResultSet rs = null;

         try {
               Class.forName("com.mysql.jdbc.Driver");
               String jdbcurl = "jdbc:mysql://localhost:3306/week13";
               conn = DriverManager.getConnection(jdbcurl, "juyeong", "0413");
               stmt = conn.createStatement();
               sql = "select * from board_tbl order by ref desc, id asc ";
               rs = stmt.executeQuery(sql);
         }
         catch(Exception e) {
               out.println("DB 연동 오류입니다. : " + e.getMessage());
         }

	 rs.last();
	 rownum = rs.getRow();
         rs.beforeFirst();
      
  	 while(rs.next())
	 {
	       id = Integer.parseInt(rs.getString("id"));
	       ref = Integer.parseInt(rs.getString("ref"));		
      %>

      <tr>
         <td align="center"> <%= rownum %></td>
         <td align="left"> <%= rs.getString("name") %></td>
         <td align="left"><% if(id != ref) out.println("└→"); %>
            <a href=board-read.jsp?id=<%=rs.getString("id")%> width="250">  
                        <%=rs.getString("title")%></a></td>
         <td align="center"><%= rs.getString("e_mail") %></td>
      </tr>

      <%
	       rownum--;
	 }
      %>

    </table>

    <img src="image/green_tree.gif"><a href="board-insert.jsp"> 게시글 쓰기 </a>
    <% 
       stmt.close();
       conn.close();
    %>
    <img src="image/island.gif" width="95%">
    </center>
  </body>
</html>