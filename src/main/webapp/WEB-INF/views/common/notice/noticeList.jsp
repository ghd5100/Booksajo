<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">

<div id="notice_board">
	<!-- 페이지 타이틀 -->
	<h1 class="h1_notice">공지사항</h1>

	<!-- 공지사항 게시판 리스트 -->
	<form action="noticeSearch" method="post">
		<table class="table_style02" cellspacing="0" cellpadding="0"
			border="0">

			<colgroup>
				<col width="86px">
				<col width="*">
				<col width="126px">
			</colgroup>

			<tbody>
				<tr>
					<th scope="col" class="nseq"><p class="th_line">번호</p></th>
					<th scope="col" class="ntitle"><p class="th_line">제목</p></th>
					<th scope="col" class="th_line_none">날 짜</th>
				</tr>
			</tbody>

			<c:forEach items="${noticeList }" var="noticedto">
				<tr>
					<td>${noticedto.nseq }</td>
					<td><a href="noticeView?nseq=${noticedto.nseq }">${noticedto.ntitle }</a>
					</td>
					<td><fmt:formatDate value="${noticedto.ndate }" pattern="yyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>

		
		<!-- 페이징 -->
		<div class="pageList">
			<a href="noticeList?page={}">&lang;&lang;</a>
			<a href="#">&lang;</a>
			<c:forEach begin="${page.pageStart }" end="${page.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq page.page }">
						<span style="color: red; font-weight: bold;">${i }&nbsp;</span>	
					</c:when>
					<c:otherwise>
						<a href="noticeList?page=${i }">${i }</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="#">&rang;</a>
			<a href="#">&rang;&rang;</a>
		</div>







		<!-- 검색 패널  -->
		<div id="searchPanel">
			<br />
			<br /> 
			<input type="checkbox" name="btitle" checked /> <label>제목</label>
			<input type="checkbox" name="bcontent" /> <label>내용</label> 
			<input type="text" id="searchKeyword" style="width: 150px;" maxlength="50" value="" /> 
			<input type="submit" id="btn_search" value="검색" />
		</div>
	</form>

	<!-- 관리자 글작성 패널 -->
	<table id="writebtn">
		<tr>
			<td colspan="5"> <a href="noticeWriteView">글작성</a> </td>
		</tr>
	</table>


	<br />
	<br />
	<br />
	
</div>


<!-- 페이지 고유 js include -->
	<script src="resources/js/board.js"></script>