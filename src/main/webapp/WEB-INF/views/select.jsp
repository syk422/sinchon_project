<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function() {
	$.ajax({
		url:"list.do",
		data:{
			storeNum: "${storeNumber}"
		},
		success:function(result){
			$("#d1").append(result)
		}
	})
	
	$("#b1").click(function(){
		$.ajax({
			url:"content.do",
			data:{
				storeNum: "${storeNumber}",
				content: $("#content").val(),
				writer: "${loginID}",
				score: $("#score").val()
			},
			success:function(result){
				$("#d1").append(result)
				location.href="select.do?num=${storeNumber}"
			}
		})
	})
	
	
	
})

</script>
<style>
body{
margin: 50px 100px;
}
div{
width: 90%;
margin: 20px auto;
}
img{
	width: 300px;
	height: 200px;
}
table{
	margin: 0 auto;
	width: 80%;
}
#content{
	width: 600px;
	height: 100px;
}
#score{
	width:100px;
}

</style>
</head>
<body>
<div>
<h1 style="text-align: center;">${dto.name }</h1>
<br>
<div align="right"><a href="qnaList.do?storeNum=${storeNumber}">문의하기</a></div>
<h4>가게 정보</h4>
<table>
<tr>
	<td>주소</td><td>${dto.address}</td>
	<td rowspan="4" style="text-align: right"><img src="${pageContext.request.contextPath}/resources/img/${dto.num}.jpg"></td>
</tr>
<tr><td>전화번호</td><td>${dto.tel}</td></tr>
<tr><td>메뉴</td><td>${dto.menu}</td></tr>
<tr><td>설명</td><td>${dto.content}</td></tr>
</table>
</div>
<br>
<div id="d1">
<h4>후기</h4>
</div>
<hr>
<div>
<h4>후기 등록</h4>
<table style="text-align: center;">
<tr><th>내용</th><th>평점</th></tr>
<tr>
	<td><input type="text" id="content"></td>
	<td><select id ="score">
		<option value="5" selected="selected">★★★★★</option>
		<option value="4">★★★★</option>
		<option value="3">★★★</option>
		<option value="2">★★</option>
		<option value="1">★</option></select>
	</td>
</tr>
<tr><td colspan="2" style="text-align: right;"><button id="b1">등록</button></td></tr>
</table>


</div>
</body>
</html>