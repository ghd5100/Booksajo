<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/login_page/signIn.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
#content {
	width: 800px;
	margin: 0 auto;
	float: none;
	height: 800px;
	border: solid 1px gray;
}

table {
	width: 650px;
	height: 200px;
}

.title {
	font-size: 14px;
	text-align: left;
	padding-left: 100px;
	color: #555;
}

input {
	width: 225px;
	height: 30px;
	margin-left: 50px;
	
		
  font-size: 15px;
  border: 0;
  border-radius: 5px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

td {
	text-align: left;
	padding-left: 200px;
}

#right {
	padding-left: 80px;
}

#img1 {
	filter: opacity(0.6) drop-shadow(0 0 0 green);
	width: 100px;
	height: 40px;
	margin-top: 30px;
}

#submitbtn {
	border: 0;
	outline: none;
	width: 100px;
	height: 100px;
	border-radius: 5px;
	font-size: 14px;
	margin: 30px;
	box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px
		rgb(237, 237, 237);
	transition: 0.3s;
}

#postbtn {
	margin-left: 5px;
	border: 0;
	outline: none;
	width: 120px;
	height: 25px;
	border-radius: 5px;
	font-size: 14px;
	box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px
		rgb(237, 237, 237);
	transition: 0.3s;
}

#submitbtn:hover, #postbtn:hover {
	box-shadow: -3px -3px 3px rgb(172, 172, 172), 3px 3px 3px
		rgb(237, 237, 237);
	transition: 0.3s;
}

#gendersel {
	width: 224px;
	height: 30px;
	font-size: 13px;
}

#span2 {
	text-align: center;
	font-size: 13px;
}
#errorpos{
	padding-left: 175px;
	font-size: 14px;
	font-family:impact;
	letter-spacing:3px;
	color: #555;
}



</style>

</head>
<body>

	<div id="loginProc">
		<form action="loginProc" method="post">


			<legend>
				<img id="img1" src="resources/img/logo3.png" /><br /> <span
					style="font-size: 20px; font-family: impact; color: #555;">Member
					Login</span>

			</legend>
			
			<table>
				<tr>	
					<td class="right" colspan="3">
						<c:if test="${error ne null}">
							<div id="errorpos">${error }</div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="title">아이디</td>
					<td class="right" colspan="2"><input id="id" name="id"
						type="text" required autofocus></td>
				</tr>
				<tr>
					<td class="title">비밀번호</td>
					<td class="right" colspan="2"><input id="pwd" name="pwd"
						type="password" required></td>
				</tr>
				<tr>
					<td class="right" colspan="3">
						<div id="span2">비번찾기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ID찾기  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="signIn">회원가입</a></div>
					</td>
				</tr>

			</table>
			<input id="submitbtn" type="submit" value="L o g i n"
				style="width: 380px; margin: 20px 0 0 45px; height: 35px; font-size: 15px; font-family: impact; color: #555" />
		</form>
	</div>
</body>
</html>


