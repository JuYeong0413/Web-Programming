

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
		
		String name = request.getParameter("name"); // 문자열 name과 같은 이름을 가진 파라미터의 값을 가져옴
		String phone = request.getParameter("phone"); // 문자열 phone과 같은 이름을 가진 파라미터의 값을 가져옴
		String address = request.getParameter("address"); // 문자열 address과 같은 이름을 가진 파라미터의 값을 가져옴
		response.setContentType("text/html;charset=euc-kr"); // 응답 방식 text나 html로 전송
		PrintWriter out = response.getWriter(); // 응답으로 내보낼 출력 스트림을 얻어낸다
		out.println("NAME=" + name + "<br>"); // 스트림에 NAME 기록
		out.println("PHONE=" + phone + "<br>"); // 스트림에 PHONE 기록
		out.println("ADDRESS=" + address + "<br>"); // 스트림에 ADDRESS 기록
	}

}
