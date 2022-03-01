<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/main_page/main_page.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
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

<!-- 	<h1><b>MAIN</b></h1> -->
	<div id="adv_area">
		<div class="adv_slide">                
			<ul class="adv_list">
				<li>
					<img src="resources/img/adv01.jpg" alt="" />
				</li>
				<li>
					<img src="resources/img/adv02.jpg" alt="" />
				</li>
				<li>
					<img src="resources/img/adv03.jpg" alt="" />
				</li>
			</ul>
            <p class="adv_controller">
                   <span class="prev">&lang;</span>
                   <span class="next">&rang;</span>
            </p>
            <div class="adv_btns">
                <label for="adv_btn1" id="btn1" class="btns"></label>
                <label for="adv_btn2" id="btn2" class=""></label>
                <label for="adv_btn3" id="btn3" class=""></label>
            </div>
		</div>

		<div class="input_none">
            <input type="radio" name="adv_btn" id="adv_btn1" checked />
            <input type="radio" name="adv_btn" id="adv_btn2" />
            <input type="radio" name="adv_btn" id="adv_btn3" />
        </div>
            
			
	</div>

	<div id="best_area">
        <div class="content_top">
            <a href="#">베스트 셀러</a>
            <a class="view_all" href="bestList?page=1">전체보기＞</a>
        </div>
        <div class="best_content">
        	
            <ul class="best_content_list">
           		<c:forEach items="${list }" var="list">
					<li>
						<div class="book_thumbnail">
							<a href="#">
								<img src="${list.thumbnail }" alt="${list.thumbnail }" />
							</a>
						</div>
						<div class="title">
                        <a href="#">
                            <strong>${list.title }</strong>
                            <span>글쓴이 : 누군가</span>
	                        <span>출판사 : 어딘가</span>
	                        <span>출판일 : 언젠가</span>
                        </a>
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
                    </div>
                </li> -->
            </ul>
            <p class="best_controller">
				<span class="best_prev">&lang;</span>
				<span class="best_next">&rang;</span>
            </p>
        </div>
    </div>
	<div id="today_area">
        <div class="content_top">
            <a href="#">오늘의 책</a>
        </div>
        <div class="today_content">
            <ul class="today_content_list">
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
                            <span>글쓴이 : 누군가</span>
	                        <span>출판사 : 어딘가</span>
	                        <span>출판일 : 언젠가</span>
                        </a>
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
                            <span>글쓴이 : 누군가</span>
	                        <span>출판사 : 어딘가</span>
	                        <span>출판일 : 언젠가</span>
                        </a>
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
                            <span>글쓴이 : 누군가</span>
	                        <span>출판사 : 어딘가</span>
	                        <span>출판일 : 언젠가</span>
                        </a>
                    </div>
                </li>
               
            </ul>
            
            

            <p class="today_controller">
				<span class="today_prev">&lang;</span>
				<span class="today_next">&rang;</span>
            </p>
        </div>
	</div>
</body>
</html>