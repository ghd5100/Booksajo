<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<!-- 부트스트랩 css 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
<!-- 	<script src="resources/lib/jquery/jquery-3.6.0.min.js"></script>
    <script src="resources/lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap/css/bootstrap.min.css">
부트스트랩은 제이쿼리랑 자바스크립트 기반으로함으로 라이브러리 추가해줘야 동작함
왜 안돼는지 머르게네..경로도 맞는것같은데 적용안됌
 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>

.top1 {
	border-collapse: collapse;
	width: auto;
	font-size: 11px;
	padding-left: 3%;
}

#g{
position: relative;
left: 780px;
}

.d-flex{
/* border: 1px solid; */
padding:55px 65px;
width: 500px;
position: relative; left: 10%;
}

.btn{
float: right;
position: relative;
left: 50px;
bottom: 37px;
background-color: #fff;

}

#c {
	border: none;
	margin-left: 850px;
	padding-right: 10px;
}

.top2 {
	border: 1px solid;
	border-collapse: collapse;
	background-color: #eee;
	height: 150px;
	padding-left: 5%;
	padding-top: 3%;
}

#a{
margin-left:5%;
padding: 2%;
/* border:1px solid; */
border: none;
/* 로고부분 */
float: left;
}

#b{
margin: 0% 10%;
padding-left:5%;
width:500px;
border: none;
float: left;
/* 서치부분 */
}



a{
font:bold;
color: white;
}


#c{
border: none;
color: white;
}

.list-inline{
border: 1px solid;
padding: 10px;
background-color: #6662a1;

 
}

footer{
padding-top:50px;
height:200px;
background-color: #f5f5f5;
}
p{
padding-bottom: 5px;
padding-right: 10%;
}

.footer {
margin-bottom:0px;
border: none;
padding: 10px;
background-color: #a7a69d;

}
.footer a{
color: #dbd7d2;
text-decoration: none;
}

</style>



<header class="header">
	<nav class="navbar navbar-default">
		<div class="top1">
			<ul class="nav navbar-nav">
				<li><a href="#">매장안내</a></li>
				<li><a href="#">회원해택</a></li>
				<li><a href="#">Prestige Lounge</a></li>

				<li id="g"><a href="#">로그인</a></li>
				<li id="g"><a href="#">회원가입</a></li>
				<li id="g"><a href="#">출석체크</a></li>
				<li id="g"><a href="#">고객센터</a></li>
				<li id="g"><a href="#">주문배송</a></li>
				<li id="g"><a href="#">장바구니</a></li>
			</ul>
		</div>
	</nav>

<div id="a">
<a href="index"><img src="resources/img/logo.png" width="205px" height="97px" alt="" width="30" height="24" id="img"></a>
</div>
<div id="b">
<form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit" style="height: 40px; float: right; "  >
      <img src="resources/img/search_icon3.png" width="23px;"  height="23px;" />
      </button>
    </form>
</div>
<span id="c">여백</span>



  <ul class="list-inline">
  <!-- 부트스트랩의 1.형태요소이면서 2.클래스 이름이기도함 -->
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="search" ><b>국내도서</b>
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="search">카테고리1</a></li>
      <li><a href="search">카테고리2</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="search">카테고리3</a></li>
    </ul>
       <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>외국도서</b>
    <span class="caret"></span></a>
    <ul class="dropdown-menu">
      <li><a href="#">카테고리1</a></li>
      <li><a href="#">카테고리2</a></li>
      <li><a href="#">카테고리3</a></li>
    </ul>
    <li><a href="#">굿즈</a></li>
    <li><a href="#">중고장터</a></li>
  </ul>

</header>
</head>

<body>
