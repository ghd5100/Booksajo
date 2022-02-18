<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_user.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>
<script>
$(function() {
	$(".user_delete").click(function(){
		
		if (confirm("진짜할꺼야?")) {
			$.ajax({
				type: "post",
				url: "admin_user",
				data: {target:this.id},
				success: function (data){
					alert("삭제되었습니다.");
					location.reload()
				}
			});
		} else {
			return;
		}
		
	});
});



</script>


</head>
<body>
	<h1>회원관리</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<div class="content_title">
				<strong>회원정보</strong>
				<form action="admin_user">
					<input type="text" name="user_search_keyword" />
					<button type="submit">검색</button>
				</form>
			</div>
			<div class="content_detail">
				<table>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>휴대전화</th>
						<th>가입일</th>
						<th>수정 | 삭제</th>
					</tr>
					
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.user_id }</td>
							<td>${list.user_name }</td>
							<td>${list.user_phone }</td>
							<td>${list.user_date }</td>
							<td>
								<a href="">수정</a>
								|
								<button type="button" id="${list.user_id }" class="user_delete">삭제</button>
							</td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		
	</div>
</body>
</html>