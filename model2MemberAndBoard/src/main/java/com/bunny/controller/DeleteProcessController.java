package com.bunny.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bunny.model.MemberDao;
import com.bunny.utils.ScriptWriter;

@WebServlet("/member/deleteProcess")
public class DeleteProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public DeleteProcessController() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao memberDao = new MemberDao();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		int result = memberDao.deleteInfo(userId, userPw);
		if (result > 0 ) {
			ScriptWriter.alertAndNext(response, "회원탈퇴가 완료 되었습니다.", "../index/");
		} else {
			ScriptWriter.alertAndBack(response, "패스워드를 다시 입력해주세요.");
		}
	}

}
