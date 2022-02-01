<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/notice_board.css">

<div id="notice_board">
	<!-- 페이지 타이틀 -->
	<h2 class="h2_notice">공지사항</h2>
	<!-- // 페이지 타이틀 -->
	<!-- 공지사항 리스트 -->
	<table class="table_style02" cellspacing="0" cellpadding="0" border="0"
		summary="공지사항 목록 테이블로 번호,제목,날짜 목록으로 구성">
		<caption>공지사항</caption>
		<caption>공지사항</caption>
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

			<tr>
				<td class="td_line_none">280</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3780&amp;pageNumber=1">교보문고
						시스템 점검 안내 (2/1)</a></td>
				<td class="td_line_none">2022.01.26</td>
			</tr>

			<tr>
				<td class="td_line_none">279</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3779&amp;pageNumber=1">2022년
						설 연휴 배송일정 및 매장 휴무일 안내</a></td>
				<td class="td_line_none">2022.01.24</td>
			</tr>

			<tr>
				<td class="td_line_none">278</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3776&amp;pageNumber=1">우체국택배
						접수 중지로 인한 배송 및 주문 불가 안내 (일부지역추가 업데이트)</a></td>
				<td class="td_line_none">2022.01.11</td>
			</tr>

			<tr>
				<td class="td_line_none">277</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3775&amp;pageNumber=1">우체국택배
						배송지연 안내</a></td>
				<td class="td_line_none">2022.01.07</td>
			</tr>

			<tr>
				<td class="td_line_none">276</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3771&amp;pageNumber=1">바로드림
						퀵 서비스 종료 안내</a></td>
				<td class="td_line_none">2021.12.29</td>
			</tr>

			<tr>
				<td class="td_line_none">275</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3767&amp;pageNumber=1">배송
						지연 안내</a></td>
				<td class="td_line_none">2021.12.23</td>
			</tr>

			<tr>
				<td class="td_line_none">274</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3765&amp;pageNumber=1">성남시
						수정구 지역 반품 및 교환 제한 안내 (12/13~)</a></td>
				<td class="td_line_none">2021.12.13</td>
			</tr>

			<tr>
				<td class="td_line_none">273</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3744&amp;pageNumber=1">교보문고
						개인정보 처리방침 변경 안내 (10/22)</a></td>
				<td class="td_line_none">2021.10.15</td>
			</tr>

			<tr>
				<td class="td_line_none">272</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3736&amp;pageNumber=1">교보문고
						개인정보 처리방침 변경 안내 (10/1)</a></td>
				<td class="td_line_none">2021.09.24</td>
			</tr>

			<tr>
				<td class="td_line_none">271</td>
				<td class="td_line_none align_left"><a
					href="/cscenter/noticeView.laf?viewCode=&amp;seq=3731&amp;pageNumber=1">코로나
						상생 국민지원금(일명 : 5차 재난지원금) 매장 사용불가 안내</a></td>
				<td class="td_line_none">2021.09.08</td>
			</tr>



		</tbody>
	</table>
	<!-- 공지사항 리스트 -->

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
			<input type="checkbox" name="btitle" checked /> <label>제목</label> <input
				type="checkbox" name="bcontent" /> <label>내용</label> <input
				type="text" id="searchKeyword" style="width: 150px;" maxlength="50"
				value="" /> <input type="submit" id="btn_search" value="검색" />
		</div>
	</div>
	<!-- 페이지 고유 js include -->
	<script src="resources/js/board.js"></script>