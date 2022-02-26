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
	var bb = "${list.title}";
	console.log(bb);
	var aaa = '${list.contents}';
	console.log(aaa);
	$("#detail_contents").append(aaa);
	
});

</script>

</head>
<body>
	<h1>상품디테일</h1>
	
	<div class="contents_area">
		<div class="content_area">

			<table>
				<tr>
					<th>도서번호</th>
					<td>
						<span>${list.isbn }</span>
					</td>
					<th>저자</th>
					<td>${list.authors }</td>
					
				</tr>
				<tr>
					<th>출판사</th>
					<td>${list.publisher }</td>
					<th>출판연도</th>
					<td>${list.pub_year }</td>
<!-- 					출판연도는 카카오꺼 가져올지 지금 db에 있는거 쓸지 골라야함 카카오꺼 쓰면 DB에 넣기전엔 수정불가-->
				</tr>
				<tr>
					<th>가격?</th>
					<td>${list.price }</td>
					<th>재고</th>
					<td>재고 어디서 가져오나</td>
				</tr>
				<tr>
					<th>도서명</th>
					<td colspan="3">${list.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3" >
					<div id="detail_contents">
					</div>
					</td>
				</tr>
				
				
			</table>
			
			<button type="button" name="isbn" onclick = "location.href = 'product_modify?isbn=${list.isbn}'">수정</button>
			<button type="button" onclick = "location.href = 'admin_product'">목록</button>
		</div>
		
	</div>
</body>
</html>