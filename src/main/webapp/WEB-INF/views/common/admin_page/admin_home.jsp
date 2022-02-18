<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/admin_page/admin_home.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>

</head>
<body>
	<h1>관리자 페이지</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<div class="content_title">
				<strong>최근 가입 회원</strong>
				<span><a href="admin_user">more +</a></span>
			</div>
			<div class="content_detail">
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대전화</th>
						<th>가입일</th>
					</tr>
					
					<c:forEach items="${user_list }" var="user_list">
						<tr>
							<td>${user_list.user_id }</td>
							<td>${user_list.user_name }</td>
							<td>${user_list.user_phone }</td>
							<td>${user_list.user_date }</td>
						</tr>
					</c:forEach>
					
					
				</table>
			</div>
		</div>
		
		<div class="content_area">
			<div class="content_title">
				<strong>최근 주문</strong>
				<span><a href="admin_order">more +</a></span>
			</div>
			<div class="content_detail">
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대전화</th>
						<th>가입일</th>
					</tr>
					
					<c:forEach items="${user_list }" var="user_list">
						<tr>
							<td>${user_list.user_id }</td>
							<td>${user_list.user_name }</td>
							<td>${user_list.user_phone }</td>
							<td>${user_list.user_date }</td>
						</tr>
					</c:forEach>
					
					
				</table>
			</div>
		</div>
		
		
		<div class="content_area">
			<div class="content_title">
				<strong>상품 정보</strong>
				<span><a href="admin_product">more +</a></span>
			</div>
			<div class="content_detail">
				<table>
					<tr>
						<th>isbn</th>
						<th>상품 이름</th>
						<th>재고</th>
						<th>가격</th>
					</tr>
					<tr>
						<td>9788984373068</td>
						<td>브루클린의 소녀 :기욤 뮈소 장편소설 </td>
						<td>이거 할까 말까</td>
						<td>14500</td>
					</tr>
					
					<tr>
						<td>id</td>
						<td>김개똥</td>
						<td>010-0000-0000</td>
						<td>22-02-14</td>
					</tr>
				</table>
			</div>
		</div>
		
		
	</div>
</body>
</html>