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
<<<<<<< HEAD

=======
						testData(isbn);
						

						
>>>>>>> 임현주_brh
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

												thumbnail +='<img src='+data.documents[0].thumbnail+'class="img-fluid" alt="..." style="width: 248px; height: 330px;" / >';
												$('#img2').html(thumbnail);
												$('#detail').html(html);
											}).fail(function(error) {

									});

						}
					});
<<<<<<< HEAD
=======
					
					 
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
			
>>>>>>> 임현주_brh
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



	<div id="detail" style="height: 350px;"></div>

	<div id="booksen">
		<form action="shoplist2" id="formorder" method="post">
			주문수량 : <input type="number" max="10" min="1" value="num" id="count" name="count"/><br /> <br />
			<input type="button" value="장바구니" id="shoplist" onclick="moveconfirm()"; /><input type="button" value="바로구매" id="payment" onclick="location.href='payment?isbn=${isbn}'"/>
			<input type="hidden" name="isbnsrc" value="'${isbn }'"/>
			
				<%-- onclick="location.href='shoplist?${isbn}'"  --%> <!-- 자바스크립트는 줄바꿈되면 에러난다..연결해서 써주기 -->
		</form>
	</div>




<!-------------------------------------------------------------------------------------------------------------------------------------------------------->




<!-- 이선아 리뷰테이블 -->

	<div id="bookReview">
		<a name="bookinfoTag" style="position: absolute; top: 500px"></a> 
		<img src="resources/img/doit.jpeg" id="bookimg" role="tab" style="width: 910px;" />
	</div>
	
	
	
<!-- 	<span class="star"> ★★★★★ <span>★★★★★</span> <input type="range"
		oninput="drawStar(this)" value="1" step="1" min="0" max="5">
	</span>
<script>
const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }
</script>
<style>
	  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
</style> -->


	<div class="tab_detail_content" id="infotab"
		style="width: 920px; margin-top: 0px;">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#bookinfoTag">상품정보</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#bookReviewTag">회원리뷰</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#boxDetailTag">교환/반품/품절</a></li>
		</ul>

		<table class="bookReviewTable">
			<colgroup>
				<col width="86px">
				<col width="*">
				<col width="126px">
			</colgroup>

<!-- 	<table> -->
		<div class="comment_wrap">
			<dl>
				<dt class="id">kd**91017</dt>
				<dd class="date">2022-02-22</dd>
				<dd class="kloverRating">
					<div class="mask klover3">총 4 중</div>
					<span>3</span>
				</dd>				
				<dd class="btns">
					<span> <img
						src="http://image.kyobobook.co.kr/ink/images/common/ico_bought2.gif"
						alt="구매"> <!-- 16-08-08 아이콘 변경 --> <img
						src="http://image.kyobobook.co.kr/ink/images/common/ico_commt_02.gif"
						alt="잘읽혀요">

					</span>
			</dl>
					<!-- //16-07-28 아이콘 추가 -->
				</dd>
				<dd class="comment">
					<div class="txt">알기 쉽게 잘 쓰여진 책입니다.</div>
				</dd>

			<div class="cmt_rt">
				<ul class="list_share">
					<li id="btnSubReview0" class="cmt_del reply_retract"><a
						href="javascript:toggleSubReview('0');">댓글취소</a></li>

					<li class="cmt_like"><a
						href="javascript:likeReview('6193100');">좋아요</a><span
						class="empathy6193100">0</span></li>
				</ul>
			</div>
		</div>
	</table>

		<table>
			<div class="reply_wrap" id="subReviewWrap0" style="display: block;">
				<div class="re_write_wrap book_review">
					<textarea name="" cols="" rows=""
						onkeyup="javascript:fc_chk_byte(this,1000,'id_TextBytes0');"></textarea>
					<button type="button" class="btn_submit"
						onclick=" javascript:regSubReview('klover', '0', '6193100'); ">
						<span>등록</span>
					</button>
					<span class="notice_reply" id="id_TextBytes0">내용을 입력해주세요.
						주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다. 0/1000자</span>
				</div>
			</div>
		</table>


		<!-- 이선아 교환/반품/품절 테이블 -->

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#bookinfoTag">상품정보</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#bookReviewTag">회원리뷰</a></li>
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#boxDetailTag">교환/반품/품절</a></li>
		</ul>

		<div class="box_detail_content">
			<a name="boxDetailTag" style="position: relative; top: -290px"></a>
			<h2 class="title_detail_basic">교환/반품/품절안내</h2>
			<p class="margin_top20">※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을
				우선으로합니다. (업체 사정에 따라 달라질 수 있습니다.)</p>
			<table class="table_simple2 table_detail_guide margin_top10">
				<%-- 		<caption class="caption_hidden">교환/반품/품절안내</caption> --%>
				<colgroup>
					<col width="22%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">반품/교환방법</th>
						<td><strong>마이룸 &gt; 주문관리 &gt; 주문/배송내역 &gt; 주문조회
								&gt; <a href="#">반품/교환신청</a> , <br> <a href="#">[1:1상담&gt;반품/교환/환불]</a>
								또는 고객센터 (1544-1900)
						</strong><br> ※ 오픈마켓, 해외배송주문, 기프트 주문시 <a href="#">[1:1상담&gt;반품/교환/환불]</a><br>
							&nbsp; &nbsp; 또는 고객센터 (1544-1900)</td>
					</tr>
					<tr>
						<th scope="row">반품/교환가능 기간</th>
						<td>변심반품의 경우 수령 후 7일 이내,<br> 상품의 결함 및 계약내용과 다를 경우 문제점 발견
							후 30일 이내
						</td>
					</tr>
					<tr>
						<th scope="row">반품/교환비용</th>
						<td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td>
					</tr>
					<tr>
						<th scope="row">반품/교환 불가 사유</th>
						<td>
							<ul class="list_normal">
								<li>소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br> (단지 확인을 위한
									포장 훼손은 제외)
								</li>
								<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br> 예)
									화장품, 식품, 가전제품(악세서리 포함) 등
								</li>
								<li>복제가 가능한 상품 등의 포장을 훼손한 경우<br> 예) 음반/DVD/비디오, 소프트웨어,
									만화책, 잡지, 영상 화보집
								</li>
								<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)</li>
								<li>디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우</li>
								<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
								<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>
									해당되는 경우
								</li>
							</ul> (1) 해외주문도서 : 이용자의 요청에 의한 개인주문상품으로 단순변심 및 착오로 인한 취소/교환/반품 시 ‘해외주문
							반품/취소 수수료’ 고객 부담 (해외주문 반품/취소 수수료 : ①서양도서-판매정가의 12%, ②일본도서-판매정가의
							7%를 적용)

						</td>
					</tr>
					<tr>
						<th scope="row">상품 품절</th>
						<td>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>
							이메일과 문자로 안내드리겠습니다.
						</td>
					</tr>
					<tr>
						<th scope="row">소비자 피해보상<br> 환불지연에 따른 배상
						</th>
						<td>
							<ul class="list_normal">
								<li>상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은<br>
									소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨
								</li>
								<li>대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의<br>
									소비자 보호에 관한 법률에 따라 처리함
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>

</div>











<!-- 	<script src='/js/search_detail.js'></script> -->