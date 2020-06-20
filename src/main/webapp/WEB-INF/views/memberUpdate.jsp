<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	<link rel="stylesheet" type="text/css" href="resources/css/join.css">
	<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(function() {
		// pw 일치여부 체크
		$("#pw2").keyup(function() {
			$("#pwErr").empty()
			pw1 = $("#pw1").val()
			pw2 = $("#pw2").val()
			if(pw1 != "" && pw2 != ""){
				if(pw1 == pw2) {
					$("#pwErr").append("<span style='color: green;'>비밀번호가 일치합니다.</span>")
					$("#pwErr").show()
				} else {
					$("#pwErr").append("비밀번호가 일치하지 않습니다.")
					$("#pwErr").show()
				}
			}
		}) // pw keyup
		
		$("button").click(function() {
			$.ajax({
				url: "updateSave.do",
				data: {
					id: $("#id").val(),
					pw: $("#pw1").val(),
					name: $("#name").val(),
					tel: $("#tel").val()
				},
				success: function(result) {
					//console.log(result)
					if(result == 1) {
						alert("정보 수정이 완료되었습니다.")
						location.href="memberSelect.do?id=${loginID}"
					}
				} // success
			}) // ajax				
		}) // 버튼 클릭
	}) // main
	</script>
</head>
<body>
	 <div id="joinBox">
		<h1 style="text-align: left;">회원정보 수정</h1>
		<hr>
		<input type="hidden" id="id" value="${loginID}">
		<span class="title">비밀번호</span><input type="password" id="pw1">
		<span class="title">비밀번호 확인</span><input type="password" id="pw2">
			<div id="pwErr" class="err" style="display: none;"></div>
		<span class="title">이름</span><input type="text" id="name" value="${dto.name}">
		<span class="title">연락처</span><input type="text" id="tel" value="${dto.tel}">
		<button id="joinBtn">저장하기</button>
	</div>
</body>
</html>