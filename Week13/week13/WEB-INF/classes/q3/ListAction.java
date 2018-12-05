package q3;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class ListAction extends HttpServlet {
	private BoardDao bDao;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			bDao = new BoardDao();
			int rownum = bDao.rowCount();
			List<Board> list = bDao.getBoard();
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("Q3-list.jsp").forward(request, response);
	}
}
