/*스트립트 연동되는거 jsext.html예제보긔*/

//div크기 펼쳐지는 함수
var flag = true;
function divheight() {

	if (flag) {
		var y = document.getElementById("d3");
		y.style.height = "35px";
		flag = false;
	} else {
		var y = document.getElementById("d3");
		y.style.height = "70px";
		flag = true;
	}

}

var flag2 = true;
function divheight2() {

	if (flag2) {
		var x = document.getElementById("d6");
		x.style.height = "35px";
		flag2 = false;
	} else {
		var x = document.getElementById("d6");
		x.style.height = "70px";
		flag2 = true;
	}

}

var search = {
	init : function() {// 이 함수는 도큐먼트 레디 같은거라 보면됨. 매개변수 넣을수없음.
		var keywords = '${search}';
		console.log(keywords);
	},
	makeRow : function(keyword2) {

		console.log("makeRow함수 들어옴");
		console.log("keyword:" + keyword);

		$
				.ajax(
						{
							type : 'POST',
							url : 'https://dapi.kakao.com/v3/search/book?target=title&query='
									+ keyword2 + '&size=50',
							headers : {
								Authorization : 'KakaoAK 2ecf5febe1e05d5d376370e2b4d6c779'
							},
							dataType : 'json',
							contentType : 'application/json; charset=utf-8',
						}).done(
						function(data) {

							for (var k = 1; k <= data.documents.length; k++) {

								'<tr height="150px">';
								'<td><a href=' + data.documents[k].thumbnail
										+ '></a></td>';
								'<td rowspan="4">';
								'<p>' + data.documents[k].title + '</p>';
								'<p>' + data.documents[k].authors + '</p>';
								'<p>' + data.documents[k].publisher + '</p>';
								'<p>' + data.documents[k].title + '</p>';
								'</td>';
								'<td>평점</td>';
								'<td>' + data.documents[k].price + '</td>';
								'<td>수량/장바구니</td>';
								'</tr>';

							}

							/*
							 * for(var k=1;k<=data.documents.length;k++){
							 * //document.write("<h"+i+">Header "+i+"</h"+i+">");
							 * document.write('<tr height="150px">');
							 * document.write('<td>'+
							 * data.documents[k].thumnail + '</td>');
							 * document.write('<p>' + data.documents[k].title + '</p>');
							 * document.write('<p>' +
							 * data.documents[k].authors + '</p>');
							 * document.write('<p>' +
							 * data.documents[k].publisher + '</p>');
							 * document.write('<p>' + data.documents[k].title + '</p>');
							 * document.write('</td>'); document.write('<td>'+
							 * 평점 + '</td>'); document.write('<td>'+
							 * data.documents[k].price + '</td>');
							 * document.write('<td>'+ 수량/장바구니 + '</td>');
							 * document.write('</tr>'); }
							 */

							/*
							 * for(k in data.documents.length-1; k++){
							 * console.log(data.documents[k].authors);
							 * console.log(data.documents[k].contents); var
							 * titlefind = data.documents[k].title; }
							 */

							console.log(data.meta.pageable_count);

						}).fail(function(error) {
				});

	}

}

search.init();