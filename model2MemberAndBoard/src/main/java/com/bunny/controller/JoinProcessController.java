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
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(request.getParameter("userId"));
		memberDto.setUserPw(request.getParameter("userPw"));
		memberDto.setUserName(request.getParameter("userName"));
		memberDto.setUserEmail(request.getParameter("userEmail"));
		memberDto.setUserHp(request.getParameter("userHp"));
		memberDto.setUserZipcode(Integer.parseInt(request.getParameter("userZipcode")));
		
		String address =  request.getParameter("userAddr01")+
				" "+request.getParameter("userAddr02")+
				"/"+request.getParameter("userAddr03");
		memberDto.setAddress(address);
		
		int result = memberDao.insertMember(memberDto);
		if(result > 0) {
			ScriptWriter.alertAndNext(response, "회원가입 완료", "../index/");
		} else {
			ScriptWriter.alertAndBack(response, "잠시후 다시 시도해주세요.");
		}
	}


}
