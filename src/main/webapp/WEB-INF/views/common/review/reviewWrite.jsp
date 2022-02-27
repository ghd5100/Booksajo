<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<!-- s:html:head -->
<head>





<!--MS의 최신 웹브라우저인 edge 브라우저 호환을 위해 넣어줌-->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Pragma" content="nocache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">

<link rel="shortcut icon"
	href="http://image.kyobobook.co.kr/newimages/apps/b2c/kyobo.ICO">


<link rel="stylesheet" type="text/css" href="http://image.kyobobook.co.kr/ink/css/default_ink.css">

<!-- s:공통 스크립트 -->
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://connect.facebook.net/signals/config/335210141792704?v=2.9.52&amp;r=stable"
	async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script gtm="GTM-WPXF8VR" type="text/javascript" async=""
	src="https://www.google-analytics.com/gtm/optimize.js?id=OPT-5NJ356H"></script>
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script async=""
	src="https://www.googletagmanager.com/gtm.js?id=GTM-WPXF8VR"></script>
<script type="text/javascript"
	src="http://image.kyobobook.co.kr/ink/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">jQuery.noConflict();</script>
<script type="text/javascript" src="/js/prototype.js"></script>
<!-- - Ajax 관련 -->

<script type="text/javascript" src="/js/KyoboBook.js?ymdh=20160727"></script>
<script type="text/javascript" src="/js/Navigation.js?ymd=20210719"></script>
<script type="text/javascript" src="/js/ui.js"></script>
<script type="text/javascript" src="/search/js/search_top.js"></script>
<script type="text/javascript" src="/js/makePCookie.js"></script>
<script type="text/javascript" src="/common/kisFlash.js"></script>
</head>
</body>
<script type="text/javascript"></script>
<!-- e:html:head -->

<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WPXF8VR"
		height="0" width="0" style="display: none; visibility: hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
	
<title>북사조</title>

<title>Clover 평점/리뷰 등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="Pragma" content="nocache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">

<link rel="stylesheet" type="text/css"
	href="http://image.kyobobook.co.kr/ink/css/default_ink.css">
<script type="text/javascript"
	src="http://image.kyobobook.co.kr/ink/js/jquery-1.4.4.min.js"></script>



