
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckBoxSender")
public class CheckBoxSender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckBoxSender() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>check box 데이터 보내기</h1>");
		out.println("<form method='GET' action='/jsp02/CheckboxReceiver'>"
				+ "<p>관심 분야를 선택하세요.</p>"
				+ "<input type='checkbox' name='interest' value='자바'><span>자바</span>"
				+ "<input type='checkbox' name='interest' value='파이썬'><span>파이썬</span>"
				+ "<input type='checkbox' name='interest' value='자바스크립트'><span>자바스크립트</span>"
				+ "<input type='checkbox' name='interest' value='씨샵'><span>씨샵</span>"
				+ "<input type='checkbox' name='interest' value='Go'><span>Go</span>"
				+ "<button>send</button>"
				+ "</form>");
		out.println("</body>");
		out.println("</html>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
