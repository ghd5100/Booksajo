<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_board.css">

<div id="notice_board">
	<!-- 페이지 타이틀 -->
	<h1 class="h1_notice">공지사항</h1>
	<!-- // 페이지 타이틀 -->
	<!-- 공지사항 리스트 -->
	<table class="table_style02" cellspacing="0" cellpadding="0" border="0">
		<!-- summary="공지사항 목록 테이블로 번호,제목,날짜 목록으로 구성"> -->

		<colgroup>
			<col width="86px">
			<col width="*">
			<col width="126px">
		</colgroup>

		<tbody>
			<tr> 
				<th scope="col" class="title"><p class="th_line">번호</p></th>
				<th scope="col" class="title"><p class="th_line">제목</p></th>
				<th scope="col" class="th_line_none">날 짜</th>
			</tr>
		</tbody>
			
	<c:forEach items="${noticeList }" var="noticedto">
      <tr>
         <td>${noticedto.nseq }</td>
         <td>  
            <a href="contentView?ntitle=${noticedto.ntitle }">${noticedto.ntitle }</a> 
         </td>
         <td>${noticedto.ndate }</td>
      </tr>
   </c:forEach>
		</table>


	<!-- 페이징 -->
	<div class="margin_top20">
		<div class="paging_num">
			<img
				src="http://image.kyobobook.co.kr/ink/images/common/btn_prev02.gif"
				onmouseover="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_prev02_on.gif'"
				onmouseout="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_prev02.gif'"
				alt="처음 페이지로 이동"><img
				src="http://image.kyobobook.co.kr/ink/images/common/btn_prev.gif"
				onmouseover="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_prev_on.gif'"
				onmouseout="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_prev.gif'"
				alt="이전 페이지로 이동">&nbsp;&nbsp;<strong>1</strong>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('2')">2</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('3')">3</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('4')">4</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('5')">5</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('6')">6</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('7')">7</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('8')">8</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('9')">9</a>&nbsp;&nbsp;|&nbsp;<a
				href="javascript:_go_targetPage('10')">10</a>&nbsp;<a class="pad"
				href="javascript:_go_targetPage('2')">&nbsp;<img
				src="http://image.kyobobook.co.kr/ink/images/common/btn_next.gif"
				onmouseover="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_next_on.gif'"
				onmouseout="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_next.gif'"
				alt="다음 페이지로 이동"></a><a class="pad"
				href="javascript:_go_targetPage('28')"><img
				src="http://image.kyobobook.co.kr/ink/images/common/btn_next02.gif"
				onmouseover="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_next02_on.gif'"
				onmouseout="javascript:this.src='http://image.kyobobook.co.kr/ink/images/common/btn_next02.gif'"
				alt="마지막 페이지로 이동"></a>
		</div>
		<script language="javascript">
function _go_targetPage(num){location.href='/cscenter/noticeList.laf?Kc=WHBLETnotice&targetPage='+num;
}
</script>

		<!-- 검색 패널  -->
		<div id="searchPanel">
			<br /><br />
			<input type="checkbox" name="btitle" checked /> <label>제목</label>
			<input type="checkbox" name="bcontent" /> <label>내용</label> 
			<input type="text" id="searchKeyword" style="width: 150px;" maxlength="50" value="" /> 
			<input type="submit" id="btn_search" value="검색" />
		</div>
	</div>
	<!-- 페이지 고유 js include -->
	<script src="resources/js/board.js"></script>