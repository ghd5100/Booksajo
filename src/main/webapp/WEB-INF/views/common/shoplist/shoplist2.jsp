<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<h3>장바구니 페이지</h3>

<%-- isbn: ${isbn13} --%>


<c:forEach items="${shoplist}" var="shoplist">

<table>
<tr>
<td><img src="${shoplist.bsjselectbook_url}" alt="" /></td>
<td>${shoplist.bsjselectbook_title}</td>
<td>${shoplist.bsjselectbook_price}</td>
<td>${shoplist.bsjselectbook_status}</td>
</tr>
</table>
${shoplist.bsjselectbook_isbn}


</c:forEach>


</html>