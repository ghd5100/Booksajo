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
<script>

function selectOrder(orderNo) {
	
	location.href = "admin_order_detail?order_no=" + orderNo;
	
}
function selectProduct(isbn) {
	
	location.href = "admin_product_detail?isbn=" + isbn;
	
}
function selectUser(user_id) {
	
	location.href = "admin_user_detail?user_id=" + user_id;
	
}

</script>
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
						<th>주소</th>
						<th>가입일</th>
					</tr>
					
					<c:forEach items="${user_list }" var="user_list">
						<tr class="list" onclick="selectUser('${user_list.user_id}')">
							<td>${user_list.user_id }</td>
							<td>${user_list.user_name }</td>
							<td>${user_list.user_phone }</td>
							<td>${user_list.user_addr }</td>
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
						<th style="width: 200px">주문 날짜</th>
						<th style="width: 100px">주문 번호</th>
						<th style="width: 150px">ID</th>
						<th style="width: 150px">이름</th>
						<th style="width: 150px">전화번호</th>
						<th style="width: 150px">총 금액</th>
					</tr>
					<c:forEach items="${order_list }" var="order_list">
					
						<tr class="list" onclick="selectOrder(${order_list.order_no })">
							<td>${order_list.order_date }</td>
							<td>${order_list.order_no }</td>
							<td>${order_list.user_id }</td>
							<td>${order_list.user_name }</td>
							<td>${order_list.user_phone }</td>
							<td>${order_list.order_total_price }</td>
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
						<th width="200px">도서 번호</th>
						<th width="450px">도서 제목</th>
						<th width="100px">재고</th>
						<th width="150px">가격</th>
						<th width="100px">도서 상태</th>
<!-- 						노출 비노출..? -->
<!-- 						삭제는 안보이는쪽으로..? 삭제는 안쪽에서 설정하게..? 그러면 테이블에 flag 추가..? -->
					</tr>
					
					<c:forEach items="${product_list }" var="product_list">
						<tr class="list" onclick="selectProduct(${product_list.isbn})">
							<td>${product_list.isbn }</td>
							<td style="text-align: left;">${product_list.title }</td>
							<td>재고 넣어야함</td>
							<td>${product_list.price }</td>
							<td>도서 상태 넣어야함</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		
	</div>
</body>
</html>