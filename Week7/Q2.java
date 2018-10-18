

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;

/**
 * Servlet implementation class Q2
 */
@WebServlet("/Q2")
public class Q2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Q2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("name"); // ���ڿ� name�� ���� �̸��� ���� �Ķ������ ���� ������
		String phone = request.getParameter("phone"); // ���ڿ� phone�� ���� �̸��� ���� �Ķ������ ���� ������
		String address = request.getParameter("address"); // ���ڿ� address�� ���� �̸��� ���� �Ķ������ ���� ������
		response.setContentType("text/html;charset=euc-kr"); // ���� ��� text�� html�� ����
		PrintWriter out = response.getWriter(); // �������� ������ ��� ��Ʈ���� ����
		out.println("NAME=" + name + "<br>"); // ��Ʈ���� NAME ���
		out.println("PHONE=" + phone + "<br>"); // ��Ʈ���� PHONE ���
		out.println("ADDRESS=" + address + "<br>"); // ��Ʈ���� ADDRESS ���
	}

}
