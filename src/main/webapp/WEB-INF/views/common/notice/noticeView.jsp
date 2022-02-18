<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">

		<h1 class="h1_notice">공지사항 상세</h1>
		<table border="1">
			<tr>
				<th class="left" colspan="2" width="120px" height="50px">제목</th>
					<td colspan="2">${noticeView.ntitle }</td>
				<th class="left" colspan="2">번호</th>
					<td>${noticeView.nseq }</td>
			</tr>
			<tr>
				<th class="left" colspan="2" width="120px" height="50px">날 짜</th>
					<td colspan="2"><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd"/></td>
				<th class="left" colspan="2">조회수</th>
					<td colspan="2">${noticeView.nhit }</td>
			</tr>
			<tr>
				<th class="left" colspan="2" width="120px" height="50px">내용</th>
					<td colspan="5">${noticeView.ncontent }</td>
			</tr>
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
			<a href="noticeUpdate?nseq=${noticeView.nseq }">			
				<input type="submit" id="modifybtn_noticeList" value="수정" /></a>&nbsp;&nbsp;
		</div>
	</div>
	
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>