<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">
	<div id="notice_board">
		<h1 class="h1_notice">공지사항</h1>
		<table border="1" class="table">
		   <thead>
			<tr>
				<td class="left">제목</td>
					<td>${noticeView.ntitle }</td>
			</tr>
			<tr>
				<td class="left">날 짜</td>
					<td><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd"/></td>
				<td class="left">조회수</td>
					<td>${noticeView.nhit }</td>
			</tr>
			<tr>
				<td class="left" colspan="1">내용</td>
					<td>${noticeView.ncontent }</td>
			</tr>

		</thead>
		  </tbody>
		</table>
	
		
		<!-- 페이징 및 목록 영역  --> 
		<br />
		<div id="pagingPanel">
			<a href="#">
				<input type="submit" id="prebtn_noticelist" value="이전" /></a>
			<a href="noticeList">
				<input type="submit" id="listbtn_noticelist" value="목록" /></a>
			<a href="#">
			<input type="submit" id="nextbtn_noticelist" value="다음" /></a>
		</div>
			
		<!-- 관리자 영역 BTN -->
			<br /><br />
		<div id="mngPanel">
			<a href="noticeDelete?nseq=${noticeView.nseq }">			
				<input type="submit" id="deletebtn_noticelist" value="삭제" /></a>&nbsp;&nbsp;
			<a href="noticeModify">			
				<input type="submit" id="modifybtn_noticelist" value="수정" /></a>&nbsp;&nbsp;
		</div>
	</div>
	
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>