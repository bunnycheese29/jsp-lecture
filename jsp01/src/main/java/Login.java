

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userName = "";
		if(userID.equals("bunnycheese")&& userPW.equals("1234")) {
			userName = "백예원";
		} else {
			userName = "회원이 아닙니다.";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Login</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p><strong>"+userName+"</strong></p>");
		out.println("</body>");
		out.println("</html>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		String userName = "";
		if(userID.equals("bunnycheese")&& userPW.equals("1234")) {
			userName = "백예원";
		} else {
			userName = "회원이 아닙니다.";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<title>Login</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p><strong>"+userName+"</strong></p>");
		out.println("</body>");
		out.println("</html>");
	}

}
