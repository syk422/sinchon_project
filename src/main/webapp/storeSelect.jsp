<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  text-align: center;
}

.header {
  background-color: #f1f1f1;
  padding: 20px;
  text-align: center;
}

.column1 {
  float: left;
  width: 60%;
}
.column2 {
  float: left;
  width: 40%;
  padding: 5px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.i1{
margin: 20px;
width:800px;
height:500px;
}
.b1{
	font-size: 15px;
	height: 50px;
	width: 140px;
	border: none;
	background-color: #5b81ba;
	color: white;
	margin: 10px;
	float:left;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">

$(function() {
	$(".b1").click(function(){
		if("${loginID}" == ""){
			alert("로그인 후 이용하실 수 있습니다.")
		}else{
			var numValue = $(this).val()
			location.href="select.do?num="+numValue
		}
	})
	$("#loginBtn").click(function() {
		$.ajax({
			url: "login.do",
			data: {
				id: $("#id").val(),
				pw: $("#pw").val()
			},
			success: function(result) {
				if(result == 0){ // 실패
					alert("ID, PASSWORD를 확인해 주세요.")
				} else {
					location.href="storeSelect2.jsp"
				}
			} // success
		}) // ajax				
	}) // 버튼 클릭
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
		<h1>로그인</h1>
		<hr>
		<input type="text" id="id" placeholder="ID"><br>
		<input type="password" id="pw" placeholder="PASSWORD"><br>
		<button id="loginBtn">로그인</button><br>
		<a href="join.jsp">회원가입</a>
	</div>
  </div>
  
 
</div>


</body>
</html>