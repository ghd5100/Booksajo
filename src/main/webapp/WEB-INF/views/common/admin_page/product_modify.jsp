<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="resources/css/admin_page/admin_product_detail.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="resources/js/main.js"></script>
<title>관리자 페이지</title>

<style>

#text {
	padding-left: 15px;
	padding-right: 15px;
}
#get_data:first-child {
	padding-top: 15px;
}
#get_data:last-child {
	padding-bottom: 15px;
}
#img_area {
	padding: 15px;
}

</style>

<script>

var fileList = []; //파일 정보를 담아 둘 배열
var fileNames = [];
// function book_contents() {
// 	var aaa = $("#get_data").html()ffff;
// 	console.log("contents: " + aaa);
// }
$(function() {
	var i = 1;
	$('#get_data').on("dragover", dragOver).on("dragleave", dragOver).on(
		"drop", uploadFiles);

	function dragOver(e) {
		e.stopPropagation();
		e.preventDefault();
		if (e.type == "dragover") {
			$(e.target).css({
// 				"background-color" : "black",
// 				"outline-offset" : "-20px"
			});
		} else {
			$(e.target).css({
// 				"background-color" : "gray",
// 				"outline-offset" : "-10px"
			});
		}
	}

	function uploadFiles(e) {
		e.stopPropagation();
		e.preventDefault();
		dragOver(e);
		
		e.dataTransfer = e.originalEvent.dataTransfer;
		var files = e.target.files || e.dataTransfer.files;
		// 	  var files = e.dataTransfer.files;
		
		
		if(files != null && files != undefined){
            var tag = "";
            for(i=0; i<files.length; i++){
                var f = files[i];
                fileList.push(f);
                var fileName = f.name;
                var fileSize = f.size / 1024 / 1024;
                fileSize = fileSize < 1 ? fileSize.toFixed(3) : fileSize.toFixed(1);
                console.log("fileName : " + fileName);
                console.log("fileSize : " + fileSize);
                
            }
        }
		
		if (files.length > 1) {
			alert('하나만 올려라.');
			return;
		}
		var blobFile = window.URL.createObjectURL(files[0]);
		// 	  var imgSrc = window.URL.revokeObjectURL(blobFile);

		if (files[0].type.match(/image.*/)) {

			// 		  console.log("imgSrc : " + imgSrc);
			$("#get_data").append("<div id='img_area' class='fileList'><img id='img_src" + (i - 1) + "' src='" + blobFile + "' /></div>");
			i++;
			// 		  <input type='file' name='file' style='display: none;' value='imgName'/>
			// 		  <input type="file" name="file" />

			
// 			$.ajax({
// 				type : 'get',
// 				url : 'admin_product_update',
// 				data : fileName,
// 				success : function(data) {
// 					console.log("성공했다");
// 					location.href = "admin_product_detail?isbn=${list.isbn}";
// 				}
// 			});

// 			$(e.target).css({
// 				"background-image" : "url(" + blobFile + ")",
// 				"outline" : "none",
// 				"background-size" : "100% 100%"
// 			});
		} else {
			alert('이미지가 아닙니다.');
			return;
		}
	}
// 	var fileForm = $("#fileForm").serializeArray();
    $(document).on("click", "#btn1", function(){
    	
    	
        var formData = new FormData($("#fileForm")[0]);
        if(fileList.length > 0){
            fileList.forEach(function(f, index){
                formData.append("fileList" + index, f);
                console.log("fileNames : " + f.name);
                fileNames.push(f.name);
				console.log("fileNames : " + fileNames);
//                 var reader = new FileReader();
//                 reader.readAsDataURL(f);
//                 reader.onload = function () {
//                 	console.log(reader.result);//base64encoded string
//                 };
	    		const img = document.querySelector('#img_src0');
	    		img.src = "resources/upload_img/" + f.name;
            });
            
        }
    	console.log($("#get_data").html().toString());
        var htmlData = $("#get_data").html().toString();
	   	htmlData = htmlData.replace(/\r/g, "");
	   	htmlData = htmlData.replace(/\n/g, "");

	   	
        $("#fileForm").append("<input type='hidden' name='htmlData' value='"+ htmlData + "'/>")
        console.log("formData : " + formData.get("fileList0"));
        var formData2 = new FormData($("#fileForm")[0]);
        
        if(fileList.length > 0){
            fileList.forEach(function(f, index){
                formData2.append("fileList" + index, f);
                console.log("fileNames : " + f.name);
               	
            });
            
        }
        $.ajax({
            url : "admin_product_update",
            data : formData2,
            type:'POST',
            enctype:'multipart/form-data',
            processData:false,
            contentType:false,
            dataType:'json',
            cache:false,
            success:function(res){
                location.href = "admin_product";
            },error:function(res){
            	location.href = "admin_product";
            }
        });
    });
	
});


</script>

</head>
<body>
	<h1>상품수정</h1>
	<div class="contents_area">
		<div class="content_area">
			<form id="fileForm" name="fileForm" action="admin_product_update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="isbn" value="${list.isbn }" />
				<table>
					<tr>
						<th>도서번호</th>
						<td>
							<span>${list.isbn }</span>
						</td>
						<th>저자</th>
						<td><input type="text" name="authors" value="${list.authors }" /></td>
						
					</tr>
					<tr>
						<th>출판사</th>
						<td><input type="text" name="publisher" value="${list.publisher }" /></td>
						<th>출판연도</th>
						<td><input type="text" name="pub_year" value="${list.pub_year }" /></td>
	<!-- 					출판연도는 카카오꺼 가져올지 지금 db에 있는거 쓸지 골라야함 카카오꺼 쓰면 DB에 넣기전엔 수정불가-->
					</tr>
					<tr>
						<th>가격?</th>
						<td><input type="text" name="price" value="${list.price }" /></td>
						<th>재고</th>
						<td><input type="text" name="재고 어디서 가져오냐" value="재고 어디서 가져오나"/></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td colspan="3"><input style="width:100%" type="text" name="title" value="${list.title }" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<div id="get_data" contentEditable="true" name="contents" >
								${list.contents }
								
							</div>
						</td>
					</tr>
	<!-- 				참고자료 -->
	<!-- 				<tr> -->
	<!-- 					<td>첨부</td> -->
	<!-- 					<td colspan="3"><input type="file" name="file" /></td> -->
	<!-- 				</tr> -->
				</table>
				<button id="btn1" type="button" >버튼</button>
				<button type="button" name="isbn" onclick = "location.href = 'admin_product_detail?isbn=${list.isbn}'">취소</button>
			</form>

		</div>
		
	</div>
</body>
</html>