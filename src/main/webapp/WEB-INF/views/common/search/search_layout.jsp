<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>


#container{
	width: 100%;
	margin: 260px 0px;
	text-align: center;
	border: 0px solid #bcbcbc;
	background-color:white;
}


#sidebar-left{
	width: 11%;
	height: 500px;
	margin-left: 20%;
	margin-top:5px;
	padding-top:0px;
	float: left;
	background-color: #fff;
	border: 1.5px solid #a8afe5;
	border-collapse:collapse;
	font-size: 10px;
	z-index: -1;
}

#content{
	margin-top:5px;
	width:50%;
	margin-left:5px;
	float: left;
/* 	border: 2px solid #bcbcbc; */
	height: 1500px;
	z-index: -1;
	
	/* 사이드바 높이 없어지면서 메인부분이 높이가 너무 짧아짐 내용부분에 높이 추가하면댐 */ 
	
}

#footer{
z-index: -2;
}


</style>

<title>
	<tiles:insertAttribute name="title" />
</title>
</head>
<body>

	<!-- 영역없는거 안없애면 에러남. 타일설정 에러 ->서블렛 에러 -->
	
<div id="container">
 	
 	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
 
 	<div id="sidebar-left">
		<tiles:insertAttribute name="side" />
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