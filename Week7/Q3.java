

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;

/**
 * Servlet implementation class Q3
 */
@WebServlet("/Q3")
public class Q3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Q3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int num1 = Integer.parseInt(request.getParameter("num1")); // ���ڿ� num1�� ���� �̸��� ���� �Ķ������ ���� �����ͼ� int Ÿ������ ��ȯ
		int num2 = Integer.parseInt(request.getParameter("num2")); // ���ڿ� num2�� ���� �̸��� ���� �Ķ������ ���� �����ͼ� int Ÿ������ ��ȯ
		response.setContentType("text/html;charset=euc-kr"); // ���� ��� text�� html�� ����
		PrintWriter out = response.getWriter(); // �������� ������ ��� ��Ʈ���� ����
		out.println("ADD=" + Integer.toString(num1 + num2) + "<br>"); // ��Ʈ���� (num1 + num2)�� ����� ���
		out.println("SUB=" + Integer.toString(num1 - num2) + "<br>"); // ��Ʈ���� (num1 - num2)�� ����� ���
		out.println("MUL=" + Integer.toString(num1 * num2) + "<br>"); // ��Ʈ���� (num1 * num2)�� ����� ���
		out.println("DIV=" + Integer.toString(num1 / num2) + "<br>"); // ��Ʈ���� (num1 / num2)�� ����� ���

	}

}
