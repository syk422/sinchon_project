<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/login2.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function() {
	console.log("세션")
	console.log("${loginID}")
	$(".b1").click(function(){
		if("${loginID}" == ""){
			alert("로그인 후 이용하실 수 있습니다.")
		}else{
			var numValue = $(this).val()
			location.href="select.do?num="+numValue
		}
	})
})

</script>
</head>
<body>
<div class="header">
  <h1>신촌 맛집</h1>
</div>
<div class="row">
  <div class="column1">
    <input class="i1" type="image" src="resources/img/sinchon.png"><br>
    <div style="margin-left: 80px">
	<button class="b1" value="1">1. 신촌황소곱창</button>
	<button class="b1" value="2">2. 형제갈비</button>
	<button class="b1" value="3">3. 신촌 돈부리모노</button>
	<button class="b1" value="4">4. 정육면체</button>
	<button class="b1" value="5">5. 판자집</button>
	</div>
  </div>
  
  <div class="column2">
    <div id="loginBox">
		<h1>${loginID} 님</h1>
		<hr>
		<button id="mypageBtn" onclick="location.href='memberSelect.do?id=${loginID}'">마이페이지</button><br>
		<form action="logout.do">
			<button id="logoutBtn">로그아웃</button><br>
		</form>
	</div>
  </div>
</div>



</body>
</html>