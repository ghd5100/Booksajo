<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="resources/css/search_table.css">


 

<script>



$( document ).ready(function() {
	var keyword = '${search}';
	searchData(keyword);  //searchData의 함수의 매개변수로 keyword를 넣어줌

	function categoryget() {
		//특정카테고리 클릭시 자바내부에서 카테고리 가지고가서 isbn검색으로 바꿔여서 여기 카카오 API에 넣어서 뿌리기. 
		
	}
	
/* 	$('#payment').on('click', function(){
		window.location.href = 'payment.jsp'
	 });
 */
 
	$(document.body).delegate('#payment', 'click', function(e) {
		
		 //console.log("ddddd"); 
		 //val는 안돼넹.. id는 받아오는뎅
		 

		// var id_by_name = document.getElementsByName('isbn');
		 window.location.href = 'payment?isbn='+this.name; //클릭한 것의 네임을 가져와라...this=클릭한것 
		
		 //보내주기 다음페이지로 */
		 
		});
	

 
	//검색 함수
	function searchData(keyword){
		$.ajax({
	        type: 'POST',
	        url : 'https://dapi.kakao.com/v3/search/book?target=title&query=' + keyword + '&size=50',
	           headers: {
	     		 Authorization : 'KakaoAK 2ecf5febe1e05d5d376370e2b4d6c779'
	            },
	        dataType: 'json',
	        contentType: 'application/json; charset=utf-8',
	    }).done(function (data) {

	    	var html ='';
		    	console.log(data.documents);
		    	for(k in data.documents){
		    		var isbn = data.documents[k].isbn; 
		    		var cnt='';
					var date = data.documents[0].datetime;
					console.log(date.toString());
					var datestr = date.toString();
					
					console.log(datestr.split("T")[0]);
					var datestr2=datestr.split("T")[0];
					
			    		html +='<form action="shoplist" method="post">';
		    			html +='<table>';
		    			html += '<tr height="180px">';
			    		//html += '<td><input type="image" value="' + JSON.stringify(data.documents[k]) + '" name="searchDetail" src=' + data.documents[k].thumbnail + 'onclick="" id="hj" /></td>';
			    		//html += '<td> <img src=' + data.documents[k].thumbnail +' name="searchDetail"  value="' + JSON.stringify(data.documents[k]) + '"/></td>';
 			    		//html += "<input type='hidden' name='inputDetail' value='" + JSON.stringify(data.documents[k]) + "' ]>";
			    		html += '<td><a href="search_detail?isbn='+isbn.substr(11,23)+'"><img src=' + data.documents[k].thumbnail +'/></a></td>';
 			    		html += '<td>';
			    		html += '</br><b><a href="search_detail?isbn='+isbn.substr(11,23)+'" style="color: #3A60DF;">' + data.documents[k].title + '</a></b></br></br>';
			    		html += '<p>' + data.documents[k].authors + '&nbsp;&nbsp;지음&nbsp;&nbsp;|&nbsp;&nbsp;' + data.documents[k].publisher + '&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;'+ datestr2 +'&nbsp;&nbsp;</p>';
			    		html += '</td>';
			    		html += '<td><img src="resources/img/review/review'+[k]+'.png" style="width: 110px;" height="125px;"/></td>';
			    		html += '<td><p id="price"></br></br>'+ data.documents[k].price + '원</br></p><p id="sale"><b>'+ data.documents[k].sale_price +'원[10%↓]</b></p>'+data.documents[k].status+'</td>';
			    		html += '<td></br><input type="submit" value="장바구니 담기" id="shopget" class="btn_blue" /></br></br><input type="button" value="바로구매" id="payment" name="'+isbn+'" class="btn_blue2" /></td>';
			    		html += '<td><input type="hidden" value="'+isbn+'" name="isbn" id="'+isbn+'" /></td>';
			    	//	html += '<td>' + '수량 : ' + '<input type="number" max="9" min="1" maxlength="7px" /></br></br><input type="submit" value="장바구니담기" name="'+data.documents[k].isbn+'" /><input type="hidden" name="'+isbn+'" value="'+isbn+'" /></br></br><input type="submit" value="바로구매" name="payment"  /></td>';
			    		html += '</tr>';
			    		html +='</table>';
			    		html +='</form>';
		    			cnt += data.meta.total_count +'건';
		    	/* console.log(data.meta.total_count); */
		    } 
		    	
		    	//.html을 동적구조를 동적 html을 만들수있게해줌. 
		    	//변수는 아무거나 선언해서 저렇게 
		    	//동적과 정적의차이... 포문 돌려서 만들어주는것 동적이라고 볼수있다.
		    $('#cnt').html(cnt);
	    	$('#getList').html(html);

	    	/*  	$('<input type="button" value="바로구매">').appendTo('body').submit(); */
	    }).fail(function (error) {
	    });
		
	}

	
});


