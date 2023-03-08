<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
    <form action="writeProcess.jsp" method="POST">
        <table>
            <colgroup>
                <col style="width: 20%">
                <col style="width: 80%">
            </colgroup>
            <tbody>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" name="userName" id="">
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="subject" id="">
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="userPW" id="">
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="contents" id="" cols="30" rows="10"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div>
            <button class="btn confirm">확인</button>
            <button type="reset" class="btn reset">취소</button>
        </div>
    </form>
</body>
</html>