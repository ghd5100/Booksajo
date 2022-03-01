<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_order.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>
<script>

function select(orderNo) {
	
	console.log(orderNo);
	
	location.href = "admin_order_detail?order_no=" + orderNo;
	
}

</script>

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
						<th style="width: 150px">ID</th>
						<th style="width: 150px">이름</th>
						<th style="width: 150px">전화번호</th>
						<th style="width: 150px">총 금액</th>
					</tr>
					<c:forEach items="${list }" var="list">
					
						<tr class="order_list" onclick="select(${list.order_no })">
							<td>${list.order_date }</td>
							<td>${list.order_no }</td>
							<td>${list.user_id }</td>
							<td>${list.user_name }</td>
							<td>${list.user_phone }</td>
							<td>${list.total_price }원</td>
						</tr>

					</c:forEach>
				</table>
			</div>
			<div class="paging">
				<a href="admin_order?page=1&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev_on.gif" alt="" /></a>
				<c:choose>
					<c:when test="${searchVO.page eq 1}">
						<a href="admin_order?page=${searchVO.page }&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev.gif" alt="" /></a>
					</c:when>
					<c:otherwise>
						<a href="admin_order?page=${searchVO.page - 1 }&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev.gif" alt="" /></a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				
				<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
					<c:choose>
						<c:when test="${i eq searchVO.page }">
							<span style="color:red; font-weight: bold;">${i }</span>&nbsp;&nbsp;&nbsp;&nbsp; 
						</c:when>
						<c:otherwise>
							<a href="admin_order?page=${i }&order_search_keyword=${searchVO.searchKeyword }" style="text-decoration: none">${i } </a>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${searchVO.totPage eq searchVO.page }">
						<a href="admin_order?page=${searchVO.page }&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next.gif" alt="" /></a>
					</c:when>
					<c:otherwise>
						<a href="admin_order?page=${searchVO.page + 1 }&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next.gif" alt="" /></a>
					</c:otherwise>
				</c:choose>
				<a href="admin_order?page=${searchVO.totPage }&order_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next_on.gif" alt="" /></a>
			</div>
		</div>
		
	</div>
</body>
</html>