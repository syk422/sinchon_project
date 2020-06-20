<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	<link rel="stylesheet" type="text/css" href="resources/css/join.css">
</head>
<body>
	<div id="joinBox">
		<h1 style="text-align: left;">회원 정보 조회</h1>
		<hr>
		<div id=joinFin style="text-align: left; padding-left: 70px;">
			<span class="title">ID</span>${loginID}<br>
			<span class="title">이름</span>${dto.name}<br>
			<span class="title">연락처</span>${dto.tel}<br>
			<br>
			<button class="selectBtn" onclick="location.href='memberUpdate.do?id=${loginID}'">정보 수정</button>
			<button class="selectBtn" onclick="location.href='pwCheck.jsp'">회원 탈퇴</button>
		</div>
	</div>
</body>
</html>