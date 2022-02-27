<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/noticeView_board.css">

		<div class="noticeView_board">
		<h1 class="h1_notice">공지사항 상세</h1>
		<table class="table">
		
			<tr>
				<th class="th_title" colspan="2">제목</th>
					<td colspan="2" class="td_title">${noticeView.ntitle }</td>
				<th class="th_seq" colspan="2">번호</th>
					<td class="td_seq">${noticeView.nseq }</td>
			</tr>
			
			<tr>
				<th class="th_date" colspan="2">날 짜</th>
					<td colspan="2" class="td_date"><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd"/></td>
				<th class="th_hit" colspan="2">조회수</th>
					<td colspan="2" class="td_hit">${noticeView.nhit }</td>
			</tr>
			
			<tr class="tr_content">
				<th class="th_content" colspan="2">내용</th>
					<td colspan="5" class="td_content">${noticeView.ncontent }</td>
			</tr>
		</table>
		</div>
	
		
		<!-- 페이징 및 목록 영역  --> 

	<c:if test="${userid eq 'admin' }">
		<!-- 관리자 영역 BTN -->
			<div class="admin_btn">
				<a href="noticeDelete?nseq=${noticeView.nseq }" style="color: black;">			
					<input type="submit" id="deletebtn_noticeList" value="삭제" /></a>&nbsp;&nbsp;
				<a href="noticeUpdate?nseq=${noticeView.nseq }" style="color: black;">			
					<input type="submit" id="modifybtn_noticeList" value="수정" /></a>&nbsp;&nbsp;
			</div>
	</c:if>
		<div class="btn">
				<a href="noticeList" style="color: black;">
					<input type="submit" class="listbtn_noticeView" value="목록" /></a> &nbsp;&nbsp;
		</div>
	
	
	
	
	<div>
	<h1>${userid }</h1>
	<h1>${admin }</h1>
	</div>
	
	
	
	
	
	
<!-- 공지사항 view테이블 이전,다음 버튼(기능구현하게되면 살려보자) -->
<!-- 			<a href="#">
				<input type="submit" id="prebtn_noticeView" value="이전" /></a> &nbsp;&nbsp; -->
<!-- 			<a href="#">
			<input type="submit" id="nextbtn_noticeView" value="다음" /></a> &nbsp;&nbsp; -->
			
			
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>