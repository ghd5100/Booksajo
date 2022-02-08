$(function() {
    
	//best
	
	var best_count = 1;
	
	$(".best_next").click(function() {
		best_next();
	});
	$(".best_prev").click(function() {
		best_prev();
	});
	
	function best_next() {
		
		if (best_count == 1) {
			for (var i = 0; i < 4 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 4 * best_count; i < 8 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
			best_count++;
		} else if (best_count == 2) {
			best_count--;
			for (var i = 4 * best_count; i < 8 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 0; i < 4 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
		}
	}
	
	function best_prev() {
		
		if (best_count == 1) {
			for (var i = 0; i < 4 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 4 * best_count; i < 8 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
			best_count++;
		} else if (best_count == 2) {
			best_count--;
			for (var i = 4 * best_count; i < 8 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 0; i < 4 * best_count; i++) {
				var a = i + 1;
				$(".best_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
		}
	}
	
	$(".best_content").mouseover(function() {
		$(".best_controller").css("display", "block");
	});
	$(".best_content").mouseleave(function() {
		$(".best_controller").css("display", "none");
	});	
	
	// today
	
	var today_count = 1;
	
	$(".today_next").click(function() {
		today_next();
	});
	$(".today_prev").click(function() {
		today_prev();
	});
	
	function today_next() {
		
		if (today_count == 1) {
			for (var i = 0; i < 4 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 4 * today_count; i < 8 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
			today_count++;
		} else if (today_count == 2) {
			today_count--;
			for (var i = 4 * today_count; i < 8 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 0; i < 4 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
		}
	}
	
	function today_prev() {
		
		if (today_count == 1) {
			for (var i = 0; i < 4 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 4 * today_count; i < 8 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
			today_count++;
		} else if (today_count == 2) {
			today_count--;
			for (var i = 4 * today_count; i < 8 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "none");				
			}
			for (var i = 0; i < 4 * today_count; i++) {
				var a = i + 1;
				$(".today_content_list li:" + "nth-child(" + a + ")").css("display", "block");				
			}
		}
	}
	
	$(".today_content").mouseover(function() {
		$(".today_controller").css("display", "block");
	});
	$(".today_content").mouseleave(function() {
		$(".today_controller").css("display", "none");
	});	
	
	
	//advSlide
	
//	$(".content_list > li").mouseover(function() {
//		$(this).css("border", "solid 5px #888");
//	});
//	
//	$(".content_list > li").mouseleave(function() {
//		$(this).css("border", "solid 1px #888");
//	});
	$(".adv_slide").mouseover(function() {
		$(".adv_controller").css("display", "block")
		$(".adv_btns").css("display", "block");
	});
	$(".adv_slide").mouseleave(function() {
		$(".adv_controller").css("display", "none")
		$(".adv_btns").css("display", "none");
	});	
	
	var imgs;
    var img_count;
    var img_position = 1;
    var img_size = 1000;
    imgs = $(".adv_list");
    img_count = imgs.children().length;
    
    
    $(".next").click(function() {
        next();
        active();
    });

    $(".prev").click(function() {
        back();
        active();
    });

    $("#btn1").click(function() {
        img_position = 1;
        btn();
        active();
    });

    $("#btn2").click(function() {
        img_position = 2;
        btn();
        active();
    });

    $("#btn3").click(function() {
        img_position = 3;
        btn();
        active();
    });

    function active() {
        
        for (i = 1; i < 4; i++) {
            // $("#btn" + (i + 1)).attr("btns active", "btns");
            $("#btn" + i).removeClass("btns")
        }
        $("#btn" + img_position).addClass("btns");
    }

    function btn() {
            imgs.animate({
                left: (1 - img_position) * img_size + 'px'
            });
    }

    function back() {
        if (1 < img_position) {
            img_position--;
            imgs.animate({
                left: (1 - img_position) * img_size + 'px'
            });
        } else if (1 == img_position) {
            img_position = img_count;
            imgs.animate({
                left: (1 - img_position) * img_size + 'px'
            });
        }
    }

    function next() {
        if(img_count > img_position) {
            img_position++;
            imgs.animate({
                left: (1 - img_position) * img_size + 'px'
            });
        } else if (img_count == img_position) {
            img_position = 1;
            imgs.animate({
                left: (1 - img_position) * img_size + 'px'
            });
        }
    }

});

