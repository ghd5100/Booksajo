<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<link rel="stylesheet" type="text/css" href="resources/css/mainstore_page/mainStore_body.css">
<head>
    <meta charset="utf-8">
    <title>매장안내</title>
    
</head>
<body>	
	<div class="nav_wrap" style="display: inline;">
	<div class="nav">
				<ul>
					<li><a href="http://localhost:9007/booksajo/mainStore1">위치안내</a></li>
					<li><a href="#">주차안내</a></li>
					<li><a href="#">내부안내도</a></li>
					<li><a href="#">매장소식&행사</a></li>
					<li><a href="#">매장서비스</a></li>
				</ul>
	</div>
</div>
<hr align="center" style="border: 4px; width: 90%; height: 100%;">


<!-- 					<li><a href="/storen/MainStore.laf?SITE=01">위치안내</a></li> -->
<!-- 					<li><a href="/storen/StoreParking.laf?SITE=01">주차안내</a></li> -->
<!-- 					<li><a href="/storen/StoreGuide.laf?SITE=01">내부안내도</a></li> -->
<!-- 					<li><a href="/storen/StoreEvent.laf?SITE=01">매장소식&행사</a></li> -->
<!-- 					<li><a href="/storen/StoreService.laf?SITE=01">매장서비스</a></li> -->


<!-- 지도를 표시할 div 입니다 -->
<!-- <div id="map" style="width:952px;height:420px;margin: 50px 0 50px 0; "></div> -->
<div id="map" style="width:950px;height:420px;left: 25%;">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b17a1330650b99d134f417d561252d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.570942, 126.977763), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var iwContent = '<div style="padding:5px; font-style: 14px !important;">교보문고 광화문점</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.570942, 126.977763), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

// 인포윈도우를 생성하고 지도에 표시합니다
var infowindow = new kakao.maps.InfoWindow({
    map: map, // 인포윈도우가 표시될 지도
    position : iwPosition, 
    content : iwContent,
    removable : iwRemoveable
});
      
</script>
</div>
	<div class="address" id="skip_map">
		<p id="address">
			<img src="http://image.kyobobook.co.kr/ink/images/storeinfo/2020_renew/icon_map.png" alt="주소">서울특별시 종로구 종로 1, 북사조생명빌딩 지하 1층
		</p>
	</div>
</body>
	<div class="locationinfo">
	<b style="font-size: 18px;">지하철로 오시려면</b>
	<br> 지하철 1,2호선 시청역 하차 시청 쪽 4번 출구로 나와 광화문 방향으로 500m
	<br>

	<br> 지하철 5호선 광화문역 하차 3번출구 나오기 직전 왼쪽 출입구
	<br>

	<br> 지하철 5호선 광화문역 하차 4번출구 나오기 직전 오른쪽 출입구
	<br>

	<br> 지하철 1호선 종각역 하차 1번출구 방향으로 500m 도보 후 오른쪽 건물 지하1층
	<br>
	<br>
	<br>
	<b style="font-size: 18px;">버스로 오시려면</b>
	<br>
	<b>교보빌딩 앞</b>
	<br>

	<br> 지선 : 0015(남산방향), 0212, 1011, 1012, 1020, 7012, 7018
	<br> 간선 : 162, 606
	<br> 광역 : 9703
	<br>

	<br>
	<b>KT 중앙지사 앞</b>
	<br>

	<br> 순환 : 01
	<br> 지선 : 7020, 종로01, 종로11
	<br> 간선 : 150, 200
	<br>

	<br>
	<b>세종문화회관 앞</b>
	<br>

	<br> 순환 : 01
	<br> 지선 : 0015(용산방향), 1011, 1711, 7018, 7022, 7023, 종로01, 종로11
	<br> 간선 : 150, 162, 200, 401, 402, 406, 704
	<br> 광역 : 5001, 5500, 9301(마방집), 9301(신장시장), 9301(하남시장), 9400, 9401,
	9402, 9411, 9600, 9601, 9602, 9706, 9713
	<br>

	<br>
	<b>광화문 크라운베이커리 앞</b>
	<br>

	<br> 지선 : 7023
	<br> 간선 : 160, 161, 260, 270, 271, 300, 370, 470, 471, 601, 705, 720
	<br> 광역 : 9710
	<br>

	<br>
	<b>광화문역 앞</b>
	<br>

	<br> 간선 : 160, 161, 200, 260, 270, 271, 370, 402, 406, 470, 471, 600,
	602
	<br>

	<br>
	<b>광화문빌딩 앞</b>
	<br>

	<br> 순환 : 01
	<br> 지선 : 7019(대림시장), 7019(시립병원)
	<br> 광역 : 9600, 9601, 9706, 9713
	<br>

	<br>
	<b>서울파이낸스센터 서울신문사 앞</b>
	<br>

	<br> 순환 : 01
	<br> 지선 : 0014, 0015(남산방향), 1011, 1711, 7012, 7017, 7021, 종로11
	<br> 간선 : 150, 162, 200, 402, 601
	<br> 공항버스 : 601
	<br>

	<br>
	<b>코리아나호텔 앞</b>
	<br>

	<br> 지선 : 종로11
	<br> 광역 : 9001>
	<br> 공항버스 : 1노선(시청), 601, 605
	<br>

	<br>
	<b>종로1가 대경빌딩 앞</b>
	<br>

	<br> 지선 : 0212, 1012, 1020
	<br> 간선 : 150, 160, 161, 200, 260, 270, 271, 300, 370, 470, 471, 501,
	601, 606, 705, 720
	<br> 광역 : 9401, 9411
	<br> 공항버스 : 602
	<br>

	<br>
	<b>종로1가 농협 앞</b>
	<br>

	<br> 광역 : 9301(마방집), 9301(신장시장), 9301(하남시청)
	<br> 공항버스 : 601
	<br>

	<br>
	<b>종로1가 SK빌딩 앞</b>
	<br>

	<br> 지선 : 0014, 0212, 7018
	<br> 간선 : 150, 160, 161, 200, 260, 270, 271, 370, 471, 702, 705, 720
	<br> 광역 : 9301(마방집), 9301(신장시장), 9301(하남시청), 9701, 9705
	<br> 공항버스 : 601
	</div>

</html>







<!-- 92b17a1330650b99d134f417d561252d -->

