<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="resources/lib/jquery/jquery-3.6.0.min.js"></script>
    <script src="resources/lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="resources/lib/bootstrap/css/bootstrap.min.css">
 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
a{
font: bold;
color: white;
}

li a.nav-link{ 

/* 부트스트랩 적용된거 스타일매길떄 띄어쓰기된부분은 클래스 명에 포함하지 않아야 적용됨 class="nav-link disabled" 이면  nav-link 까지가 클래스명 */
font:bold;
color: black;

}


</style>




</head>
<title>Insert title here</title>
<body>


	<ul class="nav flex-column">
<!--   <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="#">국내도서</a>
  </li> -->
  <li class="nav-item">
    <a class="nav-link disabled" style="background-color:#a8afe5; font-size: medium; font: bold;" >국내도서</a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" href="#">카테고리1</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">카테고리2</a>
  </li>
  <hr />
  <li class="nav-item">
    <a class="nav-link" href="#">카테고리3</a>
  </li>
</ul>



</body>
</html>