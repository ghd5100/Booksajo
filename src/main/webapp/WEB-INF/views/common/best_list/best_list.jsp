<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/best_list.css" />
<title>Insert title here</title>
<style>
#content {
	width: 1000px;
	margin: 0 auto;
	float: none;
}
</style>
</head>
<body>
	<div class="contents">
		<div class="contents_top">
			<h1>베스트 셀러</h1>
		</div>
		<div class="book_list_area">
			<ul class="book_list">
				<c:forEach items="${list }" var="list">
					<li>
	                    <div class="book_thumbnail">
	                            <a href="#">
	                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
	                            </a>
	                    </div>
	                    <div class="title">
	                        <a href="#">
	                            <strong>${list.title }</strong>
							</a>
							<span>글쓴이 : ${list.authors }</span>
	                        <span>출판사 : ${list.publisher }</span>
	                        <span>가격 : ${list.price }</span>
<!-- 							가격, 출판일 뭐넣을지 못정함 -->
						</div>
					</li>
				</c:forEach>
				
                <!-- <li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li>
				
				<li>
                    <div class="book_thumbnail">
                            <a href="#">
                                <img src="https://post-phinf.pstatic.net/MjAxOTA0MjZfMjc2/MDAxNTU2MjE2Njc1NjAz.5GjTVBEPY0kd2SExs3uiK2eeZ1K6pCae4MwViLxf8rcg.BN2Tr6BXUaFG_IJJOB4pSFLRdHqprgQxk-ugh-W0uZ4g.JPEG/KakaoTalk_20190426_032248653.jpg?type=w1200" alt="">
                            </a>
                    </div>
                    <div class="title">
                        <a href="#">
                            <strong>제목</strong>
						</a>
						<span>글쓴이 : 누군가</span>
                        <span>출판사 : 어딘가</span>
                        <span>출판일 : 언젠가</span>
					</div>
				</li> -->
			</ul>
		</div>
		<div class="page_area">
			<a href="bestList?page={}">&lang;&lang;</a>
			<a href="#">&lang;</a>
			<c:forEach begin="${page.pageStart }" end="${page.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq page.page }">
						<span style="color:red; font-weight:bold">${i }&nbsp;</span>
					</c:when>
					<c:otherwise>
						<a href="bestList?page=${i }">${i }</a>&nbsp;		
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="#">&rang;</a>
			<a href="#">&rang;&rang;</a>
			
		</div>
	</div>
</body>
</html>