package beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String jdbcurl = "jdbc:mysql://localhost:3306/week13";
	private final String username = "juyeong";
	private final String password = "0413";
	
	// 게시글 목록 보기
	public List<Board> getBoard() {
		int id, ref;
        int rownum = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from board_tbl order by ref desc, id asc ";
		List<Board> list = new ArrayList<Board>();
		
		try {
			conn = DriverManager.getConnection(jdbcurl, username, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);			
			
			rs.last();
			rownum = rs.getRow();
		    rs.beforeFirst();
		      
		  	 while(rs.next())
			 {
		  		   Board b = new Board();
			       id = Integer.parseInt(rs.getString("id"));
			       ref = Integer.parseInt(rs.getString("ref"));
			       b.setId(id);
			       b.setName(rs.getString("name"));
			       b.setE_mail(rs.getString("e_mail"));
			       b.setTitle(rs.getString("title"));
			       b.setContent(rs.getString("content"));
			       b.setPasswd(rs.getString("passwd"));
			       b.setRef(ref);
			       list.add(b);
			 }
		}
		catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		finally {
			this.close(conn, stmt, rs);
		}
		
		return list;
	}
	
	// 게시글 내용 보기
	public Board read(int num) {
		Board b = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from board_tbl where id = " + num;
		
		try {
			conn = DriverManager.getConnection(jdbcurl, username, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			 while(rs.next())  {
				   b = new Board();
				   b.setName(rs.getString("name"));
			       b.setE_mail(rs.getString("e_mail"));
			       b.setTitle(rs.getString("title"));
			       b.setContent(rs.getString("content"));
			       b.setRef(Integer.parseInt(rs.getString("ref")));
			 }
		}
		catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		finally {
			this.close(conn, stmt, rs);
		}
		
		return b;
	}
	
	// row count
	public int rowCount() {
		int count;
		int id = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select max(id) as max_id, count(*) as count from board_tbl";
		
		try {
			conn = DriverManager.getConnection(jdbcurl, username, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
		     while(rs.next()) {
			  	 count = Integer.parseInt(rs.getString("count"));
			   	 if(count != 0) id = Integer.parseInt(rs.getString("max_id"));
			 }
		}
		catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		finally {
			this.close(conn, stmt, rs);
		}
		
		return id;
	}
	
	// 게시글 작성
	public void insertBoard(Board b) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into board_tbl values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			 conn = DriverManager.getConnection(jdbcurl, username, password);
			 pstmt = conn.prepareStatement(sql);
			 int id = rowCount() + 1;
			 int ref = id;
			
		     pstmt.setInt(1, id);
		     pstmt.setString(2, b.getName());
		     pstmt.setString(3, b.getE_mail());
		     pstmt.setString(4, b.getTitle());
		     pstmt.setString(5, b.getContent());
		     pstmt.setString(6, b.getPasswd());
		     pstmt.setInt(7, ref);
		     
		     pstmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("DB 연동 오류입니다. : " + e.getMessage());
		}
		finally {
			this.close(conn, pstmt, rs);
		}
	}
	
	// close
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		if(rs != null ) {
			try {
				rs.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(stmt != null ) {
			try {
				stmt.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null ) {
			try {
				conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
