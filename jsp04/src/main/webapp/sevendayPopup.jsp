<%@page import="com.bunny.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode="on";
	String popupCookieValue = CookieManager.readCookie(request, "popupCookie02");
	if(popupCookieValue!=null && popupCookieValue.equals("off")) {
		popupMode = popupCookieValue;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-3.6.3.min.js"></script>
<style>
	.popup {
		position: fixed;
		left: 100px;
		top: 100px;
		border: 1px solid #000;
		box-shadow: 10px 10px 10px rgba(0,0,0,0.1);
		width: 400px;
	}
	.popup h2 {
		padding: 20px;
		background-color: #111;
		color: #fff;
		margin: 0;

	}
	.popup .contents {
		padding: 20px;
		background-color: white;

	}
</style>
</head>
<body>
	<%if(popupMode.equals("on")) { %>
<div class="popup">
		<h2>공지사항</h2>
		<div class="contents">
			<p>공지사항 입니다.</p>
			<p>공지사항 입니다.</p>
			<p>공지사항 입니다.</p>
			<p>공지사항 입니다.</p>
			<p>공지사항 입니다.</p>
		</div>
		<div>
				<input type="checkbox" id="sevenDayCheck" value="1"/>오늘 하루 이 창을 열지 않기
				<button class="btn sevenDay">닫기</button>
			
		</div>
	</div>
	<% } %>
	
	<script>
		$(".sevenDay").on("click", function(){
			const isChecked = $("#sevenDayCheck:checked").val(); //체크가 되면 1의 값을 보냄
			$(".popup").hide();
			$.ajax({
				url: "popupModeProcess02.jsp",
				type: "GET",
				data:{ sevenDay : isChecked },
				//dataType: "html", //서버에서 오는 응답의 파일 타입을 미리 지정
				//contentType: "", //data 속성의 값(request)의 타입을 지정 
				success: function(response){
					console.log(response);
				}
			});
		})
	</script>
</body>
</html>