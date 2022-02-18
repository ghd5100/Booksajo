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
</head>
<body>
	<h1>상품수정</h1>
	
	<div class="contents_area">
		<div class="content_area">
		<form action="admin_product_update">
			<input type="hidden" name="isbn" value="${list.isbn }" />
			<table>
				<tr>
					<th>도서번호</th>
					<td>
						<span>${list.isbn }</span>
					</td>
					<th>저자</th>
					<td><input type="text" name="authors" value="${list.authors }" /></td>
					
				</tr>
				<tr>
					<th>출판사</th>
					<td><input type="text" name="publisher" value="${list.publisher }" /></td>
					<th>출판연도</th>
					<td><input type="text" name="pub_year" value="${list.pub_year }" /></td>
<!-- 					출판연도는 카카오꺼 가져올지 지금 db에 있는거 쓸지 골라야함 카카오꺼 쓰면 DB에 넣기전엔 수정불가-->
				</tr>
				<tr>
					<th>가격?</th>
					<td><input type="text" name="price" value="${list.price }" /></td>
					<th>재고</th>
					<td><input type="text" name="재고 어디서 가져오냐" value="재고 어디서 가져오나"/></td>
				</tr>
				<tr>
					<th>도서명</th>
					<td colspan="3"><input style="width:100%" type="text" name="title" value="${list.title }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="contents" >${list.contents }</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="확인" />
			<button type="button" name="isbn" onclick = "location.href = 'admin_product_detail?isbn=${list.isbn}'">취소</button>
		</form>
		</div>
		
	</div>
</body>
</html>