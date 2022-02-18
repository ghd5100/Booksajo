<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">


<h1 class="h1_notice">공지사항 상세 수정</h1>
<table class="noticeUpdateBoard" border="1px">
	<form action="noticeModify" method="post">
		<input type="hidden" name="nseq" value="${noticeView.nseq }" />
		<tr>
			<th class="left">제목</th>
			<td><input type="text" name="nTitle" value="${noticeView.ntitle }" size="50px" /></td>
			<th class="left">번호</th>
			<td>${noticeView.nseq }</td>
		</tr>
		<tr>
			<th class="left">날 짜</th>
			<td><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd" /></td>
			<th class="left">조회수</th>
			<td>${noticeView.nhit }</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3"><textarea name="nContent" cols="120" rows="30" >${noticeView.ncontent }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="5" class="updatebtn">
				<input type="submit" value="저장" /> &nbsp;&nbsp;
				<a href="noticeView?nseq=${noticeView.nseq }">취소</a> &nbsp;&nbsp;
			</td>
		</tr>
		
	</form>
</table>
			<br />
			<br />


		<!-- 관리자 영역 BTN -->
<%-- 		<br />
		<br />
		<div id="mngPanel">
			<input type="submit" id="modifybtn_noticelist" value="저장" /></a>&nbsp;&nbsp;
			<a href="noticeCancel?nseq=${noticeView.nseq }">취소</a>&nbsp;&nbsp;
		</div>
		<br />
		<br /> --%>

<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>