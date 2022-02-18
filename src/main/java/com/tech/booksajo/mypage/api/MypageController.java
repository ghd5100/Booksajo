package com.tech.booksajo.mypage.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.booksajo.mypage.service.MypageService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@RequestMapping(value = "/mypage/api/getList", method = RequestMethod.GET  )
	@ResponseBody
	public List<Map<String,Object>> getList(){
		return service.getList();
	}
	
	@RequestMapping("/mypage")
	public String search() {
		
		return "mypage";
	}
	

	
	
	@RequestMapping("/mypage_center2")
	public String mypage_center2() {
		
		return "mypage_center2";
	}
	
	
	
}