<form id="reviewFrm" name="reviewFrm" method="post" enctype=""
	encoding="" action="">
	<input type="hidden" name="barcode" value="9791188331796"> <input
		type="hidden" name="ejkGb" value="KOR"> <input type="hidden"
		name="bookNm" value="돈의 속성(200쇄 기념 개정증보판)(양장본 HardCover)"> <input
		type="hidden" name="regType" value=""> <input type="hidden"
		name="sortType" value=""> <input type="hidden"
		name="orderType" value=""> <input type="hidden"
		name="submitYsno" value="N"> <input type="hidden" name="gb"
		value="klover"> <input type="hidden" name="eventId" value="0">
	<input type="hidden" name="siteGb" value="INK">
	<!-- 이벤트 관련 정보 세팅 -->



	<input type="hidden" name="maxLength" value="1000">




	<!-- popup_type -->
	<div id="popup_klover" style="width: 450px;">
		<!-- popup_wrap -->
		<div class="popup_wrap">
			<!-- title -->
			<div class="tit02">
				<h1 class="title_h_cartlist">Klover 리뷰 등록</h1>
			</div>
			<!-- // title -->
			<!-- popup_container -->
			<div class="popup_container3">

				<div class="klover_wrap">





					<span id="bookNm">
						<h2>
							<strong>돈의 속성(200쇄 기념 개정증보판)(양장본 HardCover)</strong>
						</h2>
					</span>



					<div class="section_klover">
						<h3>
							<strong>평점</strong> - 이 책에 대한 당신의 마음을 남겨주세요.
						</h3>

						<dl class="review_rating">
							<dt>컨텐츠평가</dt>
							<dd>
								<div class="ratingSection2">
									<div class="mask star1">4점 만점에</div>
									<a href="#" class="mark mark0">0점</a> <a href="#"
										class="mark mark1">1점</a> <a href="#" class="mark mark2">2점</a>
									<a href="#" class="mark mark3">3점</a> <a href="#"
										class="mark mark4">4점</a> <span class="number number1"></span>
									<input type="hidden" name="rating" id="reviewRating" value="1">
								</div>
								<script type="text/javascript">
                        (function($){
                            $('.review_rating .ratingSection2 a').bind('click mouseover',function(e){
                                e.preventDefault();
                                var idx = $(this).parent().find('a').index(this);
                                $(this).parent().find('.mask').removeClass('star0').removeClass('star1').removeClass('star2').removeClass('star3').removeClass('star4').addClass('star'+idx);
                                
                                $(this).parent().find('span').index(this);
                                $(this).parent().find('.number').removeClass('number0').removeClass('number1').removeClass('number2').removeClass('number3').removeClass('number4').addClass('number'+idx);
                                $(this).closest('.ratingSection2').find('#reviewRating').val(idx);
                            });
                        })(jQuery);
                        </script>
							</dd>
						</dl>
					</div>
					<div class="section_klover">
						<h3>
							<strong>태그</strong> - 이 책을 읽으면 기분이 어떤가요?
						</h3>


						<!-- 16-08-08 코멘트 수정 -->
						<ul class="list_impress">
							<li class="impress01"><a href="#">좋아요</a></li>
							<li class="impress02"><a href="#">잘읽혀요</a></li>
							<li class="impress03"><a href="#">정독해요</a></li>
							<li class="impress04"><a href="#">기발해요</a></li>
							<li class="impress05"><a href="#">유용해요</a></li>
							<li class="impress06"><a href="#">기타</a></li>
						</ul>
						<!-- //16-08-08 코멘트 수정 -->
						<input type="hidden" name="feelTag" id="feelTagRating" value="0">
						<script>
                $(document).ready(function() {
                    $('.list_impress a').click(function(){
                    	var idx = $(this).parent().index();
                        $('.list_impress a').removeClass('on');
                        $(this).addClass('on');
                        $('#feelTagRating').val(idx+1);
                    });
                });
                </script>
					</div>

					<div class="section_klover">
						<h3>
							<strong>리뷰</strong> - 이 책을 간단히 말하면? <span class="txt_sub">(구매
								후 리뷰 작성시, e교환권 200원 적립)</span> <span class="popup_load"> <a
								href="javascript:popOpen('layerReviewGuide2');"
								class="btn_small">안내</a> <!-- 리뷰 리워드 안내 레이어 팝업 -->

								<div id="layerReviewGuide2"
									style="display: none; position: absolute; left: -369px; bottom: 30px; z-index: 1;">

									<div class="layer_popup" style="width: 420px;">

										<!-- 레이어 화살표 위치 -->

										<p style="position: absolute; left: 373px; bottom: -4px">
											<img
												src="http://image.kyobobook.co.kr/ink/images/common/icon_arrow_top4.png"
												alt="">
										</p>

										<!-- // 레이어 화살표 위치 -->

										<dl class="new_c">
											<dt class="new_t">
												<strong>Klover 리뷰 안내</strong>
											</dt>
											<dd class="new_d">
												<div class="font_12 font_normal">
													<p>Klover(Kyobo-lover)는 교보를 애용해주시는 고객님들이 남겨주신 평점과 감상을
														바탕으로, 다양한 정보를 전달하는 교보문고의 새로운 리뷰 서비스입니다.</p>
													<strong style="margin: 10px 0; display: block;">1.
														리워드 안내</strong>
													<p>구매 후 90일 이내에 평점과 10자 이상의 리뷰 작성 시 e교환권 200원을 적립해
														드립니다.</p>
													<ul>
														<li>- e교환권은 적립일로부터 180일 동안 사용 가능합니다.</li>
														<li>- 리워드는 작성 후 다음 날 제공되며, 발송 전 작성 시 발송 완료 후 익일
															제공됩니다.</li>
														<li>- 리워드는 한 상품에 최초 1회만 제공됩니다.</li>
													</ul>
												</div>
											</dd>
										</dl>
										<p class="new_btn">
											<a href="javascript:popOpen('layerReviewGuide2');"><img
												src="http://image.kyobobook.co.kr/ink/images/common/btn_close_p.gif"
												alt="닫기"></a>
										</p>

									</div>

								</div> <!-- // 리뷰 리워드 안내 레이어 팝업 -->

							</span>

						</h3>


						<div class="write_review02">



							<textarea name="content"
								onkeyup="javascript:fc_chk_byte(this,document.reviewFrm.maxLength.value,'id_TextBytes');"
								cols="" rows="" onclick=""
								onfocus="if (this.value=='내용을 10자 이상 입력해주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다.'){this.value='';};return false;"
								onblur="if (this.value==''){this.value='내용을 10자 이상 입력해주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다.';return false;}">내용을 10자 이상 입력해주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다.</textarea>


							<span id="id_TextBytes" class="text_size">0/1000자</span>
						</div>


						<div class="upload_file_img02">
							<dl>
								<dt>이미지첨부</dt>
								<dd class="file_name">
									<input name="imageFile" type="file"
										style="background-color: #fff;">
								</dd>
							</dl>
							<span class="help_upload_file">(파일용량은 1MB 이하이며, 파일형식은
								jpg, jpeg 파일만 업로드 가능합니다.)</span>
						</div>
					</div>
				</div>

				<div class="btn_clear">
					<a class="btn_pur_01" href="javascript:window.close();"><strong>취소</strong></a>
					<a class="btn_pur_02" href="javascript:regReview();"><strong>등록</strong></a>
				</div>

				<!--<div class="btn_clear">
            <a href="#"><img src="http://image.kyobobook.co.kr/ink/images/common/btn_close_b.gif" alt="닫기" /></a>
        </div>-->



			</div>
			<!-- // popup_container -->
		</div>
		<!-- // popup_wrap -->
		<!-- btn_layer_close -->
		<a href="javascript:window.close();" class="close_btn3"><img
			src="http://image.kyobobook.co.kr/ink/images/common/btn_layer_close02.gif"
			alt="닫기"></a>
		<!-- // btn_layer_close -->
	</div>
	<!-- // popup_type -->
