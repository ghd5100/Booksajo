<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_product_reg.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>

<style>
	#thumbnail {
		width: 180px;
		height: 220px;
		margin: 0 auto;
	}
	#image {
		max-width: 100%;
		max-height: 100%;
	}
</style>

<script>
// $(function(){
// 	var bb = "${list.title}";
// 	console.log(bb);
// 	var aaa = '${list.contents}';
// 	console.log(aaa);
// 	$("#detail_contents").append(aaa);
	
// });

function setThumbnail(event) {
	var reader = new FileReader();
	$("#thumbnail").remove("#image");
	reader.onload = function(event) {
// 		var img = document.createElement("img");
		$("#thumbnail").append("<img src='' id='image' />");
		$("#image").attr("src", event.target.result);
// 		document.querySelector("div#thumbnail").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
}



</script>

</head>
<body>
	<h1>상품등록</h1>
	
	<div class="contents_area">
		<div class="content_area">
			<form action="admin_product_reg" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<th rowspan="4" class="left">
							<div id="thumbnail" >
								
							</div>
							<div>
								<input type="file" name="thumbnail" onchange="setThumbnail(event)" value="등록" />
							</div>
							
						</th>
						<th class="left">
							도서번호
						</th>
						<td>
							<input type="number" name="isbn" required/>
						</td>
						<th class="left">
							재고
						</th>
						<td>
							<input type="number" name="stock" />
						</td>
					</tr>
					<tr>
						<th class="left">
							제목
						</th>
						<td colspan="3">
							<input type="text" name="title" />
						</td>
						
					</tr>
					<tr>
						<th class="left">
							가격
						</th>
						<td colspan="3">
							<input type="number" name="price" />
						</td>
					</tr>
					<tr>
						<th class="left">
							키워드
						</th>
						<td colspan="3">
							<input type="text" name="keyword" />
						</td>
						
					</tr>
					<tr>
					
						<th class="left">
							카테고리
						</th>
						<td>
							<select name="class_major" id="class">
								<option value="0">총류</option>
								<option value="1">철학</option>
								<option value="2">종교</option>
								<option value="3">사회과학</option>
								<option value="4">자연과학</option>
								<option value="5">기술과학</option>
								<option value="6">예술</option>
								<option value="7">언어</option>
								<option value="8">문학</option>
								<option value="9">역사</option>
							</select>
						</td>
						
						<th class="left">
							저자
						</th>
						<td colspan="2">
							<input type="text" name="authors" />
						</td>
					</tr>
					<tr>

						<th class="left">
							출판연도
						</th>
						<td>
							<input type="number" name="pub_year" />
						</td>
						
						<th class="left">
							출판사
						</th>
						<td colspan="2">
							<input type="text" name="publisher" />
						</td>
					</tr>
					<tr>
						<th colspan="5">
							내용
						</th>
					</tr>
					<tr>
						<td colspan="5">
							<textarea name="contents"></textarea>
						</td>
					</tr>				
					
				</table>
				
				<button type="submit">등록</button>
				<button type="button" onclick = "location.href = 'admin_product'">목록</button>
				
			</form>
		</div>
		
	</div>
</body>
</html>