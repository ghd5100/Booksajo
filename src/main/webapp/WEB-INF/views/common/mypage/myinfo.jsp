<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-2022-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/myinfo.css">


<div id="cuponcheck">

<table style="width: 100%" height="90px">
<tr>
<td id="usertab" style="text-align: left; padding-left: 20px; width: 30%;">${myinfo.user_nickname}&nbsp;&nbsp;$)C4T</td>
<td>$)CDmFy</br>${myinfo.user_coupon}</td>
<td>$)CEkGUFw@NF.</br>${myinfo.user_point}</td>
<td>$)C?9D!1]</br></td>
</tr>
</table>
</div>


<div id="myinfo">
	$)CH8?xA$:8<vA$
	<hr />
</div>

<table style="width: 100%" height="500px">
	<caption id="tablecap">$)CGJ<v@T7B;gGW</caption>
	<tr>
		<td style="width: 10%;" id="selname">$)C>F@L5p</td>
		<td colspan="3">${myinfo.user_id}</td>

	</tr>
	<tr>
		<td id="selname">$)C@L8'</td>
		<td colspan="3">${myinfo.user_name}</td>

	</tr>
	<tr>
		<td id="selname">$)C9}A$;}3b?y@O</td>
		<td style="width: 30%;">
		<select name="year" id="year">
		<option value="">1990</option>
		<option value="">1990</option>
		</select>$)C3b
		<select name="month" id="month">
		<option value="">07</option>
		<option value="">08</option>
		</select>$)C?y
		<select name="day" id="day">
		<option value="">28</option>
		<option value="">29</option>
		</select>$)C@O
		</td>
		<td id="selname">$)C<::0</td>
		<td style="width:40%;"><input type="radio" />$)C?)<: <input type="radio" />32<:</td>
	</tr>
	<tr>
		<td colspan="4" id="selphone">$)C?,6tC3(@|H-9xH#, H^4kFy9xH#) A_ GO3*4B 9]5e=C @T7BGO<E>_ GU4O4Y.</td>
	</tr>
	<tr>
		<td id="selname">E-mail</td>
		<td>${myinfo.user_email}</td>
		<td id="selname">$)C@|H-9xH#</td>
		<td>${myinfo.user_phone}</td>
	</tr>
	<tr>
		<td id="selname" colspan="1">$)C86DIFC(1$0m)</br><v=E5?@G ?):N</td>
		<td colspan="3">
				<input type="checkbox" />$)C86DIFC(1$0m) <v=E5?@G ?):N(<1EC)
		$)C0"A> GR@NG}EC, A&H^@L:%F./1bH9@| 5n@G 3;?k@; 9^@8=C0Z=@4O1n?
		<table id="innertable" style="width: 90%; height: 80px;">
		<tr>
		<td>SMS</td>
		<td><input type="radio" />$)C<v=E</td>
		<td>$)C5?@G3/B%.EW@L:m?!<- 0!A.?@1b</td>
		</tr>
		<tr>
		<td>Email</td>
		<td><input type="radio" />$)C<v=E</td>
		<td>$)C3/B% 0!A.?@1b sysdate</td>
		</tr>
		</table>
		</td>

	</tr>
	<tr>
		<td id="selname">$)C3W@L9v>F@L5p ?,5?</td>
		<td>14</td>
		<td>15</td>
		<td>16</td>
	</tr>
<!-- 	
	<tr>
		<td id="selname">$)C3W@L9v>F@L5p ?,5?</td>
		<td>22</td>
		<td>23</td>
		<td>24</td>
	</tr>
 -->
</table>


<table style="width: 100%" height="300px">
	<caption id="tablecap">$)C<1EC@T7B;gGW</caption>
	<tr>
		<td id="selname" style="width: 10%;">$)C1b:;AV<R [A}]</td>
		<td>
			$)CAV<R8& 557N8m AV<R C<0h?! 8B0T :/0fGXAV<<?d!<br>
			<input type="text" /><input type="button" value="$)C?lFm9xH#"/><br>
			<input type="text" /><input type="text" /><br>
			$)C@'@G AV<R8& <vA$ GO8i AV<R7O@G 1b:; AV<R55 :/0f5K4O4Y.<br>
			$)C1b:; AV<R4B H8?xA$:80|8.>3*@GAV<R7O?!<- <3A$ GO=G <v @V=@4O4Y.<br>
			$)C:; AV<R4B <-:q=:, 0fG0 9h<[@; @'GQ 8q@{ 5n H8?x0|8.8& @'GX @L?k/@z@e5G8g, H8?xE;Ep =C ;hA&5K4O4Y.<br>
		</td>
	</tr>
	<tr>
		<td id="selname">$)C03@NA$:8</br>@/H?1b0#A&</td>
		<td><input type="radio" />1$)C3b<input type="radio" />33b<input type="radio" />53b<input type="radio" />E;Ep=C1nAv</td>
	</tr>
	<tr>
		<td id="selname">$)CA&3@Z A$:8A&0x 5?@G</td>
		<td><table id="innertable" style="width: 90%; height: 80px;">
		<tr>
		<td>$)CA&H^C3</td>
		<td>$)C5?@G?):N</td>
		<td>$)CC38.3/B%</td>
		</tr>
		</table></td>
	</tr>
</table>


</html>