<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="resources/css/shop/shoplist2.css" />



<!-- 아.. 해드 연결안해서  자바스크립트 링크 연동안됬구나. -->

<%
	int total = 0;
%>


<script>


function chekin() {
	
	var chk_arr = [];
$('input[name="chkList"]:checked').each(function() {
	var chk = $(this).val();
	chk_arr.push(chk);
	
	
	var total = 0*1;
	for (var i = 0; i < chk_arr.length; i++) {
		total += chk_arr[i]*1;
		/* console.log(chk_arr[i]); */
		//console.log(typeof(chk_arr[i])); 타입이 스트링이네여.. 
	} //리듀스 함수써도 배열 다 더해짐
	console.log(total); //결과확인
	document.exf1.t1.value = total;
	document.exf1.t2.value = total+2500;
})


}



</script>


<%-- isbn: ${isbn13} --%>




<input type="checkbox" style="float: left; width: 30px; height: 30px;"/><span id="cap" ><b>교보문고배송</b></span>
<table id="shoptable" style="background-color: white;">
	<tr>
		<td id="shoptlisttitle">선택</td>
		<td colspan="2" style="height: 50px;" id="shoptlisttitle">상품정보</td>
		<td id="shoptlisttitle">가격</td>
		<td id="shoptlisttitle">수량</td>
		<td id="shoptlisttitle">합계</td>
		<td id="shoptlisttitle">배송일정</td>
	</tr>


	<%-- 

 <시도1>
		
		<c:forEach items="${shoplist}" var="shoplist">
			<c:forEach items="${getcount }" var="getcount">
				<tr>
				<td><input type="checkbox" size="3" /></td>
				<td>${shoplist.bsjselectbook_isbn}</td>
				<td><img src="${shoplist.bsjselectbook_url}" alt="" /></td>
				<td>수량:<input type="number" placeholder="${getcount.totalcount }" size="4"
					id="number" /> <input type="button" value="변경" onclick="calcul" /></td>
				<td>${shoplist.bsjselectbook_title}</td>
				<td>${shoplist.bsjselectbook_price}</td>
				<td>합계=${getcount.totalcount }*${shoplist.bsjselectbook_price}</td>
				<td>${shoplist.bsjselectbook_status}</td>
			</tr>		
			</c:forEach>
		</c:forEach>

 --%>

	<%-- 
		<!-- <시도2> -->

		<c:forEach items="${shoplist }" var="s">

			<tr>
				<td><input type="checkbox" size="3" /></td>
				<td>${s.bsjselectbook_isbn}</td>
				<td><img src="${s.bsjselectbook_url}" alt="" /></td>


				<td><c:forEach items="${getcount }" var="c">

						<c:if test="${s.bsjselectbook_isbn eq c.totalisbn}">
				
				수량:<input type="number" placeholder="${c.totalcount }" size="4"
								id="number" />
							<input type="button" value="변경" onclick="calcul" />
						</c:if>
					</c:forEach>
					</td>



				<td>${s.bsjselectbook_title}</td>
				<td>${s.bsjselectbook_price}</td>
				<td>합계=*${s.bsjselectbook_price}</td>
				<td>${s.bsjselectbook_status}</td>
			</tr>
		</c:forEach>

 --%>

	<form name="exf1" action="payment2">

		<c:forEach items="${shoplist}" var="shoplist">

			<tr>
				<td><input type="checkbox" size="3" name="chkList" style="height: 30px; width: 30px;"
					value="${shoplist.bsjselectbook_price * shoplist.bsjselectbook_count }"
					onchange="chekin();" /></td>
				<td><img src="${shoplist.bsjselectbook_url}" alt="" /></td>
				<td id="shoptitle">${shoplist.bsjselectbook_title}</td>
				<td>${shoplist.bsjselectbook_price}</td>
				<td>수량:<input type="number" name="qun"
					value="${shoplist.bsjselectbook_count}"
					placeholder="${shoplist.bsjselectbook_count}" size="4" id="count" />
					<input type="button" value="변경" onclick=""></td>
				<td>합계:${shoplist.bsjselectbook_price * shoplist.bsjselectbook_count }</td>
				<%-- <input type="text" name="total"  value="${shoplist.bsjselectbook_price}" placeholder="${shoplist.bsjselectbook_price}" id="price"/></td> --%>
				<td>${shoplist.bsjselectbook_status}</td>
				<input type="hidden" name="selectisbn"
					value="${shoplist.bsjselectbook_isbn }" />
			</tr>

			<%-- <%=total%> = ${shoplist.bsjselectbook_price * shoplist.bsjselectbook_count } --%>

		</c:forEach>
</table>
<br />
<br />
<input type="checkbox" style="height: 30px; width: 30px;"/>
전체선택
<input type="submit" value="삭제" class="btn_blue" />


<div id="total">
	<table id="totaltable" style="margin-bottom: 20px;">
		<tr>
			<td rowspan="2" id="coltitle" style="width: 60px; text-align: center;">▽</td>
			<td id="coltitle" style="height: 50px;">상품금액</td>
			<td id="coltitle">배송비</td>
			<td id="coltitle">결제 예정금액</td>
		</tr>

		<tr>
			<td><input type=text onfocus=blur() name=t1 value="" size=30 style="height: 150px; width: 300px; padding: 0px 0px;" ></td>
			<td><input type="text" placeholder="2500" style="height: 150px; width: 200px; padding: 0px 0px;"/></td>
			<td><input type=text onfocus=blur() name=t2 value="" size="30" style="height: 150px; width: 300px; padding: 0px 0px;"></td>
		</tr>
		<tr style="height: 40px;">
			<td colspan="4">배송일정: 서울시 구로구 구로디지털로기준</td>
		</tr>
		<tr style="height: 40px; background-color: #eee;">
			<td colspan="4">도서 : (상품별 출고예정일이 다를시 가장 늦은 상품 기준으로 모두 함께 배송됩니다.)</td>
		</tr>
		</br>
		</br>
	</table>
	<input type="button" value="주문하기" id="payment" class="btn_blue2" style="float: right; margin-bottom: 80px; margin-top: 10px;" onclick="location.href='payment?isbn=${isbn}'" /> 
				<input type="hidden" name="isbnsrc" value="'${isbn }'" />
	
	</form>
</div>


