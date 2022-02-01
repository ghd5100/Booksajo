<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="resources/css/search_table.css">



<div id="d1">
	<!-- 총검색결과  -->
	${search } 검색결과 총 1789건
	<hr />
</div>

<div id="d2">
	<!-- 연관검색어 -->
	<b>연관검색어</b> 웹퍼블리셔 css html 자바스크립트

</div>


<div id="d3">
	<!-- 카테고리 검색 고정되있어야함 부트스트랩 쓰긔 -->

	<div class="container-fluid">
		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button data-toggle="collapse" href="#collapseExample"
				aria-expanded="false" aria-controls="collapseExample" style="float: left; width:150px;">카테고리</button>
		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
		<div class="collapse" id="collapseExample">
			<div class="well">소분류</div>
			
		</div>

	</div>





</div>

<div id="d4">
	<!-- 도서결과 뿌려줄곳 -->
	<table class="table">
		<thead>
			<tr>
				<th scope="col" width="20%">국내도서/책이미지</th>
				<th scope="col" rowspan="4" width="35%">제목 저자 출판사 키워드</th>
				<th scope="col" width="15%">평점</th>
				<th scope="col" width="15%">가격</th>
				<th scope="col" width="15%">수량 및 장바구니</th>
			</tr>
		</thead>
		<tbody>
			<tr height="150px">
				<td>2</td>
				<td rowspan="4">
					<p>제목</p>
					<p>저자</p>
					<p>출판사</p>
					<p>키워드</p>
				</td>
				<td>평점</td>
				<td>가격</td>
				<td>수량 및 장바구니</td>
			</tr>
		</tbody>
		<tr height="150px">
			<td>3</td>
			<td rowspan="4">
				<p>제목</p>
				<p>저자</p>
				<p>출판사</p>
				<p>키워드</p>
			</td>
			<td>평점</td>
			<td>가격</td>
			<td>수량 및 장바구니</td>
		</tr>

	</table>

</div>