<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/noticeList_board.css">

	<!-- 페이지 타이틀 -->
	<h1 class="h1_notice">공지사항</h1>

	<!-- 공지사항 게시판 리스트 -->
		<table class="noticeListTable">
			<colgroup>
				<col width="86px">
				<col width="*">
				<col width="126px">
			</colgroup>

			<tbody>
				<tr>
					<th scope="col" class="nseq">번호</th>
					<th scope="col" class="ntitle">제목</th>
					<th scope="col" class="th_line_none">날 짜</th>
				</tr>
			</tbody>
			
		<c:forEach items="${noticeList }" var="noticedto">
				<tr>
					<td>${noticedto.nseq }</td>
					<td class="td_line_none_left"><a href="noticeView?nseq=${noticedto.nseq }">${noticedto.ntitle }</a>
					</td>
					<td class="td_line_none"><fmt:formatDate value="${noticedto.ndate }" pattern="yyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>

<!-- 페이징 -->
<br /><br />
<div class="paging_num">
	<c:if test="${searchVO.totPage>1 }">
		<c:if test="${searchVO.page>1 }">
			<a href="noticeList?page=1&sk=${searchVO.searchKeyword}&searchType=${searchVO.searchType}"><img src="resources/img/btn_prev_on.gif" alt="" /></a>
			<a href="noticeList?page=${searchVO.page-1 }&sk=${searchVO.searchKeyword}&searchType=${searchVO.searchType}"><img src="resources/img/btn_prev.gif" alt="" /></a>
		</c:if>
		<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVO.page }">
					<span style="color:#0172c9; font-weight: bold;">${i } </span>&nbsp;&nbsp;|&nbsp;&nbsp; 
				</c:when>
				<c:otherwise>
					<a href="noticeList?page=${i }&sk=${searchVO.searchKeyword}&searchType=${searchVO.searchType}" style="color:#666;">${i } </a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${searchVO.totPage>searchVO.page }">
			
			<a href="noticeList?page=${searchVO.page+1  }&sk=${searchVO.searchKeyword}&searchType=${searchVO.searchType}"><img src="resources/img/btn_next.gif" alt="" /></a>
			<a href="noticeList?page=${searchVO.totPage }&sk=${searchVO.searchKeyword}&searchType=${searchVO.searchType}"><img src="resources/img/btn_next_on.gif" alt="" /></a>
		</c:if>
	</c:if>
</div>
<br /><br />
<!-- 서치 -->	
	<div class="searchArea">
		<form id="form1" name="form1" action="noticeList" method="post">
			<c:choose>
				<c:when test="${ntitle }">
					<input type="checkbox" name="searchType" value="ntitle" checked />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="ntitle" />
				</c:otherwise>
			</c:choose>
			<label>제목</label>
			<c:choose>
				<c:when test="${ncontent }">
					<input type="checkbox" name="searchType" value="ncontent" checked />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="searchType" value="ncontent" />
				</c:otherwise>
			</c:choose>		
			<label>내용</label>
			<input type="text" name="sk" style="width: 150px;" maxlength="50" />
			<input type="submit" name="btn_search" value="검색" />
		</form>
	</div>

<!-- 총게시물 개수 -->
	<div class="totcnt">
		<td id="totcnt">총 게시물 : ${totRowCnt }</td>
	</div>

<!-- 관리자 글작성 패널 -->
	<c:if test="${userid eq 'admin' }">
		<div class="btn">
			<button type="button">
				<a href="noticeWriteView" style="color: black;">글쓰기</a>
			</button>
		</div>
	</c:if>



<!-- 페이지 고유 js include-->
	<script src="resources/js/board.js"></script> 