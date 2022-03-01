package com.tech.booksajo.mainstore.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class mainStoreController {
	
/*// 이선아 구현중
	@RequestMapping("/reviewWrite")
	public String reviewWrite() {
		System.out.println("reviewWrite Controller");
		
		return "reviewWrite";
	}
	
	@RequestMapping("/preview")
	public String preview() {
		System.out.println("preview Controller");
		
		return "preview";
	}*/

	@RequestMapping("/mainStore1")
	public String mainStore1() {
		System.out.println("mainStore1 화면켜줘");
		return "mainStore1";
	}
	@RequestMapping("/mainStore2")
	public String mainStore2() {
		System.out.println("mainStore2 화면켜줘");
		return "mainStore2";
	}
	@RequestMapping("/mainStore3")
	public String mainStore3() {
		System.out.println("mainStore3 화면켜줘");
		return "mainStore3";
	}
}




















