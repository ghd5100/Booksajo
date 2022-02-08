<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="resources/css/board.css">
	<div id="board">
		<table border="1" class="table">
		   <thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이름</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col">히트</th>
				</tr>
		  </thead>
		  <tbody id="loadContent">
		
		  </tbody>
		</table>
		
		TotCnt : 
		
		
		<!-- 페이지번호멩글기 -->
		<div id="pageList">
		
		</div>
		
		<!-- 리스트 패널 -->	
		<div id="listPanel">
		
		</div>
		
		
		<!-- 검색 패널  --> 
		<div id="searchPanel">
			<input type="checkbox" name="btitle" checked />
			<label>제목</label>
			<input type="checkbox" name="bcontent"/>
			<label>내용</label>		
			<input type="text" id="searchKeyword" style="width: 150px;" maxlength="50" value="" />
			<input type="submit" id="btn_search" value="검색" />
		</div>
	</div>
<!-- 페이지 고유 js include -->
<script src="resources/js/board.js"></script>