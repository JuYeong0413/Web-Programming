

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
		
		int num1 = Integer.parseInt(request.getParameter("num1")); // 문자열 num1과 같은 이름을 가진 파라미터의 값을 가져와서 int 타입으로 변환
		int num2 = Integer.parseInt(request.getParameter("num2")); // 문자열 num2와 같은 이름을 가진 파라미터의 값을 가져와서 int 타입으로 변환
		response.setContentType("text/html;charset=euc-kr"); // 응답 방식 text나 html로 전송
		PrintWriter out = response.getWriter(); // 응답으로 내보낼 출력 스트림을 얻어낸다
		out.println("ADD=" + Integer.toString(num1 + num2) + "<br>"); // 스트림에 (num1 + num2)의 결과값 기록
		out.println("SUB=" + Integer.toString(num1 - num2) + "<br>"); // 스트림에 (num1 - num2)의 결과값 기록
		out.println("MUL=" + Integer.toString(num1 * num2) + "<br>"); // 스트림에 (num1 * num2)의 결과값 기록
		out.println("DIV=" + Integer.toString(num1 / num2) + "<br>"); // 스트림에 (num1 / num2)의 결과값 기록

	}

}
