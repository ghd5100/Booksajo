<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">

	<!-- 페이지 타이틀 -->
	<h1 class="h1_notice">공지사항</h1>

	<!-- 공지사항 게시판 리스트 -->
		<table class="noticeListTable" border="1" style="border-color: #a8afe5">
			<colgroup>
				<col width="86px">
				<col width="*">
				<col width="126px">
			</colgroup>

			<tbody>
				<tr>
					<th scope="col" class="th_line_none"><p class="th_line">번호</p></th>
					<th scope="col" class="th_line_none"><p class="th_line">제목</p></th>
					<th scope="col" class="th_line_none"><p class="th_line">날 짜</p></th>
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
	<form id="form1" name="form1" action="noticeList" method="post">
	<c:if test="${searchVO.totPage>1 }">
		<c:if test="${searchVO.page>1 }">
			<a href="noticeList?page=1"><img src="resources/img/btn_prev.gif" alt="" /></a>
			<a href="noticeList?page=${searchVO.page-1 }"><img src="resources/img/btn_prev_on.gif" alt="" /></a>
		</c:if>
		<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVO.page }">
					<span style="color:red; font-weight: bold;">${i } </span>&nbsp;&nbsp;|&nbsp;&nbsp; 
				</c:when>
				<c:otherwise>
					<a href="noticeList?page=${i }" style="text-decoration: none">${i } </a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${searchVO.totPage>searchVO.page }">
			
			<a href="noticeList?page=${searchVO.page+1 }"><img src="resources/img/btn_next.gif" alt="" /></a>
			<a href="noticeList?page=${searchVO.totPage }"><img src="resources/img/btn_next_on.gif" alt="" /></a>
		</c:if>
	</c:if>
	
	<div>
		<c:choose>
			<c:when test="${ntitle }">
				<input type="checkbox" name="searchType" value="ntitle" checked />
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="ntitle" checked />
			</c:otherwise>
		</c:choose>
		<label>제목</label>
		<c:choose>
			<c:when test="${ncontent }">
				<input type="checkbox" name="searchType" value="ncontent"  checked />
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="ncontent"  />
			</c:otherwise>
		</c:choose>		
		<label>내용</label>
		<input type="text" name="sk" style="width: 150px;" maxlength="50" value="" />
		<input type="submit" name="btn_search" value="검색" />
	</div>
</form>

<!-- 총게시물 개수 -->
	<table id="totcnt">
		<tr>
			<td id="a.totcnt">총 게시물 : ${totRowCnt }</td>
		</tr>
	</table>

<!-- 관리자 글작성 패널 -->
	<table id="writebtn">
		<tr>
			<td colspan="5"> <a href="noticeWriteView">글작성</a> </td>
		</tr>
	</table>


	<br />
	<br />
	<br />


<!-- 페이지 고유 js include -->
	<script src="resources/js/board.js"></script>