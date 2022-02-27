<%@ page language="java" contentType="text/html; charset=ISO-2022-KR"
    pageEncoding="ISO-2022-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<h3>payment_approve</h3>


<%
String tid=request.getParameter("tid");
System.out.println("jsp에서 받은 tid:"+tid);
%>

<script>

$(document)
.ready(
		function() {	
//카카오페이 결제
function kakaoapprove(){
	
	$.ajax({
		url:"paymentApprove",
		dataType:"json"
	}).done(function(resp){
		if(resp.status === 500){
			alert("카카오페이승인 실패");
		} else{
			//resp.
			console.log(resp);
			
		}
	}).fail(function(error){
		alert(JSON.stringify(error));
	}); 

}
		});
	

</script>



</html>