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
	console.log(keyword);
	searchData(keyword);  //searchData의 함수의 매개변수로 keyword를 넣어줌
	
	/*  $(document).on("click", "[name='searchDetail']", function () {
		  
		 console.log(this.value);
		 console.log(JSON.parse(data));
		 
 	 });
	

 $(document).on("click", "#hj", function () {
	 
	 var dataval=document.getElementById("#hj").value;
	console.log(dataval);
	 console.log(JSON.parse(dataval));
		 
	 }); */
	
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
		    	
				
		    	for(k in data.documents){
			    		html += '<tr height="180px">';
			    		//html += '<td><input type="image" value="' + JSON.stringify(data.documents[k]) + '" name="searchDetail" src=' + data.documents[k].thumbnail + 'onclick="" id="hj" /></td>';
			    		//html += '<td> <img src=' + data.documents[k].thumbnail +' name="searchDetail"  value="' + JSON.stringify(data.documents[k]) + '"/></td>';
 			    		//html += "<input type='hidden' name='inputDetail' value='" + JSON.stringify(data.documents[k]) + "' ]>";
			    		html += '<td> <img src=' + data.documents[k].thumbnail +'/></td>';
 			    		html += '<td>';
			    		html += '<p><a href="search_detail">' + data.documents[k].title + '</a></p>';
			    		html += '<p>' + data.documents[k].authors + '</p>';
			    		html += '<p>' + data.documents[k].publisher + '</p>';
			    		html += '<p>' + data.documents[k].title + '</p>';
			    		html += '</td>';
			    		html += '<td>평점</td>';
			    		html += '<td>'+ data.documents[k].price + '</td>';
			    		html += '<td><form action="shoplistpage">' + '수량 : ' + '<input type="number" max="9" min="1" maxlength="7px" /></br></br>'
			    		+'<input type="button" value="장바구니담기" name="shoplist" /></form></td>';
			    		html += '</tr>';
		    		
		    	console.log(data.documents);
		    } 
		    	
		    	//.html을 동적구조를 동적 html을 만들수있게해줌. 
		    	//변수는 아무거나 선언해서 저렇게 
		    	//동적과 적적의차이... 포문 돌려서 만들어주는것 동적이라고 볼수있다.
	    	$('#getList').html(html);      
	    }).fail(function (error) {
	    });
		
	}
	

	
});





//총 검색 건수 가져오기.meta 에서 얻을수있었음.
/* 가져와서 코드블럭으로 넣어주기.  */

function cnt() {
	
}


</script> 



<div id="d1">
	<!-- 총검색결과  -->
	${search } 검색결과 총 1789건
	<hr />
</div>

<div id="d2">
	<!-- 연관검색어 -->
	<b>연관검색어</b> <span>웹퍼블리셔 css html 자바스크립트</span>

</div>


<div id="d3" style="border: 1px solid; width: 95%;"  >
	<!-- 카테고리 검색 고정되있어야함 부트스트랩 쓰긔 -->

		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button onclick="divheight();" style="float: left; width:150px;">카테고리</button>

		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->

소분류/ 대분류

</div>

<div id="d6" style="border: 1px solid; width: 95%; height: 30px;" >

		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button onclick="divheight2();" style="float: left; width:150px;">조건</button>
		
		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->

| 인기순 | 판매량 | 신상품  | 상품명  | 할인율  | 낮은가격  | 높은 리뷰  |

</div>



<div id="d4">

<a href=""></a>
	<!-- 도서결과 뿌려줄곳 -->
	<table class="table">
		<thead>
			<tr>
				<th scope="col" width="20%">국내도서/책이미지</th>
				<th scope="col" rowspan="4" width="35%">제목 저자 출판사 키워드</th>
				<th scope="col" width="15%">평점</th>
				<th scope="col" width="15%">가격</th>
				<th scope="col" width="15%">수량 및 장바구니</th>
				
			</tr>
		</thead>
		<tbody id="getList">
- 			<tr height="150px">
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

</div>

<div id="d5">
<!-- 페이지 넘김 구현부분 -->

</div>


<script src="resources/js/search_table.js"></script>

