<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_page/notice_board.css">


<table border="1" class="table">
	<h1 class="h1_notice">공지사항</h1>
	<input type="hidden" name="nseq" value="${noticeView.nseq }" />
		<tr>
			<td class="left">번호</td>
			<td>${noticeView.nseq }</td>
		</tr>
		<tr>
			<td class="left">날 짜</td>
			<td><fmt:formatDate value="${noticeView.ndate }" pattern="yyy-MM-dd"/></td>
			<td class="left">조회수</td>
			<td>${noticeView.hit }</td>
		</tr>
		<tr>
			<th scope="col" class="left">제목</th>
			<th>
				<input type="text" name="nTitle" size="119px" value="${noticeView.ntitle }" />
			</th>
		</tr>
		<tr>
			<th class="left">내용</th>
			<th>
				<input type="text" name="nContent" value="${noticeView.ncontent }" />
				<textarea name="nContent" cols="120" rows="30"></textarea>
			</th>
		</tr>
</table>


			
		<!-- 관리자 영역 BTN -->
			<br /><br />
		<div id="mngPanel">
			<a href="noticeModify">			
				<input type="submit" id="modifybtn_noticelist" value="확인" /></a>&nbsp;&nbsp;
			<a href="noticeView">			
				<input type="submit" id="cmodifybtn_noticelist" value="취소 " /></a>&nbsp;&nbsp;
		</div>
	
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>