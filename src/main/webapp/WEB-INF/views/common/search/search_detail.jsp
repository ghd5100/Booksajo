<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" type="text/css"
	href="resources/css/search_detail.css">
<!-- 여기다가 검색테이블 구현하면 되겠다요 -->


<%-- <%
	String isbn13 = request.getParameter("${isbn}");
	System.out.println("isbn13:" + isbn13); //여까진 들어옴
%> --%>

<script>
	$(document)
			.ready(
					function() {
						var isbn = '${isbn}';
						console.log(isbn);
						DetailData(isbn);

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

												//사이드에 보내줄거
												html += '<table>';
												html += '<tr>';
												html += '<td colspan="2" style="width: 60%; height:70px;" id="z">'
														+ data.documents[0].title
														+ '</td>';
												html += '</tr>';
												html += '<tr>';
												html += '<td colspan="3" id="x" style="height:50px;">'
														+ contentcut[0];
												+'</td>';
												html += '</tr>';
												html += '<tr>';
												html += '<td colspan="3" id="au" style="width: 10px; height:40px;">'
														+ data.documents[0].authors
														+ '&nbsp;&nbsp;지음&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
														+ data.documents[0].publisher
														+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
														+ data.documents[0].datetime
														+ '</td>';
												html += '</tr>';
												html += '<tr>';
												html += '<td colspan="3" id="n"><p>리뷰/평점</p></td>';
												html += '</tr>';
												html += '<tr>';
												html += '<td colspan="2" id="m" style="width: 30px; height:70px;">정가&nbsp;:'
														+ data.documents[0].price
														+ '</td>';
												html += '</tr>';
												html += '<tr>';
												html += '<td id="sale" style="height:50px;">판매가&nbsp;:</td>';
												html += '</tr>';
												html += '</table>';

												console.log(data.documents[0]);

												thumbnail +='<img src='+data.documents[0].thumbnail+'class="img-fluid" alt="..." style="width: 248px; height: 330px;" / >';
												$('#img2').html(thumbnail);
												$('#detail').html(html);
											}).fail(function(error) {

									});

						}
					});
</script>


<div id="inlineside">

<div id="img2">
<!-- <img src="" alt=""  style="width: 100px; height: 170px;"/> -->
<br />

 </div>
 
 <div id="storelo">
 
<p1>크게보기 | 미리보기</p1>
<br />
<br />

<input type="button" value="매장재고 .위치"/>
 
 </div>
 
<div id="keywordpick">
키워드 Pick
</div>

</div>


<div id="title2">



	<div id="detail" style="height: 350px;">
	
	</div>

	<div id="booksen">
		<form action="#" method="get" >
		주문수량 : <input type="number" max="10" min="1" value="num" /><br /><br />
		<input type="button" value="장바구니"/>
		<input type="button" value="바로구매"/>
		</form>
	</div>

	
	<div id="bookinfo">
		<a name="bookinfoTag">
		<img src="resources/img/doit.jpeg" id="bookimg" style="width: 910px;" />
		</a>

	</div>

	<div id="infotab" style="width: 920px;">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#bookinfoTag">상품정보</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">회원리뷰</a></li>
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">교환/반품/품절</a></li>
		</ul>

	</div>
</div>

<!-- 	<script src='/js/search_detail.js'></script> -->