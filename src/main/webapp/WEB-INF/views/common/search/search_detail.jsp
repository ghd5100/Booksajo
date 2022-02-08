<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/search_center.css" />
<link rel="stylesheet" type="text/css" href="resources/css/search_detail.css">
<!-- 여기다가 검색테이블 구현하면 되겠다요 -->




<h3>SEARCH_DETAIL임당</h3>

<div id="title">

<table>


<tr>
<td><p>제목</p></td>
<td><p>지은이</p></td>
<td><p>출판사</p></td>
</tr>
<tr>
<td><p>가격</p></td>
<td><p>배송비정보</p></td>
</tr>

</table>

</div>

<div id="priceinfo">


</div>


<div id="infotab">

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">상품정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">회원리뷰</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">교환/반품/품절</a>
  </li>
</ul>

</div>


<script src='/js/search_center.js'></script>