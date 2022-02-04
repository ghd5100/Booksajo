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
		    	var html = '';
		    	for(k in data.documents){
		    		html += '<tr height="180px">';
		    		html += '<td><img src=' + data.documents[k].thumbnail + '/></td>';
		    		html += '<td>';
		    		html += '<p>' + data.documents[k].title + '</p>';
		    		html += '<p>' + data.documents[k].authors + '</p>';
		    		html += '<p>' + data.documents[k].publisher + '</p>';
		    		html += '<p>' + data.documents[k].title + '</p>';
		    		html += '</td>';
		    		html += '<td>평점</td>';
		    		html += '<td>'+ data.documents[k].price + '</td>';
		    		html += '<td>수량/장바구니</td>';
		    		html += '</tr>';
		    		
		    }
	    	$('#getList').html(html);      
	    }).fail(function (error) {
	    });
		
	}
	
});





</script> 



<div id="body-wrapper">

<div id="body-content">

<div id="d1">
	<!-- 총검색결과  -->
	${search } 검색결과 총 1789건
	<hr />
</div>

<div id="d2">
	<!-- 연관검색어 -->
	<b>연관검색어</b> 웹퍼블리셔 css html 자바스크립트

</div>


<div id="d3" style="height:30px">
	<!-- 카테고리 검색 고정되있어야함 부트스트랩 쓰긔 -->

	<div class="container-fluid">
		<div>
			<!-- Javascript가 필요없이 data-toggle에 collapse href에 대상 id을 설정합니다. -->
			<button data-toggle="collapse" href="#collapseExample" name="d3" onclick="divheight();"
				aria-expanded="false" aria-controls="collapseExample" style="float: left; width:150px;">카테고리</button>
		</div>
		<!-- collapse 대상 태그는 class를 collapse로 설정합니다. -->
		<div class="collapse" id="collapseExample">
			<div class="well">소분류</div>
			
		</div>

	</div>


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
<!-- 			<tr height="150px">
				<td>2</td>
				<td rowspan="4">
					<p>제목</p>
					<p>저자</p>
					<p>출판사</p>
					<p>키워드</p>
				</td>
				<td>평점</td>
				<td>가격</td>
				<td>수량 및 장바구니</td>
			</tr> -->
		</tbody>

	</table>

</div>

</div>

</div>

<script src="resources/js/search_table.js"></script>
<!-- 아래 이 이링크 안넣어주면 js 작동안함 이 경로에있는 파일 실행시켜주려면 -->
