<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<form action="deleteProcess.jsp" method="POST">
        <table>
            <colgroup>
                <col style="width:20%">
                <col style="width:80%">
            </colgroup>
            <tbody>
                <tr>
                    <th>아이디</th>
                    <td>
                        <span><%= session.getAttribute("userId") %></span>
                    </td>
                </tr>
                <tr>
                    <th>패스워드</th>
                    <td>
                        <input type="password" name="userPW" id="userPW" placeholder="비밀번호를 입력해 주세요.">
                    </td>
                </tr>
               
            </tbody>
        </table>
        <div>
            <button class="btn confirm">회원탈퇴</button>
            <button type="reset">취소</button>
        </div>
    </form>
<%@include file="../include/footer.jsp" %>