<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

#title{
margin-top: 138px;
width: 63%;
margin-left: 265px;

}

#container {
	width: 100%;
	text-align: center;
	border: 0px solid #bcbcbc;
	background-color: white;

}

#content {
	margin-top: 0px;
	/* width와 margin-left로 영역조절 */
	width: 63%;
	margin-left: 14%;
	float: left;
	/* 	border: 2px solid #bcbcbc; */
	height: 100%;
	z-index: -1;
	display: inline-block;
	/* 사이드바 높이 없어지면서 메인부분이 높이가 너무 짧아짐 내용부분에 높이 추가하면댐 */
}

#footer {
	/*  
기존설정  
	float:left;
    width: 100%;
    z-index: 0;
	background-color: #eee;
*/
	/* 새로운설정 */
	/* 	포지션을 스타틱으로 해줘야함 위네 블럭 영역다음에 배치됨 */
	float: left;
	width: 100%;
	height: 200px;
	position: static;
	z-index: 0;
	background-color: #eee;
}
</style>


</head>
<body style="height: 100%;">
		<div id="title">
			<tiles:insertAttribute name="title" />
		</div>

	<div id="container">

		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>


</body>
</html>