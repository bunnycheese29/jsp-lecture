

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GugudanForm03")
public class GugudanForm03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public GugudanForm03() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>구구단을 선택해 주세요.</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<form action='/jsp01/GugudanResult' method='GET'>"
				+ "<select name='num'>"
				+ "<option value ='2'>2단</option>"
				+ "<option value ='3'>3단</option>"
				+ "<option value ='4'>4단</option>"
				+ "<option value ='5'>5단</option>"
				+ "<option value ='6'>6단</option>"
				+ "<option value ='7'>7단</option>"
				+ "<option value ='8'>8단</option>"
				+ "<option value ='9'>9단</option>"
				+ "</select>"
				+ "<button>구구단 출력</button)>"
				+ "</form>");
		out.println("</body>");
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
