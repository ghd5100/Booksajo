<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_user.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>


</head>
<body>
	<h1>주문 관리</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<div class="content_title">
				<strong>주문정보</strong>
				<form action="admin_order">
					<input type="text" name="order_search_keyword" />
					<button type="submit">검색</button>
				</form>
			</div>
			<div class="content_detail">
				<table>
					<tr>
						<th style="width: 200px">주문 날짜</th>
						<th style="width: 100px">주문 번호</th>
						<th style="width: 100px">ID</th>
						<th style="width: 100px">이름</th>
						<th style="width: 150px">전화번호</th>
						<th style="width: 100px">주문 상황</th>
						<th style="width: 150px">총 금액</th>
						<th style="width: 100px">수정	</th>
					</tr>
					
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.order_date }</td>
							<td>${list.order_no }</td>
							<td>${list.user_id }</td>
							<td>${list.user_name }</td>
							<td>${list.user_phone }</td>
							<td>${list.order_status }</td>
							<td>${list.order_total_price }</td>
							<td>
								<a href="">수정</a>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		
	</div>
</body>
</html>