//총 검색 건수 가져오기.meta 에서 얻을수있었음.
/* 가져와서 코드블럭으로 넣어주기.  */
</script> 

<img src="" style="width: 10px;" height="20px;" alt="" />

<td style="">
<b style="color: #3A60DF;"><a href="#" style=""></a></b>
</b>
</td>
<div id="d1">
	<!-- 총검색결과  -->
	${search } 검색결과 총 <h3 id="cnt" style="display: inline;"></h3>
	<hr />
</div>

<div id="d2">
	<!-- 연관검색어  구현못함-->
	<!-- <b>연관검색어</b> <span>웹퍼블리셔 css html 자바스크립트</span> -->

</div>


<div id="d3" style="border: 1px solid; width: 95%; height: 35px;"  >
	<!-- 카테고리 검색 고정되있어야함 부트스트랩 쓰긔 -->

		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button onclick="divheight();" style="float: left; width:150px; height: 30px">카테고리&nbsp;&nbsp;∨</button>

		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->

소분류/ 대분류

</div>

<div id="d6" style="border: 1px solid; width: 95%; height: 35px;" >

		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button onclick="divheight2();" style="float: left; width:150px; height: 30px">조건&nbsp;&nbsp;∨</button>
		
		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->

| 인기순 | 판매량 | 신상품  | 상품명  | 할인율  | 낮은가격  | 높은 리뷰  |

</div>



<div id="d4">


	<!-- 도서결과 뿌려줄곳 -->
	
	<form action="shoplist" method="post">
	<table class="table">
		<thead>
			<tr style="height: 50px; padding-bottom: 5px;">
				<th scope="col" width="20%" id="tabletitle">국내도서ㆍ책이미지</th>
				<th scope="col" rowspan="4" width="35%" id="tabletitle">제목ㆍ저자ㆍ 출판사ㆍ키워드</th>
				<th scope="col" width="15%" id="tabletitle">평점</th>
				<th scope="col" width="15%" id="tabletitle">가격</th>
				<th scope="col" width="15%" id="tabletitle">수량 ㆍ 장바구니</th>
				
			</tr>
		</thead>
		<tbody id="getList">
 			<tr height="150px">
				<td>
			<!-- <input type="image" value="" name=""  id="" onclick="" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1606323%3Ftimestamp%3D20220204175403id=%22hj%22"/> -->
				</td>
				<td rowspan="4">
					<p>제목</p>
					<p>저자</p>
					<p>출판사</p>
					<p>키워드</p>
				</td>
				<td>평점</td>
				<td>가격</td>
				<td>수량 및 장바구니</td>
			</tr> 
		</tbody>

	</table>
	</form>

</div>

<div id="d5">
<!-- 페이지 넘김 구현부분 -->

<!-- 오른쪽 사이드 quick메뉴탭 -->
			<div id="quick_menu2" class="quickSticky" style="width: 60px;">
				<div id="reviewWrite"></div>
				<div class="btn_quick_top" onclick="asdf()">
					<a href="#">Top</a>			<!-- 페이지 가장 상단으로 보내주는것은 #Top하면 그냥 자동으로 됨 -->
				</div>
				<div class="btn_quick_down">
					<a href="#Down">Down</a>	<!-- footer.jsp에 태그위치 설정해두었음 -->
				</div>
			</div>

</div>



<script src="resources/js/search_table.js"></script>

