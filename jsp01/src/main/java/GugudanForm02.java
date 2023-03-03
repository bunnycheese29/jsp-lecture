

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GugudanForm02")
public class GugudanForm02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GugudanForm02() {
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
				+ "<input type = 'radio' name ='num' value='2'>2단"
				+ "<input type = 'radio' name ='num' value='3'>3단"
				+ "<input type = 'radio' name ='num' value='4'>4단"
				+ "<input type = 'radio' name ='num' value='5'>5단"
				+ "<input type = 'radio' name ='num' value='6'>6단"
				+ "<input type = 'radio' name ='num' value='7'>7단"
				+ "<input type = 'radio' name ='num' value='8'>8단"
				+ "<input type = 'radio' name ='num' value='9'>9단"
				+ "<button>구구단 출력</button)"
				+ "</form>");
		out.println("</body>");
		out.println("</html>");
		
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
