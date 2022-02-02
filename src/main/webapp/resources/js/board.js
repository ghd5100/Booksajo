
var board = {
    init : function () {
	   //초기 
	   board.getList();
    	
        
      //버튼 이벤트들
        
      //검색버튼 클릭시
  	  $("#btn_search").on("click", function () {
  		  	board.getList();
      });
    	
	  $(document).on("click", "button[name=listButton]", function() {
		   board.getList(this.value);
	  });
	 
	  $(document).on("click", "#writeButton", function() {
		   $('#board').load('/common/search/board/write_view',function(){
			   board.init();
		   });
	  });

	  $(document).on("click", "span[name=contentLink]", function() {
		   $('#board').load('/content_view/' + $(this).attr("value") ,function(){
				  board.loadContent();	  
		   });
	  });


		$("#writeSubmitButton").on("click", function () {
			board.submit();
	    });
		
	 	$("#listButton").on("click", function () {
		  $('#board').load('/common/search/board/board');  
	 	});

     },
     
     
     
     getList : function(value){
		var datas = {
			searchKeyword : $('#searchKeyword').val()
			,btitle : $("input:checkbox[name=btitle]").is(":checked")
			,bcontent : $("input:checkbox[name=bcontent]").is(":checked")
		}
		
		if(value != ''){
			datas.listValue = value;
		}
	     $.ajax({
	         type: 'GET',
	         url: '/search',
	         data: JSON.stringify(datas),
	         dataType: 'json',
	         contentType: 'application/json; charset=utf-8',
	     }).done(function (data) {
	    	 board.makeRow(data);
	    	 board.makePageList(data);
			 
	     }).fail(function (error) {
	     });
	     
	     
	},
	

    makeRow : function (data){  //위에 getList에서 데이타 없어서 그 얻은 데이타 가지고 자료 테이블 행 맹그ㅡㄴ것임
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
    },
    makePageList : function (data){
    		var info = data[data.length-1] ;
    		
    		var pageEnd = info.pageEnd;
    		var totPage = info.totPage;
    		var page = info.page;
    		
    		var html = '';
    		for(var i = info.pageStart;i<=pageEnd;i++){
    			if(i == page){
    				html += '<span style="color:red; font-weight: bold;">' + i + '&nbsp;</span>';	
    				continue;
    			}
    			html += '<span  style="text-decoration: none;cursor:pointer" name="listButton"  onclick=" board.getList('+i+')"  > ' + i  + ' </span>&nbsp;'
    		}
    		
    		$('#pageList').html(html);
    		
    		var listHtml = '';
			if(totPage > page){
				var next = parseInt(page) + parseInt(1);
				listHtml +=	'<button name="listButton" value="'+ next +'">[다음]</button>';
				listHtml +=	'<button name="listButton" value="'+ info.totPage + '">[마지막]</button>';
			}else if(page > 1){
				var previous = parseInt(page) - parseInt(1);
				listHtml += '<button name="listButton" value="'+ 1 +'">[처음]</button>';
				listHtml += '<button name="listButton" value="'+ previous + '">[이전]</button>';
			}
			$('#listPanel').html(listHtml);
    		
    },
    loadContent : function(){
	     $.ajax({
	         type: 'GET',
	         url: '/content_view/load/'+ $('#bidd').val(),
	         dataType: 'json',
	         contentType: 'application/json; charset=utf-8',
	     }).done(function (data) {
	    	 	$('#bid').text(data.BID);
	    		$('#bhit').text(data.BHIT);
	    		$('#bname').text(data.BNAME);
	    		$('#btitle').text(data.BTITLE);
	    		$('#bcontent').text(data.BCONTENT);
	     }).fail(function (error) {
	     });
   },
   submit : function(){
       $.ajax({
           type: 'POST',
           url: '/write',
           data : JSON.stringify ( $("#writeForm").serializeObject()),
           contentType: 'application/json; charset=utf-8',
       }).done(function (data) {
       	   $('#board').load('/app/board/web/board');  
       }).fail(function (error) {
       });

   }
}

board.init();