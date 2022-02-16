<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="resources/css/notice_page/noticeWrite_board.css">
<div id="notice_board">

	<!-- 페이지 타이틀 -->
	<h1 class="h1_notice">공지사항</h1>
	
	<!-- 공지사항 게시판 디테일 -->
	<form action="noticeWrite" method="get">
		<table class="table">

<%-- 			<colgroup>
				<col width="86px">
				<col width="*">
				<col width="126px">
			</colgroup> --%>

			<thead>
				<tr>
					<th scope="col" class="left">제목</th>
					<th><input type="text" name="nTitle" placeholder="제목을 입력하세요." size="119px"/></th>
				</tr>
				
<!-- 				<tr>
					<th scope="col" class="left">날 짜</th>
					<th><input type="text" name="nDate" placeholder="날짜를 입력하세요." size="119px"/></th>
				</tr> -->
				
				<tr>
					<th scope="col" class="left">내용</th>
					<th><textarea name="nContent" cols="120" rows="30" placeholder="내용을 입력하세요"></textarea></th>
				</tr>
			</thead>
		</table>

		<table>
			<tr>
				<th scope="col">
 					<input type="submit" value="입력" />
 					<a href="noticeList">목록</a>
				</th>
			</tr>
		</table>

		<br /> <br /> <br /> <br /> <br /> <br /> <br /> 
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> 
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
	</form>
</div>


<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>