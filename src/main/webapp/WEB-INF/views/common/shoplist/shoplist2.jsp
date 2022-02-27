<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/shop/shoplist2.css" />

<h3>장바구니 페이지</h3>


<script>







</script>


<%-- isbn: ${isbn13} --%>

<form action="">

<table id="shoptable">
<tr>
<td colspan="2">상품정보</td>
<td>수량</td>
<td>가격</td>
<td>수량</td>
<td>합계</td>
<td>배송일정</td>
</tr>


<c:forEach items="${shoplist}" var="shoplist">
<%-- ${shoplist.bsjselectbook_isbn} --%>

<tr>
<td><input type="checkbox" size="3";/></td>
<td><img src="${shoplist.bsjselectbook_url}" alt="" /></td>
<td>수량:<input type="number" size="4" id="number"/> <input type="button" value="변경" onclick="calcul" /></td>
<td>${shoplist.bsjselectbook_title}</td>
<td>${shoplist.bsjselectbook_price}</td>
<td>합계=수량*price</td>
<td>${shoplist.bsjselectbook_status}</td>
</tr>


</c:forEach>
</table>
<br />
<br />

<input type="checkbox" />전체선택  <input type="submit" value="삭제" />
</form>

<div id="total">
<table id="totaltable">
<tr>
<td rowspan="2">아래표기</td>
<td id="coltitle" style="height: 50px;">상품금액/(5개)</td>
<td id="coltitle">배송비</td>
<td id="coltitle">결제 예정금액</td>
</tr>
<tr>

<td>1</td>
<td>2</td>
<td>3</td>
</tr>

</table>
</div>
<br />
<div id="nextbut">
<input type="button" value="주문하기"/>
</div>


