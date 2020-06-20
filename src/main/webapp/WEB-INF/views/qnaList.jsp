<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QnA</title>
	<link rel="stylesheet" type="text/css" href="resources/css/qna.css">
	<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#qnaBtn").click(function() {
				storeNum = "${storeNumber}"
				writer = "${loginID}"
				$.ajax({
					url: "qnaInsert.do",
					data: {
						storeNum: storeNum,
						content: $("#content").val(),
						writer: writer
					},
					success: function(result) {
						console.log(result)
						if(result == 1){
							alert("문의사항 등록이 완료되었습니다.")
							location.href="qnaList.do?storeNum=${storeNumber}"
						}
					} // success
				}) // ajax
			}) // 버튼 클릭
		}) // main
	</script>
</head>
<body>
	<div id="listBox">
		<h1 style="text-align: left;">QnA</h1>
		<hr>
		<h3 style="text-align: left;">문의사항 입력</h3>
			<input type="text" id="content">
			<button type="submit" id="qnaBtn" class="qnaBtnStyle">확인</button>
		<hr>
		<table style="width: 100%; margin: 0px;">
		<tr>
			<th width="10%">no</th>
			<th width="50%">내용</th>
			<th width="20%">작성자</th>
			<th width="20%">날짜</th>
		</tr>
		<c:forEach items="${list3}" var="dto">
		<tr>
			<td>${dto.qnaNum}</td>
			<td>${dto.content}</td>
			<td>${dto.writer}</td>
			<td>${dto.date}</td>
		</tr>
			<c:forEach items="${list2}" var="dto2">
			<c:if test="${dto2.qnaNum eq dto.qnaNum}">
			<tr>
				<td style="background-color: #e6e6e6;">ㄴre</td>
				<td style="background-color: #e6e6e6;">${dto2.content}</td>
				<td style="background-color: #e6e6e6;">${dto2.writer}</td>
				<td style="background-color: #e6e6e6;">${dto2.date}</td>
			</tr>
			</c:if>
			</c:forEach>
		</c:forEach>
		</table>
	</div>
</body>
</html>