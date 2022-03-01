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
	#thumbnail {
		width: 180px;
		height: 220px;
		margin: 0 auto;
	}
	#image {
		max-width: 100%;
		max-height: 100%;
	}
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


var fileList = []; //파일 정보를 담아 둘 배열
var fileNames = [];
// function book_contents() {
// 	var aaa = $("#get_data").html()ffff;
// 	console.log("contents: " + aaa);
// }
$(function() {
	var i = 1;
	
	$("#class").val("${list.class_major}").prop("selected", true);
	
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
				<table>
					<tr>
						<th rowspan="4" class="left">
							<div id="thumbnail" >
								<img src="${list.thumbnail }" id="image" alt="" />
							</div>
							<div>
								<input type="file" name="thumbnail" onchange="setThumbnail(event)" value="등록" />
							</div>
							
						</th>
						<th class="left">
							도서번호
						</th>
						<td>
							<input type="number" name="isbn" value="${list.isbn }" required/>
						</td>
						<th class="left">
							재고
						</th>
						<td>
							<input type="number" name="stock" value="${list.stock }" />
						</td>
					</tr>
					<tr>
						<th class="left">
							제목
						</th>
						<td colspan="3">
							<input type="text" name="title" value="${list.title }" />
						</td>
						
					</tr>
					<tr>
						<th class="left">
							가격
						</th>
						<td colspan="3">
							<input type="number" name="price" value="${list.price }" />
						</td>
					</tr>
					<tr>
						<th class="left">
							키워드
						</th>
						<td colspan="3">
							<input type="text" name="keyword" value="${list.keyword }" />
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
							<input type="text" name="authors" value="${list.authors }" />
						</td>
					</tr>
					<tr>

						<th class="left">
							출판연도
						</th>
						<td>
							<input type="number" name="pub_year" value="${list.pub_year }" />
						</td>
						
						<th class="left">
							출판사
						</th>
						<td colspan="2">
							<input type="text" name="publisher" value="${list.publisher }" />
						</td>
					</tr>
					<tr>
						<th colspan="5">
							내용
						</th>
					</tr>
					<tr>
						<td colspan="5">
							<div id="get_data" style="min-height: 300px;" contentEditable="true" name="contents" >
								${list.contents }
							</div>
						</td>
					</tr>				
					
				</table>
				<div id="buttons">
					<button id="btn1" type="button" >확인</button>
					<button type="button" name="isbn" onclick = "location.href = 'admin_product_detail?isbn=${list.isbn}'">취소</button>
				</div>
			</form>

		</div>
		
	</div>
</body>
</html>