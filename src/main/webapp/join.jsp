<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="resources/css/join.css">
	<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			// ID 중복체크
			$("#id").keyup(function() {
				$("#idErr").empty()
				id = $("#id").val()
				if(id != ""){
					$.ajax({
						url: "idCheck.do",
						data: {
							id: id
						},
						success: function(result) {
							if(result == 0){ // id중복 -> 사용불가
								$("#idErr").append("이미 사용 중인 ID입니다.")
								$("#idErr").show()
								$("#pwErr").hide()
							} else {
								$("#idErr").append("<span style='color: green;'>사용 가능한 ID입니다</span>")
								$("#idErr").show()
								$("#pwErr").hide()
							}
						} // success
					}) // ajax
				}
			}) // id keyup
			
			// pw 일치여부 체크
			$("#pw2").keyup(function() {
				$("#pwErr").empty()
				pw1 = $("#pw1").val()
				pw2 = $("#pw2").val()
				if(pw1 != "" && pw2 != ""){
					if(pw1 == pw2) {
						$("#pwErr").append("<span style='color: green;'>비밀번호가 일치합니다.</span>")
						$("#pwErr").show()
						$("#idErr").hide()
					} else {
						$("#pwErr").append("비밀번호가 일치하지 않습니다.")
						$("#pwErr").show()
						$("#idErr").hide()
					}
				}
			}) // pw keyup
		}) // main
	</script>
</head>
<body>
	<div id="joinBox">
		<h1 style="text-align: left;">회원가입</h1>
		<hr>
		<form action="join.do">
		<span class="title">ID</span><input type="text" id="id" name="id">
			<div id="idErr" class="err" style="display: none;"></div>
		<span class="title">비밀번호</span><input type="password" id="pw1" name="pw">
		<span class="title">비밀번호 확인</span><input type="password" id="pw2">
			<div id="pwErr" class="err" style="display: none;"></div>
		<span class="title">이름</span><input type="text" id="name" name="name">
		<span class="title">연락처</span><input type="text" id="tel" name="tel">
		<button id="joinBtn" type="submit">회원가입</button>
		</form>
	</div>
</body>
</html>