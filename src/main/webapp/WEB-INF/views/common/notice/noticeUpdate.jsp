<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/noticeUpdate_board.css">

<!-- 글쓰기에디터 js -->
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>

<div class="noticeUpdate_board">
	<h1 class="h1_notice">공지사항 수정</h1>
	<form action="noticeModify" method="post">
		<input type="hidden" name="nseq" value="${noticeView.nseq }" />
		<table class="table">
			<thead>
				<tr>
					<th class="th_title">제목</th>
					<td class="td_title"><input type="text" name="nTitle"
						value="${noticeView.ntitle }" size="50px" /></td>
					<th class="th_seq">번호</th>
					<td class="td_seq">${noticeView.nseq }</td>
				</tr>
				<tr>
					<th class="th_date">날 짜</th>
					<td class="td_date"><fmt:formatDate
							value="${noticeView.ndate }" pattern="yyy-MM-dd" /></td>
					<th class="th_hit">조회수</th>
					<td class="td_hit">${noticeView.nhit }</td>
				</tr>
				<tr>
					<th class="th_content">내용</th>
					<td colspan="5"><textarea class="td_content" name="nContent" id="textarea"
							style="resize: none">${noticeView.ncontent }</textarea></td>
				</tr>
			</thead>
		</table>

		<div class="btn">
			<input type="submit" value="저장" /> &nbsp;&nbsp; 
			<a href="noticeView?nseq=${noticeView.nseq }">취소</a> &nbsp;&nbsp;
		</div>

	</form>
</div>

<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>

<!-- 글쓰기에디터 js -->
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>