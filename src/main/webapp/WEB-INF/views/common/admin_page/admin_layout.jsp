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
	text-align: center;
	border: 0px solid #bcbcbc;
	
}


#content{
	margin-top:5px;
	width:50%;
	margin-left:5px;
	float: left;
/* 	border: 2px solid #bcbcbc; */
	height: 100%;
	z-index: -1;

	/* 사이드바 높이 없어지면서 메인부분이 높이가 너무 짧아짐 내용부분에 높이 추가하면댐 */ 
	
}

</style>

<title>
	<tiles:insertAttribute name="title" />
</title>
</head>
<body style="height: 100%;">


<div id="header">
	<tiles:insertAttribute name="header" />
</div>
<div id="container">
	<tiles:insertAttribute name="body" />
</div>



</body>
</html>