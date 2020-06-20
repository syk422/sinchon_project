<%@page import="com.mega.sinchon.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function(){
	$("#delete").click(function(){
		var number = $(this).attr("class")
		$.ajax({
			url:"delete.do",
			data:{
				bbsNum: number
			},
			success:function(){
				alert("삭제가 완료되었습니다.")
				location.href="select.do?num=${storeNumber}"
			}
		})
	}) 
	$("#update").click(function(){
		var number = $(this).attr("class")
		$(".i"+number).removeAttr("readonly")
		$(this).click(function(){
			var contentVal = $(".i"+number).val()
			$.ajax({
				url:"update.do",
				data:{
					bbsNum: number,
					content: contentVal
				},
				success:function(){
					alert("수정이 완료되었습니다.")
					location.href="select.do?num=${storeNumber}"
				}
			})
			
		})
	}) 
	
})
</script>
<style>
.btn_img{
width:20px;
height:20px;
}
input{
width:90%;
}
</style>
</head>
<body>
<table style="text-align: center;">
<tr style="background-color: gray"><th>번호</th><th width="50%">내용</th><th>작성자</th><th>평점</th><th>작성시간</th><th>수정/삭제</th></tr>
<c:forEach items="${list}" var="dto2" varStatus="status">
<tr>
	<td>${status.index+1 }</td>
	<td style="text-align: left;"><input class="i${dto2.bbsNum }" type="text" value="${dto2.content}" readonly="readonly"></td>
	<td>${dto2.writer }</td>
	<td>${dto2.score}</td>
	<td>${dto2.time}</td>
	<td>
	<c:set var="id" value="${loginID}"></c:set>
	<c:if test="${dto2.writer eq id}">
	<button class="${dto2.bbsNum }" id="update"><img class="btn_img" src="${pageContext.request.contextPath}/resources/img/edit.png"></button>
	<button class="${dto2.bbsNum }" id="delete"><img class="btn_img" src="${pageContext.request.contextPath}/resources/img/delete.png"></button>
	</c:if>
	</td>
</tr>
</c:forEach>
</table>
<div></div>
</body>
</html>