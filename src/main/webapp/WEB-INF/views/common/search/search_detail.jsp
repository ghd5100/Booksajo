<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="stylesheet" type="text/css"
	href="resources/css/search_detail.css">
<!-- 여기다가 검색테이블 구현하면 되겠다요 -->


<% 
	String isbn13 = request.getParameter("${isbn}");
	System.out.println("isbn13:" + isbn13); //여까진 들어옴
%> 

<script>


	$(document)
			.ready(
					function() {
						var isbn = '${isbn}';
						console.log(isbn);
						DetailData(isbn);
						testData(isbn);
						

						
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
												var date = data.documents[0].datetime;
												console.log(date.toString());
												var datestr = date.toString();
												
												console.log(datestr.split("T")[0]);
												var datestr2=datestr.split("T")[0];
												
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
														+ datestr2
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
												html += '<td id="sale" style="height:50px; color: navy; font-size: large;" >판매가&nbsp;:'+data.documents[0].sale_price+'</td>';
												html += '</tr>';
												html += '</table>';

												console.log(data.documents[0]);

												thumbnail += '<img src='+data.documents[0].thumbnail+'class="img-fluid" alt="..." style="width: 248px; height: 330px;" / >';
												$('#img2').html(thumbnail);
												$('#detail').html(html);
											}).fail(function(error) {

									});

						}
					});
					
					 
						function testData(isbn) {
						
							var word = "";
							console.log("키워드뽑아주는 함수들어왔음" + isbn);
							$.ajax({ 
								type : "POST",
								url : "/booksajo/test/search_keyword/",
								data :JSON.stringify({ 
									isbn : isbn
								}),
								datatype : 'json',
								contentType : 'application/json; charset=utf-8',
								success : function(result) {
									console.log('dd');

 									//word += console.log("들어옴");

										word += '키워드 Pick </br>';
									for ( var ele in result) {
										word += '<h4 id="pf">'+result[ele].item.word+'</h4>' ;
										word += '&nbsp;';
									}

									console.log(word);
									$("#keywordpick").html(word);
								}
							});
						} 

						
						function moveconfirm() {
							console.log("무브컴핌에 들어옴");
							
							 	var count=document.getElementById("count").value;
							 	/* 틀린이유 vlaue안쓰고 val씀 */
							 	console.log(count);

							if (confirm("장바구니에 담았습니다. 장바구니페이지로 이동하시겠습니까?") == true){    //확인

								//document.form.submit(count);
							 	
							 	location.href="shoplist2?isbnscr="+${isbn}+"&count="+count+"";
								
							 	
							}else{   //취소


								//취소해도 담긴담았으니 넘겨줘야함.. 
								//$("#formorder").attr({action})
								
								//document.form().submit();
								
							
								//넘어감.. 페이지는 그대로여야하는데
								document.getElementById('formorder').submit();
								
								//헤더창의 장바구니 쪽에 값을 넘겨야하나.. 자식부모창으로 넘겨주는것도 생각해봄.
								
								
								
							    return;
							} 
						 
						}
			
</script>



<div id="inlineside">

	<div id="img2">
		<!-- <img src="" alt=""  style="width: 100px; height: 170px;"/> -->
		<br />

	</div>

	<div id="storelo">

		<p1>크게보기 | 미리보기</p1>
		<br /> <br /> <input type="button" value="매장재고 .위치" />

	</div>

	<div id="keywordpick">키워드 Pick</div>

</div>


<div id="title2">



	<div id="detail" style="height: 350px;"></div>

	<div id="booksen">
		<form action="shoplist2" id="formorder" method="post">
			주문수량 : <input type="number" max="10" min="1" value="num" id="count" name="count"/><br /> <br />
			<input type="button" value="장바구니" id="shoplist" onclick="moveconfirm()"; /><input type="button" value="바로구매" id="payment" onclick="location.href='payment?isbn=${isbn}'"/>
			<input type="hidden" name="isbnsrc" value="'${isbn }'"/>
			
				<%-- onclick="location.href='shoplist?${isbn}'"  --%> <!-- 자바스크립트는 줄바꿈되면 에러난다..연결해서 써주기 -->
		</form>
	</div>


	<div id="bookinfo">
		<img src="resources/img/doit.jpeg" id="bookimg" style="width: 910px;" />
	</div>

	<div id="infotab" style="width: 920px;">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#">상품정보</a></li>
			<li class="nav-item"><a class="nav-link" href="#">회원리뷰</a></li>
			<li class="nav-item"><a class="nav-link" href="#">교환/반품/품절</a></li>
		</ul>

	</div>
</div>

<!-- 	<script src='/js/search_detail.js'></script> -->