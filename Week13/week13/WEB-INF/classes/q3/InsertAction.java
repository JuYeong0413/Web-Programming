package q3;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class InsertAction extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			request.setCharacterEncoding("euc-kr");
			String name = request.getParameter("name");
			String e_mail = request.getParameter("e_mail");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String passwd = request.getParameter("passwd");
			
			Board b = new Board();
			b.setName(name);
			b.setE_mail(e_mail);
			b.setTitle(title);
			b.setContent(content);
			b.setPasswd(passwd);
			
			BoardDao bDao = new BoardDao();
			bDao.insertBoard(b);
			
			response.sendRedirect("Q3-success.jsp");
	}
}