</form>
<script type="text/javascript">

//팝업 리사이즈
window.resizeTo(478, 795);

//replaceAll prototype 선언
String.prototype.replaceAll = function(org, dest) {
return this.split(org).join(dest);
}


//레이어팝업
function popOpen(obj){
var ele = document.getElementById(obj);
if(ele.style.display =="none"){
	ele.style.display = "block";
}else{
	ele.style.display = "none";
}
}

//태그 클릭
function clickFeelTag(feelTag){
document.reviewFrm.feelTag.value=feelTag;
}

//파일의 확장자를 가져옴
function getFileExtension( filePath ) { 
var lastIndex = -1;
var extension = "";

lastIndex = filePath.lastIndexOf(".");
if (lastIndex != -1) {
    extension = filePath.substring(lastIndex + 1, filePath.length);
}

return extension.toLowerCase();
}

//리뷰등록
function regReview(){
//2019.03.25 클로버평점 이벤트아이디 전용 리뷰 작성
var paramArr = location.search.substr(location.search.indexOf("?") + 1).split("&");
var paramId = null;
var eventId = 0;

for(var i = 0; i < paramArr.length; i++){
	if(paramArr[i].indexOf("=") != -1){
		paramId = paramArr[i].split("=");
		if(paramId[0] == 'eventId'){
			eventId = paramId[1];
		}
	}
}
//2019.03.25 클로버평점 이벤트아이디 전용 리뷰 작성

var forms = document.reviewFrm;



if(jQuery("#reviewFrm input[name='imageFile']").val() != null && !jQuery("input[name='imageFile']").val() == ""){
	var forms = document.reviewFrm;
  	var extension = getFileExtension(forms.imageFile.value);
    if (extension != "jpg" && extension != "jpeg") {
        alert("jpg, jpeg파일만 사용할 수 있습니다.");
        return;
    }
}

if(forms.submitYsno.value == "Y"){
	alert("현재 처리중입니다. 잠시만 기다려주세요.");
    return;
}


//alert(jQuery("input[name='rating']").val());
//alert(jQuery("#reviewFrm textarea[name='content']").val());

if(jQuery("input[name='rating']").val() == "0"){
	alert("평점을 선택해주세요");
	return;
}

if(jQuery("#reviewFrm input[name='feelTag']").val() == "0"){
	alert("기분 태그를  선택해주세요");
	return;
}

if(jQuery("#reviewFrm textarea[name='content']").val()  == "" || jQuery("#reviewFrm textarea[name='content']").val() == "내용을 10자 이상 입력해주세요. 주제와 무관한 댓글, 악플, 배송문의 등의 글은 임의 삭제될 수 있습니다."){
	alert("내용을 10자 이상 입력해주세요.");
	return;
}
else if(jQuery("#reviewFrm textarea[name='content']").val().length < 10){
	alert("내용을 10자 이상 입력해주세요.");
	return;
}
else{
	if(!confirm("리뷰를 등록하시겠습니까?"))
		return;	
}

var barcode = "9791188331796";
var ejkGb = "KOR";
var mallGb = "KOR";

//forms.sortType.value = "";
forms.sortType.value = "date";
forms.orderType.value = "all";
forms.gb.value = "klover";
forms.submitYsno.value = "Y";
forms.regType.value = "kloverReview";
forms.eventId.value = eventId;
forms.enctype = "multipart/form-data";
forms.encoding = "multipart/form-data";
forms.target = "HiddenActionFrame";
forms.action = "/product/productSimpleReviewReg.laf";
	forms.method = "post";
	forms.submit();
}

