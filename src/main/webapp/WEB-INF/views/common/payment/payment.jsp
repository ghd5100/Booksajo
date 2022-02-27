<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" type="text/css" href="resources/css/payment.css">

<!-- 여기역시도 isbn 가져오니까 그걸로 책정보 뿌려주면되겠구나 -->

<%
String isbn=request.getParameter("isbn"); 
 
/* String tid=request.getParameter("tid");
System.out.println("jsp에서 받은 tid:"+tid); */
%>

<script>



$(document)
			.ready(
					function() {
						var isbn = <%=isbn%>;
						console.log(isbn);
						DetailData(isbn);
						/* var tid = '${tid}'; */
						
						function DetailData(isbn) {
							$
									.ajax(
											{
												type : 'POST',
												url : 'https://dapi.kakao.com/v3/search/book?target=isbn&query='
														+ isbn,
												headers : {
													Authorization : 'KakaoAK 2ecf5febe1e05d5d376370e2b4d6c779'
												},
												dataType : 'json',
												contentType : 'application/json; charset=utf-8',
											})
									.done(
											function(data) { //들어올때도 어쨋든 제이슨타입으로 1개 들어오는거니까 인덱스 써줘야함 틀린이유.
									
												var html = '';
												var thumbnail = '';
												var contents = data.documents[0].contents;
												var contentcut = contents
														.split('.');
												var price = data.documents[0].price;
												var count = 3;
												var product_name =data.documents[0].title;
											/* 
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
												
											*/
												
												//사이드에 보내줄거
												html += '<table style="width: 100%; height: 100px;">';
												html += '<tr style="height: 40px;">';
												html += '<td>상품정보</td>';
												html += '<td>판매가</td>'
												html += '<td>배송/판매자</td>'
												html += '<td>수량</td>'
												html += '</tr>';
												html += '<tr>';
												html += '<td><img src='+data.documents[0].thumbnail+' style="height: 110px;"/></td>';
												html += '<td>'+data.documents[0].price+'</td>'
												html += '<td>교보문고/판매자</td>'
												html += '<td>파라미터받아오기</td>'
												html += '</tr>';
												html += '</table>';

												console.log(data.documents[0]);
												
												
												//thumbnail += '<img src='+data.documents[0].thumbnail+'class="img-fluid" alt="..." style="width: 248px; height: 330px;" / >';
												
												//$('#img2').html(thumbnail);
												$('#selectprod').html(html);

												//컨트롤러로 책 타이틀. 수량. 가격 보내주는 펑션 만들기
												$.ajax({
														type:'POST',
												 		data: JSON.stringify(
																{
																 price:price, 
																 count: count, 
																 product_name: product_name	
																}
														), 
														url:"/booksajo/productInfo",
													    contentType: 'application/json; charset=utf-8',
														dataType: "JSON",
														success : function(data) {
															console.log(data);
															//뽑은데이터를 수량각각 키로 뽑아서 보내준다.
														},
														error: function(e) {
															console.log('error' + e);
														}
													});

												
											}).fail(function(error) {

									});

						}
					});

	
//카카오페이 요청 결제
function kakaopay(){
	
	$.ajax({
		url:"kakaopay",
		dataType:"json"
	}).done(function(resp){
		if(resp.status === 500){
			alert("카카오페이결제를 실패하였습니다.")
		} else{
			//alert(resp.tid); //결제 고유 번호
			//var tid=resp.tid;
			var box = resp.next_redirect_pc_url;
			//window.open(box); // 새창 열기
 			//location.href = box;
			console.log('${tid}');
			//location.href = box+"?tid="+'${tid}';
			location.href = box+"?tid="+resp.tid;
			
		}
	}).fail(function(error){
		alert(JSON.stringify(error));
	}); 

};
	

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

	<button id="btn-kakaopay" class="btn btn-primary" onclick="kakaopay();">카카오페이</button>
	

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