<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="resources/css/mainstore_page/mainStore_body.css">

<html>
<link rel="stylesheet" type="text/css" href="resources/css/mainstore_page/mainStore_body.css">
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:50%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b17a1330650b99d134f417d561252d"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4944877, 126.8342415), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨  
        /* 3.450701=>좌표값 */
    /*     lat=latitude위도 lng=longditude 경도 */
        //좌표값을 구하기  ->구글 맵에서 .. 특정 장소 검색하기 -> 주소바 보면 위치좌표값이 들어있음.
    //@37.485215,126.8994,17z  -구디역
        /* @37.4944877,126.8342415,17z - 우리집 */ 
};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
</body>
</html>


