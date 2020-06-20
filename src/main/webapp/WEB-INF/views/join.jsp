<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>환영합니다</title>
	<link rel="stylesheet" type="text/css" href="resources/css/join.css">
</head>
<body>
	<div id="joinBox">
		<h1 style="text-align: left;">회원가입 완료</h1>
		<hr>
		<div id=joinFin>
			<strong>${memberDTO.name}</strong>님 환영합니다<br>
			<strong>회원가입</strong>이 완료되었습니다.<br>
			<button id="joinBtn" onclick="location.href='/sinchon/storeSelect.jsp'">로그인</button>
		</div>
	</div>
</body>
</html>