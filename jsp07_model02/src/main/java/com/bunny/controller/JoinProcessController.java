package com.bunny.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bunny.model.MemberDao;
import com.bunny.model.MemberDto;
import com.bunny.utils.ScriptWriter;

@WebServlet("/member/joinProcess")
public class JoinProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JoinProcessController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userHp = request.getParameter("userHp");
		String userEmail = request.getParameter("userEmail");
		int userZipcode = Integer.parseInt(request.getParameter("userZipcode"));
		String userAddr01 = request.getParameter("userAddr01");	
		String userAddr02 = request.getParameter("userAddr02");
		String userAddr03 = request.getParameter("userAddr03");
		String address = userAddr01 + userAddr02 + userAddr03;	
		
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(userId);
		memberDto.setUserPw(userPw);
		memberDto.setUserName(userName);
		memberDto.setUserHp(userHp);
		memberDto.setUserEmail(userEmail);
		memberDto.setUserZipcode(userZipcode);
		memberDto.setAddress(address);
		
		memberDto.toString();
		

		MemberDao memberDao = new MemberDao();
		int result = memberDao.insertMember(memberDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "회원가입 성공", "/");
		} else {
			ScriptWriter.alertAndBack(response, "회원가입 실패 잠시 후 다시 시도해주세요.");
		}
	}
}
