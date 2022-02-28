<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<!-- 부트스트랩 css 사용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">



<link rel="stylesheet" type="text/css"
	href="resources/css/payment_title.css">



<div id="paymenttitle">

<!-- bsjusers 테이블에서 가져오기 -->

	<table style="width: 100%;">



		<tr>
			<td colspan="4" height="30px"><img src="resources/img/shoplistbanner.png" width="100%"/></td>
		</tr>
		<tr>
			<td width="10%" height="30px">${payinfo.user_nickname } 의 통장현황</td>
			<td width="10%">쿠폰:${payinfo.user_coupon }장</td>
			<td width="10%">통합포인트:${payinfo.user_point }P</td>
			<td width="70%">etc</td>
		</tr>
	</table>
</div>

<hr />