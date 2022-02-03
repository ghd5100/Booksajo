/*스트립트 연동되는거 jsext.html예제보긔*/


var board = {
    init : function () {
	   //초기 
	  //board.getList();
    	console.log("보드 자바스크립트 들어옴");
    	board.makeRow();
     },
 

     makeRow : function(){
    	
		$.ajax({
	        type: 'POST',
	        url : 'https://dapi.kakao.com/v3/search/book?target=title&query=' + keyword + '&size=50',
	           headers: {
	     		 Authorization : 'KakaoAK 2ecf5febe1e05d5d376370e2b4d6c779'
	            },
	        dataType: 'json',
	        contentType: 'application/json; charset=utf-8',
	    }).done(function (data) {
	      
	    	'<tr height="150px">';
	    	'<td>'+ data.documents[k].thumnail + '</td>';
	    	'<td rowspan="4">';
	    	'<p>' + data.documents[k].title + '</p>';
	    	'<p>' + data.documents[k].authors + '</p>';
	    	'<p>' + data.documents[k].publisher + '</p>';
	    	'<p>' + data.documents[k].title + '</p>';
	    	'</td>';
	    	'<td>'+ 평점 + '</td>';
	    	'<td>'+ data.documents[k].price + '</td>';
	    	'<td>'+ 수량/장바구니 + '</td>';
			'</tr>';
			
			
	        for(k=1;k<=data.documents.length;k++){
	            //document.write("<h"+i+">Header "+i+"</h"+i+">");
	            document.write('<tr height="150px">');
	            document.write('<td>'+ data.documents[k].thumnail + '</td>');
	            document.write('<p>' + data.documents[k].title + '</p>');
	            document.write('<p>' + data.documents[k].authors + '</p>');
	            document.write('<p>' + data.documents[k].publisher + '</p>');
	            document.write('<p>' + data.documents[k].title + '</p>');
	            document.write('</td>');
	            document.write('<td>'+ 평점 + '</td>');
	            document.write('<td>'+ data.documents[k].price + '</td>');
	            document.write('<td>'+ 수량/장바구니 + '</td>');
	            document.write('</tr>');
	        }
			
			
			$('#getList').done();
			
/*	    	for(k in data.documents.length-1; k++){
	    		console.log(data.documents[k].authors);
	    		console.log(data.documents[k].contents);
	    		var titlefind = data.documents[k].title;
	    }*/
	    	
	    	console.log(data.meta.pageable_count);
	      
	    }).fail(function (error) {
	    });
    	
	
    	

   }
 
}

board.init();