//리뷰등록
function closeWindow(){
var orderType = "all";
var sortType = "date"
var barcode = "9791188331796";
var ejkGb = "KOR";
var mallGb = "KOR";;




	alert("등록되었습니다");
	opener.sortReview("klover", "all", "date");
	self.close();


}

/*
' ------------------------------------------------------------------
' Function    : fc_chk_byte(aro_name,ari_max,ars_Textid)
' Description : 입력한 글자수를 체크
' aro_name    : Object Name(글자수를 제한할 컨트롤)
' ari_max     : 제한할 글자수
' ars_Textid  : 현재 입력된 글자수를 표시할 id
' Return      : 
' ------------------------------------------------------------------
*/
function fc_chk_byte(aro_name,ari_max,ars_Textid)
{

var ls_str     = aro_name.value; // 이벤트가 일어난 컨트롤의 value 값
var li_str_len = ls_str.length;  // 전체길이

// 변수초기화
var li_max      = ari_max; // 제한할 글자수 크기
var i           = 0;  // for문에 사용
var li_byte     = 0;  // 한글일경우는 2 그밗에는 1을 더함
var li_len      = 0;  // substring하기 위해서 사용
var ls_one_char = ""; // 한글자씩 검사한다
var ls_str2     = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.

for(i=0; i< li_str_len; i++)
{
  // 한글자추출
  ls_one_char = ls_str.charAt(i);


  li_byte++;

  // 전체 크기가 li_max를 넘지않으면
  if(li_byte <= li_max)
  {
     li_len = i + 1;
  }
}


// 전체길이를 초과하면
if(li_byte > li_max)
{
  li_byte = li_max;
  alert( li_max + " 글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
  ls_str2 = ls_str.substr(0, li_len);
  aro_name.value = ls_str2;
}
if(ars_Textid == "id_TextBytes"){
   document.getElementById(ars_Textid).innerHTML = li_byte+"/" + document.reviewFrm.maxLength.value + "자";
}else{
   document.getElementById(ars_Textid).innerHTML = "내용을 입력해주세요. 주제와 무관한 댓글, 악플은 삭제될 수 있습니다. " + li_byte+"/" + document.reviewFrm.maxLength.value + + "자";
}
aro_name.focus();   
}

function lengthCheck(str) {
var len = 0;

if(str == null) return 0;

for(var i = 0; i < str.length; i++) {
	var c = escape(str.charAt(i));

	if( c.length == 1 ) len++;
	else if ( c.indexOf("%u") != -1 ) len += 2;
	else if ( c.indexOf("%") != -1 ) len += c.length/3;
}

return len;
}
</script>


<script type="text/javascript" id="">
	!function(b,e,f,g,a,c,d){ 
		b.fbq||(a=b.fbq=<function>
	</function>	{
		a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)
				},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",
				a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],
				d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","335210141792704");fbq("track","PageView");
				</script>
<noscript>
	<img height="1" width="1" style="display: none"
		src="https://www.facebook.com/tr?id=335210141792704&amp;ev=PageView&amp;noscript=1">
</noscript>
<meta name="facebook-domain-verification"
	content="ezckujv1qppxlglsp8fsry2bs2cw0n">
<script type="text/javascript" id="">fbq("track","ViewContent");</script>


</body>
</html>








