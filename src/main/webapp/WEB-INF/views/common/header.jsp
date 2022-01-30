<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<!-- 부트스트랩 css 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>

<script src="resources/lib/jquery/jquery-3.6.0.min.js"></script>
    <script src="resources/lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/header.css">


<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->



<header class="header">
	<nav class="nav a1">
		<div class="top1">
			<ul class="nav justify-content-center">
				<li id="f"><a href="#">매장안내</a></li>
				<li id="f"><a href="#">회원해택</a></li>
				<li id="f"><a href="#">Prestige Lounge</a></li>

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



  <ul class="nav justify-content-center a2">
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
