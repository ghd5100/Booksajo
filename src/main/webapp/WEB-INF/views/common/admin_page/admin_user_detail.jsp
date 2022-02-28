<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_product_detail.css" />
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
	<h1>유저상세</h1>
	
	<div class="contents_area">
		<div class="content_area">

			<table>
				<tr>
					<th class="left">아이디</th>
					<td class="right">
						<span>${userList.user_id }</span>
					</td>
					<th class="left">가입일</th>
					<td class="right">
						<span>${userList.user_date }</span>
					</td>
					
				</tr>
				
				<tr>
					<th class="left">닉네임</th>
					<td class="right">
						<span>${userList.user_nickname }</span>
					</td>
					<th class="left">이름</th>
					<td class="right">
						<span>${userList.user_name }</span>
					</td>
					
				</tr>
				<tr>
					<th class="left">성별</th>
					<td class="right">
						<span>${userList.user_gender }</span>
					</td>
					<th class="left">나이</th>
					<td class="right">
						<span>${userList.user_age }</span>
					</td>
				</tr>
				<tr>
					<th class="left">전화번호</th>
					<td class="right">
						<span>${userList.user_phone }</span>
					</td>
					<th class="left">이메일</th>
					<td class="right">
						<span>${userList.user_email }</span>
					</td>
				</tr>
				<tr>
					<th class="left">주소</th>
					<td colspan="3">
						<span>${userList.user_addr }</span>
					</td>
				</tr>
				
			</table>
			<table style="text-align: center">
				<tr>
					<th colspan="3">주문내역</th>
				</tr>
				<tr>
					<th>주문 날짜</th>
					<th>주문 번호</th>
					<th>총 금액</th>
				</tr>
				<c:forEach items="${orderList }" var="orderList">
					<tr class="order_list" onclick="select(${orderList.order_no })">
						<td>
							<span>
								${orderList.order_date }
							</span>
						</td>
						<td>
							<span>
								${orderList.order_no }
							</span>
						</td>
						<td>
							<span>
								${orderList.order_total_price }
							</span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="buttons">
				<button type="button" onclick="location.href='admin_user'">목록</button>
			</div>
		</div>
		
	</div>
</body>
</html>