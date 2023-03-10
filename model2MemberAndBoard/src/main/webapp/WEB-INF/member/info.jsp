<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/header.jsp" %>

<h2>회원정보</h2>
 <table>
            <colgroup>
                <col style="width:20%">
                <col style="width:80%">
            </colgroup>
            <tbody>
                <tr>
                
                    <th>아이디</th>
                    <td>
                        <p>${memberInfo.userId}</p>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                       <p>${memberInfo.userName}</p>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                        <p>${memberInfo.userEmail }</p>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <p>${memberInfo.userHp }</p>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                       <div><span>${memberInfo.userZipcode }</span></div> 
                       <div><span>${memberInfo.address }</span></div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
        	<a href="../member/modify">회원정보 수정</a>
        	<a href="../member/delete?userId=${loggedID }">회원정보 탈퇴</a>
        </div>

<%@include file="../include/footer.jsp" %>