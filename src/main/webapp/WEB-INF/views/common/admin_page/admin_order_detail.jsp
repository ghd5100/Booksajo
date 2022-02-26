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

$(function(){
	var listSize = ${list.size()};
	var idList = [];
	idList = ${orderProductList};
	for (var i = 0; i < listSize; i++) {
		
		console.log($("#" + idList[i]).val(idList[i]).prop("selected", true));	
	}
	
});
function modify() {
	
	
	var orderStatusList = [];
	var listSize = ${list.size()};
	var idList = [];
	idList = ${orderProductList};
	var orderCountList = [];
	for (var i = 0; i < listSize + 1; i++) {
		if (i < listSize) {
			console.log("i : " + i);
			id = idList[i];
			console.log("order_product_no : " + id);
			var selectValue = document.getElementById(id).options[document.getElementById(id).selectedIndex].value;
			console.log("selectValue : " + selectValue);
			var orderCount = document.getElementById("count" + id).value;
			console.log("orderCount : " + orderCount)
			orderCountList.push(orderCount);
			orderStatusList.push(selectValue);
			var data = {
					"orderStatusList" : orderStatusList,
					"orderProductNo" : idList,
					"orderCountList" : orderCountList
			}

		} else {
			$.ajax({
				type: 'get',
				url: 'admin_order_modify',
				data: data,
				success:function (data) {
					console.log("성공했다");
					alert("수정 성공");
					location.href = "admin_order_detail?order_no=${list[0].order_no}";
				}
			});
		}
		
	}
	
}

</script>

</head>
<body>
	<h1>주문상세</h1>
	
	<div class="contents_area">
		<div class="content_area">

			<table>
				<tr>
					<th>주문번호</th>
					<td>
						<span>${list[0].order_no }</span>
					</td>
					<th>주문날짜</th>
					<td>
						<span>${list[0].order_date }</span>
					</td>
					
				</tr>
				
				<tr>
					<th>ID</th>
					<td>
						<span>${list[0].user_id }</span>
					</td>
					<th>이름</th>
					<td>${list[0].user_name }</td>
					
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td colspan="3">${list[0].user_phone }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3">${list[0].user_email }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">${list[0].user_addr }</td>
				</tr>
				
			</table>
			<table class="order_list" style="text-align: center">
				<tr>
					<th colspan="5">주문내역</th>
				</tr>
				<tr>
					<th width="200">도서 번호</th>
					<th width="400">도서 제목</th>
					<th width="100">주문 수량</th>
					<th width="150">배송 수정</th>
					<th width="150">도서 가격</th>
				</tr>
				<c:forEach items="${list }" var="list">
					<tr>
						<td>${list.isbn }</td>
						<td style="padding-left:10px; text-align: left;">${list.title }</td>
						<td><input type="number" id="count${list.order_product_no }" value="${list.order_count }" /></td>
						<td>
							<select id="${list.order_product_no }">
								<option value="0">배송전</option>
								<option value="1">배송중</option>
								<option value="2">배송완</option>
								<option value="3">반품중</option>
								<option value="4">반품완</option>
								<option value="5">취소</option>
							</select>
						</td>
						<td>${list.price }</td>
					</tr>
				</c:forEach>
			</table>
			
			<button type="button" name="isbn" onclick="modify()">수정</button>
<!-- 			<button type="button" name="isbn" onclick="location.href = 'admin_order_modify'">수정</button> -->
			<button type="button" onclick="location.href='admin_order'">목록</button>
		</div>
		
	</div>
</body>
</html>