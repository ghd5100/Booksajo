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

			
		<!-- 관리자 영역 BTN -->
			<br /><br />
		<div id="mngPanel">
			<a href="noticeModify">			
				<input type="submit" id="modifybtn_noticelist" value="확인" /></a>&nbsp;&nbsp;
			<a href="noticeView">			
				<input type="submit" id="cmodifybtn_noticelist" value="취소 " /></a>&nbsp;&nbsp;
		</div>
	</div>
	
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>