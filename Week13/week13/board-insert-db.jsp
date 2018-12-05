<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
  <body>
    <%
       int count;
       int id = 0, ref = 0;
       String name = request.getParameter("name");
       String e_mail = request.getParameter("e_mail");
       String title = request.getParameter("title");
       String content = request.getParameter("content");
       String passwd = request.getParameter("passwd");
       Connection conn = null;
       Statement stmt = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       String sql1 = "", sql2 = "";
   
       try { 
         Class.forName("com.mysql.jdbc.Driver");
	     String url = "jdbc:mysql://localhost:3306/week13";
	     conn = DriverManager.getConnection(url, "juyeong", "0413");
	     stmt = conn.createStatement();
	     
	     sql1 = "select max(id) as max_id, count(*) as count from board_tbl";
	     rs = stmt.executeQuery(sql1);
       }
       catch(Exception e) {
           out.println("DB 연동 오류입니다. : " + e.getMessage());
     }
     
     while(rs.next()) {
	  	 count = Integer.parseInt(rs.getString("count"));
	   	 if(count != 0) id = Integer.parseInt(rs.getString("max_id"));
	 }
	     
	 id++;
	 ref = id;
	     
	 try {
	     sql2 = "insert into board_tbl values(?, ?, ?, ?, ?, ?, ?)";
	     pstmt = conn.prepareStatement(sql2);
	     pstmt.setInt(1, id);
	     pstmt.setString(2, name);
	     pstmt.setString(3, e_mail);
	     pstmt.setString(4, title);
	     pstmt.setString(5, content);
	     pstmt.setString(6, passwd);
	     pstmt.setInt(7, ref);
	     
	     pstmt.executeUpdate();
	 }
     catch(Exception e) {
           out.println("DB 연동 오류입니다. : " + e.getMessage());
     }
    %>
    
    <center><h2> 작성한 글이 등록되었습니다. </h2>
      <img src="image/green_tree.gif"> 
      <a href="board-list.jsp"> 게시글 목록 보기</a> 
    </center>

  </body>
</html>