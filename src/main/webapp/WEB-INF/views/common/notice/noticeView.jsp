<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">
	<div id="notice_board">
		<h1 class="h1_notice">공지사항</h1>
		<table border="1">
		<form action="noticeModify" method="get">
		<input type="hidden" name="nseq" value="${noticeView.nseq }" />
			<tr>
				<th class="left">제목</th>
					<th>${noticeView.ntitle }</th>
				<th class="left">번호</th>
					<th>${noticeView.nseq }</th>
			</tr>
			<tr>
				<th class="left">날 짜</th>
					<th><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd"/></th>
				<th class="left">조회수</th>
					<th>${noticeView.nhit }</th>
			</tr>
			<tr>
				<th class="left" >내용</th>
					<th>${noticeView.ncontent }</th>
			</tr>
			
		</form>
		</table>
	
		
		<!-- 페이징 및 목록 영역  --> 
		<br />
		<div id="pagingPanel">
			<a href="#">
				<input type="submit" id="prebtn_noticeView" value="이전" /></a> &nbsp;&nbsp;
			<a href="noticeList">
				<input type="submit" id="listbtn_noticeView" value="목록" /></a> &nbsp;&nbsp;
			<a href="#">
			<input type="submit" id="nextbtn_noticeView" value="다음" /></a> &nbsp;&nbsp;
		</div>
			
		<!-- 관리자 영역 BTN -->
			<br /><br />
		<div id="mngPanel">
			<a href="noticeDelete?nseq=${noticeView.nseq }">			
				<input type="submit" id="deletebtn_noticeList" value="삭제" /></a>&nbsp;&nbsp;
			<a href="noticeModify">			
				<input type="submit" id="modifybtn_noticeList" value="수정" /></a>&nbsp;&nbsp;
		</div>
	</div>
	
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>