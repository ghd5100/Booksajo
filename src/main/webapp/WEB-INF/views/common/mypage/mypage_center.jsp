<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/mypage_center.css" />

<!-- 여기다가 검색테이블 구현하면 되겠다요 -->




<div id="cuponcheck">
<table style="width: 100%" height="90px">
<tr>
<td id="usertab" style="text-align: left; padding-left: 20px; width: 30%;">${myinfo.user_nickname}&nbsp;&nbsp;님</td>
<td>쿠폰</br>${myinfo.user_coupon}</td>
<td>통합포인트</br>${myinfo.user_point}</td>
<td>예치금</br></td>
</tr>
</table>
</div>

<div id="tt">
주문 취소와 반품 상황

</div>

<div id="orderlist">

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


<!-- <script src='/js/mypage_center.js'></script> -->