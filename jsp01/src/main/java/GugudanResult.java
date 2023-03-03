

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GugudanResult")
public class GugudanResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GugudanResult() {
        super();
    }

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>"+num+"단을 출력합니다.</title>");
		out.println("</head>");
		out.println("<body>");
		for(int i = 1 ; i < 10 ; i++) {
			out.println("<p>"+num+"x"+i+"="+num+"</p>");
		}
		out.println("<a href='/jsp01/GugudanForm'>뒤로가기</a>");
		out.println("</body>");
		out.println("</html>");
		}
		
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
}
	}

