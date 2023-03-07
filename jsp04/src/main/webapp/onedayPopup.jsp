<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<% String popupMode = "on";
		Cookie cookies[] = request.getCookies();
		if(cookies!=null ) {
			for(int i = 0 ; i < cookies.length ; i++){
				String cookieName = cookies[i].getName();
				String cookieValue = cookies[i].getValue();
				if(cookieName.equals("popupCookie")){
					popupMode = cookieValue;
				}
			}
		}
	%>
	
	<% if(popupMode.equals("on")) { %>
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
				<input type="checkbox" id="onedayCheck" />오늘 하루 이 창을 열지 않기
				<button class="btn oneday">닫기</button>
			
		</div>
	</div>
<% } %>
<script>
	$(".oneday").on("click", function(){
		console.log($("#onedayCheck").is(":checked"));
		
		const isChecked = $("#onedayCheck").is(":checked") ? 1 : 0;
		
		$(".popup").hide();
		$.ajax({
			url: "popupModeProcess.jsp",
			type: "GET",
			data: {oneday: isChecked},
			success: function(response){
				console.log(response);
			},
		});
		return false;
	});

</script>

</body>
</html>