	  $(document).on("click", "#searchbutton", function() {
		   $('#searchbutton').load('/common/search/search_table',function(){
			   board.init();
		   });
	  });