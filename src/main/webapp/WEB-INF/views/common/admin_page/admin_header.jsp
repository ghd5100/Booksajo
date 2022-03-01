<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<!-- 부트스트랩 css 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<body>
<div class="top_area" style="position: relative;">
	<div id="index" style="position: absolute; right: 60px; top: 25px;">
		<a href="index">Main</a>
	</div>
	<table class="top_table">
		<tr>
			<th colspan="6">관리자 페이지</th>
		</tr>
		<tr>
			<td><a href="admin_home">Home</a></td>
			<td><a href="admin_user">회원관리</a></td>
			<td><a href="admin_order">주문관리</a></td>
			<td><a href="admin_product">상품관리</a></td>
			<td><a href="admin_sales">매출정보</a></td>
			<td><a href="logout">logout</a></td>
		</tr>
	</table>

</div>
