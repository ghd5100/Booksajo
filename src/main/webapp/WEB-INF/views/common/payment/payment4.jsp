<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" type="text/css" href="resources/css/payment.css">


<script>

$(function(){
	$('#btn-kakaopay').click(function(){
		
		$.ajax({
			url:'kakaopay2',
			dataType:'json',
			success:function(resp){
				 // alert(resp.tid); //결제 고유 번호
				var box = resp.next_redirect_pc_url;
				//window.open(box); // 새창 열기
				location.href = box;
				//location.href = box+"?tid="+resp.tid;
			},
			error:function(error){
				alert(error);
			}
		});
	});
});

</script>

<img src="" style="width: 70px;" alt="" />

<div id="conte">

	<div id="custominfo">
		<table style="width: 100%; margin-bottom: 70px; text-align: left;">
			<tr>
				<td height="50px">주문자 ${payinfo.user_id }</td>
				<td width="50px">이름 ${payinfo.user_name }</td>
				<td width="80px">전화번호 ${payinfo.user_phone }</td>
				<td width="600px">이메일주소  ${payinfo.user_email}</td>
			</tr>
		</table>
	</div>


	<div id="addrinfo" style="width: 100%;">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link" href="#">국내배송</a></li>
			<li class="nav-item"><a class="nav-link" href="#">해외배송</a></li>
		</ul>

	</div>

	<br /> <br /> 이름: <input type="text" /><br /> <br /> 휴대폰: <select
		name="" id="sel"><br />
		<br />
		<option value="1">010</option>
		<option value="2">02</option>
		<option value="3">032</option>
	</select><input type="text" /><input type="text" /><br /> <br /> 전화번호: <select
		name="" id="homesel">
		<option value="1">010</option>
		<option value="2">02</option>
		<option value="3">032</option>
	</select><input type="text" /><input type="text" /><br /> <br /> 주소: <input
		type="text" /><input type="button" name="post" value="우편번호" /><br />
	<br /> <input type="text" width="300px" /><br /> <br /> <input
		type="text" width="300px" /><br /> <br /> <br /> <br />



	<div id="selectprod">
		<table style="width: 100%; height: 100px;">
			<tr>
				<td>상품정보</td>
				<td>판매가</td>
				<td>배송/판매자</td>
			</tr>
			<tr>
				<td>1</td>
				<td>2</td>
				<td>3</td>
			</tr>
		</table>
	</div>

	<div id="poin">
		<table style="width: 100%; height: 200px;">
			<tr>
				<td>할인쿠폰</td>
				<td>사용가능한 쿠폰이 없습니다</td>
			</tr>
			<tr>
				<td>통합포인트</td>
				<td><input type="number" /><input type="button" value="모두사용" />통합포인트</td>
			</tr>
		</table>
	</div>

	<div id="creditinfo" style="display: block;" >
	<br />
	<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>

	</div>


</div>

<div id="div2">

	<div id="totalpayment">

		<table style="width: 250px; height: 300px;">
			<tr>
				<td>상품금액</td>
				<td>얼마</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td>얼마</td>
			</tr>
			<tr>
				<td>할인금액</td>
				<td>할인금액</td>
			</tr>
			<tr>
				<td>최종 결제금액</td>
				<td>cnt</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" />주문내역동의(필수)</td>
			</tr>
		</table>

		<input type="button" id="but" value="결제하기" /> <input type="button"
			value="장바구니가기" />
	</div>

</div>


<!-- 	<script src='/js/search_detail.js'></script> -->