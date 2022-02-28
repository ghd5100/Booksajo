<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_product.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>

<script>
	function select(isbn) {
		location.href = "admin_product_detail?isbn=" + isbn;
	}

</script>

</head>
<body>
	<h1>상품관리</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<div class="content_title">
				<strong>상품정보</strong>
				<div style="position: absolute; left: 120px; top: 10px">
					<button type="button" onclick="location.href='admin_product_regView'">글쓰기</button>
				</div>
				<form action="admin_product">
					<input type="text" name="product_search_keyword" />
					<button type="submit">검색</button>
				</form>
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
					
					<c:forEach items="${list }" var="list">
						<tr class="product_list" onclick="select(${list.isbn})">
							<td>${list.isbn }</td>
							<td style="text-align: left;">${list.title }</td>
							<td>${list.stock }</td>
							<td>${list.price }</td>
							<td>${list.book_status }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="paging">
				<a href="admin_product?page=1&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev_on.gif" alt="" /></a>
				<c:choose>
					<c:when test="${searchVO.page eq 1}">
						<a href="admin_product?page=${searchVO.page }&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev.gif" alt="" /></a>
					</c:when>
					<c:otherwise>
						<a href="admin_product?page=${searchVO.page - 1 }&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_prev.gif" alt="" /></a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				
				<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
					<c:choose>
						<c:when test="${i eq searchVO.page }">
							<span style="color:red; font-weight: bold;">${i }</span>&nbsp;&nbsp;&nbsp;&nbsp; 
						</c:when>
						<c:otherwise>
							<a href="admin_product?page=${i }&product_search_keyword=${searchVO.searchKeyword }" style="text-decoration: none">${i } </a>&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${searchVO.totPage eq searchVO.page }">
						<a href="admin_product?page=${searchVO.page }&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next.gif" alt="" /></a>
					</c:when>
					<c:otherwise>
						<a href="admin_product?page=${searchVO.page + 1 }&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next.gif" alt="" /></a>
					</c:otherwise>
				</c:choose>
				<a href="admin_product?page=${searchVO.totPage }&product_search_keyword=${searchVO.searchKeyword }"><img src="resources/img/btn_next_on.gif" alt="" /></a>
			</div>
			
		</div>
		
	</div>
</body>
</html>