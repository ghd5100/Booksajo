<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/mypage_center2.css" />

<!-- 여기다가 검색테이블 구현하면 되겠다요 -->




<div id="cuponcheck">
현빈 페이지와 출첵 연결된 부분

</div>

<div id="tt">
주문 취소와 반품 상황

</div>




<div id="orderlist">
<table border="1px solid" style="width: 100%;">
	<tr>
		<td>기간조회</td>
		<td>기간버튼</td>
		<td rowspan="2">조회버튼</td>
	</tr>
	<tr>
		<td>상품조회</td>
		<td>상품명</td>
		
	</tr>

</table>


	<table border="1px solid" style="width: 100%;">
	<tr>
	<td>주문번호</td>
	<td>주문금액</td>
	<td>상품정보</td>
	<td>수량</td>
	<td>주문상태</td>
	<td>주문변경</td>
	</tr>
	</table>

</div>


<script src='/js/mypage_center.js'></script>