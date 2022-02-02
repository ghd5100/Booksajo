
var board = {
    init : function () {
	   //초기 
	  //board.getList();
    	console.log("보드 자바스크립트 들어옴");
    	board.loadContent();
     },
 

    loadContent : function(){
    	
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
			
			$('#getList').done();
			
/*	    	for(k in data.documents.length-1; k++){
	    		console.log(data.documents[k].authors);
	    		console.log(data.documents[k].contents);
	    		var titlefind = data.documents[k].title;
	    }*/
	    	
	    	console.log(data.meta.pageable_count);
	      
	    }).fail(function (error) {
	    });
    	
	
    	
/*	        makeRow : function (data){
    	var html = '';
    	for(var k=0;k<data.length-1;k++){ 
    		html += '<tr>' ;  
    		html +=	'<th scope="row">' + data[k].BID + '</th>';
    		html += '<td>'+data[k].BNAME+'</td>';
    		html += '<td>' + '<span style="cursor:pointer" name="contentLink" value='+ data[k].BID +'>'+ data[k].BTITLE + '</span> </td>';
    		html += '<td>' + data[k].BDATE +  '</td>';
    		html += '</tr>' ;
    	}
    	
    	html += '<tr>';
    	html += '<td colspan="5"> <button id="writeButton">글작성</button> </td>';
    	html += '</tr>';
    	
    	$('#tableRows').html(html);
    }
    */
   }
 
}

board.init();