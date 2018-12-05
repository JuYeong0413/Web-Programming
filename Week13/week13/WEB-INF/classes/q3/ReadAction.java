package q3;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ReadAction extends HttpServlet {
	private BoardDao bDao;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			bDao = new BoardDao();
			int id = Integer.parseInt(request.getParameter("id"));
			Board b = bDao.read(id);
			
			request.setAttribute("board", b);
			request.getRequestDispatcher("Q3-read.jsp").forward(request, response);
	}
}
