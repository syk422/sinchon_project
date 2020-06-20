<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 확인</title>
	<link rel="stylesheet" type="text/css" href="resources/css/login.css">
	<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("button").click(function() {
				$.ajax({
					url: "pwCheck.do",
					data: {
						id: $("#id").val(),
						pw: $("#pw").val()
					},
					success: function(result) {
						if(result == 0){ // 실패
							alert("PASSWORD를 확인해 주세요.")
						} else {
							alert("탈퇴가 완료되었습니다.")
							location.href="login.jsp"
						}
					} // success
				}) // ajax				
			}) // 버튼 클릭
		}) // main
	</script>
</head>
<body>
	<div id="loginBox">
		<h1 style="text-align: left;">비밀번호 확인</h1>
		<hr>
		<input type="hidden" id="id" value="${loginID}">
		<input type="password" id="pw" placeholder="PASSWORD"><br>
		<button id="loginBtn">확인</button>
	</div>
</body>
</html>