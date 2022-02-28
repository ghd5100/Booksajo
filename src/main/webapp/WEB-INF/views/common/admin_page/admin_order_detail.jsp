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
	var orderStatusList = [];
	
	idList = ${orderProductList};
	orderStatusList = ${orderStatusList};
	
	
	console.log("idList : " + idList);
	console.log(listSize);
	
	
	for (var i = 0; i < listSize; i++) {
		$("#" + i).val(orderStatusList[i]).prop("selected", true);
// 		console.log($("#" + i).val(i).prop("selected", true));	
	}
	
});

// <select id="${s-1 }">
// <option value="0">배송전</option>
// <option value="1">배송중</option>
// <option value="2">배송완</option>
// <option value="3">반품중</option>
// <option value="4">반품완</option>
// <option value="5">취소</option>
// </select>

function modify() {
	
	
	var orderSelectList = [];
	var listSize = ${list.size()};
	var idList = [];
	idList = ${orderProductList};
	var orderCountList = [];
	for (var i = 0; i < listSize + 1; i++) {
		if (i < listSize) {
			console.log("i : " + i);
// 			id = idList[i];
// 			console.log("order_product_no : " + id);
			var selectValue = document.getElementById(i).options[document.getElementById(i).selectedIndex].value;
			console.log("selectValue : " + selectValue);
			var orderCount = document.getElementById("count" + i).value;
			console.log("orderCount : " + orderCount)
			orderCountList.push(orderCount);
			orderSelectList.push(selectValue);
			var data = {
					"orderSelectList" : orderSelectList,
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
					<td>
						<span>${list[0].user_name }</span>
					</td>
					
				</tr>
				
				<tr>
					<th>전화번호</th>
					<td colspan="3">
						<span>${list[0].user_phone }</span>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3">
						<span>${list[0].user_email }</span>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3">
						<span>${list[0].user_addr }</span>
					</td>
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
				<c:set var="s" value="${s+1 }" />
					<tr>
						<td>
							${list.isbn }
						</td>
						<td style="padding-left:10px; text-align: left;">
							<span>${list.title }</span>
						</td>
						<td><input type="number" id="count${s-1 }" value="${list.order_count }" /></td>
						<td>
							<select id="${s-1 }">
								<option value="0">배송전</option>
								<option value="1">배송중</option>
								<option value="2">배송완</option>
								<option value="3">반품중</option>
								<option value="4">반품완</option>
								<option value="5">취소</option>
							</select>
						</td>
						<td>
							${list.price }
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="buttons">
				<button type="button" name="isbn" onclick="modify()">수정</button>
				<button type="button" onclick="location.href='admin_order'">목록</button>
			</div>
		</div>
		
	</div>
</body>
</html>